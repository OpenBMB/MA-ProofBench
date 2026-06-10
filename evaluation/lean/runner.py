import json
from collections import defaultdict
from pathlib import Path
from typing import Any, Dict, List, Optional

import numpy as np

from ..config import LEAN_SERVER_HOST, LEAN_SERVER_PORT
from ..data_utils import (
    attach_predictions,
    compute_pass_at_k,
    extract_nl,
    load_jsonl,
    write_jsonl,
)
from .client import compile_lean_codes
from .server import wait_for_lean_server
from .utils import check_statement_tampered, normalize_lean_code, static_precheck


def build_eval_ks(num_samples: int) -> List[int]:
    return sorted(k for k in {1, 4, num_samples} if k > 0)


def run_eval(
    output_path: str,
    dataset_paths: List[str],
    num_samples: int,
    predictions_path: Optional[str],
    limit: Optional[int],
    splits: Optional[List[str]] = None,
) -> None:
    dataset = load_jsonl(dataset_paths, splits=splits)
    if limit is not None:
        dataset = dataset[:limit]

    existing_map: Dict[tuple[Any, int], Dict[str, Any]] = {}
    output_file = Path(output_path)
    if output_file.exists():
        try:
            existing_rows = load_jsonl([output_path])
            for row in existing_rows:
                if isinstance(row, dict) and "id" in row and "sample_id" in row:
                    sample_id = int(row["sample_id"])
                    existing_map[(row["id"], sample_id)] = row
            if existing_map:
                print(f"Found existing evaluation output; resuming from: {output_path}")
        except Exception as e:
            print(f"Failed to read existing evaluation output; running full evaluation: {e}")

    examples = []
    for idx, data in enumerate(dataset):
        example = dict(data)
        example["problem_id"] = idx
        example["informal_statement"] = extract_nl(data)
        examples.append(example)

    if not predictions_path:
        raise ValueError("--predictions_path is required for evaluation")
    predictions = load_jsonl([predictions_path])

    candidates_list = attach_predictions(examples, predictions)

    entries = []
    missing_candidates = 0
    request_id = 0
    for ex, candidates in zip(examples, candidates_list):
        if not candidates:
            missing_candidates += 1
            candidates = []
        if len(candidates) < num_samples:
            candidates = candidates + [""] * (num_samples - len(candidates))
        candidates = candidates[:num_samples]
        for sample_id, lean_code in enumerate(candidates):
            lean_code = normalize_lean_code(lean_code, ex["header"])
            entries.append(
                {
                    "problem_id": ex["problem_id"],
                    "sample_id": sample_id,
                    "id": ex["id"],
                    "split": ex["split"],
                    "topic": ex["topic"],
                    "tag": ex["tag"],
                    "benchmark_name": ex["benchmark_name"],
                    "lean_code": lean_code,
                    "formal_statement": ex["formal_statement"],
                    "informal_statement": ex["informal_statement"],
                    "request_id": request_id,
                }
            )
            request_id += 1

    if missing_candidates > 0:
        print(f"Missing Lean candidates for {missing_candidates} examples.")

    print("Running static precheck...")
    all_compile_results: List[Optional[Dict[str, Any]]] = [None] * len(entries)
    compile_indices: List[int] = []
    compile_codes: List[str] = []
    precheck_fail_count = 0

    for idx, entry in enumerate(entries):
        ok, reason = static_precheck(entry["lean_code"], entry["formal_statement"])
        if not ok:
            precheck_fail_count += 1
            all_compile_results[idx] = {
                "pass": False,
                "complete": False,
                "system_errors": f"static_precheck: {reason}",
                "time": 0,
                "verified_code": entry["lean_code"],
                "errors": [],
                "warnings": [],
                "infos": [],
                "sorries": [],
                "tactics": [],
            }
        else:
            compile_indices.append(idx)
            compile_codes.append(entry["lean_code"])

    if precheck_fail_count > 0:
        print(f"Static precheck rejected {precheck_fail_count}/{len(entries)} candidates.")
    print(f"Static precheck complete: {len(compile_codes)}/{len(entries)} candidates will be compiled.")

    if compile_codes:
        print("Running Lean verification with Kimina Lean Server...")
        if not wait_for_lean_server(LEAN_SERVER_HOST, LEAN_SERVER_PORT, timeout=120, check_interval=2):
            print("Lean Server did not become ready; aborting evaluation.")
            return
        compiled = compile_lean_codes(compile_codes)
        for local_idx, global_idx in enumerate(compile_indices):
            all_compile_results[global_idx] = compiled[local_idx]
    else:
        print("All candidates failed static precheck; skipping Lean verification.")

    if any(result is None for result in all_compile_results):
        raise RuntimeError("missing compile result")
    compile_results: List[Dict[str, Any]] = [result for result in all_compile_results if result is not None]
    results = []
    compile_pass_by_bench = defaultdict(list)
    compile_complete_by_bench = defaultdict(list)
    compile_pass_all = []
    compile_complete_all = []
    for entry, compile_result in zip(entries, compile_results):
        compile_pass = bool(compile_result.get("pass"))
        compile_complete = bool(compile_result.get("complete"))
        entry["compile_pass"] = compile_pass
        entry["compile_complete"] = compile_complete
        entry["compile_result"] = compile_result
        compile_pass_all.append(compile_pass)
        compile_complete_all.append(compile_complete)
        compile_pass_by_bench[entry["benchmark_name"]].append(compile_pass)
        compile_complete_by_bench[entry["benchmark_name"]].append(compile_complete)
        existing = existing_map.get((entry["id"], entry["sample_id"]))
        if existing and existing.get("request_status") == "success":
            existing["problem_id"] = entry["problem_id"]
            existing["sample_id"] = entry["sample_id"]
            existing["id"] = entry["id"]
            existing["split"] = entry["split"]
            existing["topic"] = entry["topic"]
            existing["tag"] = entry["tag"]
            existing["benchmark_name"] = entry["benchmark_name"]
            existing["informal_statement"] = entry["informal_statement"]
            existing["lean_code"] = entry["lean_code"]
            existing["formal_statement"] = entry["formal_statement"]
            existing["compile_pass"] = compile_pass
            existing["compile_complete"] = compile_complete
            existing["compile_result"] = compile_result
            results.append(existing)
        else:
            results.append(
                {
                    "problem_id": entry["problem_id"],
                    "sample_id": entry["sample_id"],
                    "id": entry["id"],
                    "split": entry["split"],
                    "topic": entry["topic"],
                    "tag": entry["tag"],
                    "benchmark_name": entry["benchmark_name"],
                    "informal_statement": entry["informal_statement"],
                    "lean_code": entry["lean_code"],
                    "formal_statement": entry["formal_statement"],
                    "compile_pass": compile_pass,
                    "compile_complete": compile_complete,
                    "compile_result": compile_result,
                    "request_status": "success",
                    "error": None,
                }
            )

    write_jsonl(output_path, results)

    tampered_set: set[tuple[int, int]] = set()
    tampered_details: list[dict] = []
    for entry, result_row in zip(entries, results):
        if not result_row.get("compile_complete", False):
            continue
        is_tampered, diff_info = check_statement_tampered(entry["lean_code"], entry["formal_statement"])
        if is_tampered:
            pid, sid = entry["problem_id"], entry["sample_id"]
            tampered_set.add((pid, sid))
            detail: dict = {
                "benchmark": entry["benchmark_name"],
                "problem_id": pid,
                "sample_id": sid,
            }
            if diff_info:
                detail["original"] = diff_info["original"]
                detail["tampered"] = diff_info["tampered"]
            tampered_details.append(detail)
    if tampered_details:
        print(f"Statement integrity check found {len(tampered_details)} candidate(s) with changed theorem statements.")
        for t in tampered_details:
            print(f"    [{t['benchmark']}] pid={t['problem_id']} sid={t['sample_id']}")
            if "original" in t:
                print(f"      original: {t['original']}")
                print(f"      changed: {t['tampered']}")

    compile_complete_grouped = defaultdict(list)
    clean_complete_grouped = defaultdict(list)
    for item in results:
        pid = item["problem_id"]
        complete = item.get("compile_complete", False)
        compile_complete_grouped[pid].append(complete)
        clean = complete and (pid, item["sample_id"]) not in tampered_set
        clean_complete_grouped[pid].append(clean)

    eval_ks = build_eval_ks(num_samples)
    compile_complete_k = {k: [] for k in eval_ks}
    compile_complete_by_bench_k = {k: defaultdict(list) for k in eval_ks}
    clean_complete_k = {k: [] for k in eval_ks}
    clean_complete_by_bench_k = {k: defaultdict(list) for k in eval_ks}
    for ex in examples:
        pid = ex["problem_id"]
        bench_name = ex["benchmark_name"]
        compile_complete_list = compile_complete_grouped.get(pid, [])
        clean_complete_list = clean_complete_grouped.get(pid, [])
        for k in eval_ks:
            compile_complete_at_k = compute_pass_at_k(compile_complete_list, k)
            compile_complete_k[k].append(compile_complete_at_k)
            compile_complete_by_bench_k[k][bench_name].append(compile_complete_at_k)
            clean_complete_at_k = compute_pass_at_k(clean_complete_list, k)
            clean_complete_k[k].append(clean_complete_at_k)
            clean_complete_by_bench_k[k][bench_name].append(clean_complete_at_k)

    def _fmt_pct(v: float) -> str:
        return f"{v * 100:.2f}"

    def _print_table(
        k: int,
        compile_complete_by_bench_at_k,
        compile_complete_overall,
    ) -> None:
        all_benches_in_data = set(compile_complete_by_bench_at_k.keys())
        ordered = [(b, b) for b in sorted(all_benches_in_data)]

        header_names = ["AVG"] + [label.split("\n")[0] for _, label in ordered]
        header_subs = [""] + ["\n".join(label.split("\n")[1:]) for _, label in ordered]
        col_count = len(header_names)

        complete_vals = []
        complete_vals.append(_fmt_pct(compile_complete_overall))
        for key, _ in ordered:
            complete_v = compile_complete_by_bench_at_k.get(key)
            complete_vals.append(_fmt_pct(float(np.mean(complete_v))) if complete_v else "-")

        col_widths = []
        for i in range(col_count):
            w = max(
                len(header_names[i]),
                max((len(s) for s in header_subs[i].split("\n")), default=0) if header_subs[i] else 0,
                len(complete_vals[i]),
            )
            w = max(w, 14)
            col_widths.append(w)

        sep = "+" + "+".join("-" * (w + 2) for w in col_widths) + "+"

        print(sep)
        row = "|"
        for i, name in enumerate(header_names):
            row += f" {name:^{col_widths[i]}} |"
        print(row)

        has_sub = any(header_subs)
        if has_sub:
            row = "|"
            for i, sub in enumerate(header_subs):
                first_line = sub.split("\n")[0] if sub else ""
                row += f" {first_line:^{col_widths[i]}} |"
            print(row)

        print(sep)

        row = "|"
        for i in range(col_count):
            cell = f"{complete_vals[i]:^{col_widths[i]}}"
            row += f" {cell} |"
        print(row)

        print(sep)

    for k in eval_ks:
        compile_complete_overall_k = float(np.mean(compile_complete_k[k])) if compile_complete_k[k] else 0.0
        print(f"\n{'=' * 20} Pass@{k} results {'=' * 20}")
        _print_table(
            k,
            compile_complete_by_bench_at_k={bench: vals for bench, vals in compile_complete_by_bench_k[k].items()},
            compile_complete_overall=compile_complete_overall_k,
        )

    tampered_by_bench: Dict[str, list] = defaultdict(list)
    for t in tampered_details:
        tampered_by_bench[t["benchmark"]].append(t["problem_id"])

    summary = {
        "compile_complete": {
            "overall": float(np.mean(compile_complete_all)) if compile_complete_all else 0.0,
            "by_benchmark": {bench: float(np.mean(vals)) for bench, vals in compile_complete_by_bench.items()},
        },
        "complete_at_k": {
            "k": eval_ks,
            "overall": {
                k: float(np.mean(compile_complete_k[k])) if compile_complete_k[k] else 0.0
                for k in eval_ks
            },
            "by_benchmark": {
                k: {bench: float(np.mean(vals)) for bench, vals in compile_complete_by_bench_k[k].items()}
                for k in eval_ks
            },
        },
        "statement_integrity": {
            "tampered_count": len(tampered_details),
            "tampered_problems": {
                bench: sorted(set(pids)) for bench, pids in tampered_by_bench.items()
            },
            "tampered_details": tampered_details,
            "clean_complete_at_k": {
                "k": eval_ks,
                "overall": {k: float(np.mean(clean_complete_k[k])) if clean_complete_k[k] else 0.0 for k in eval_ks},
                "by_benchmark": {
                    k: {bench: float(np.mean(vals)) for bench, vals in clean_complete_by_bench_k[k].items()}
                    for k in eval_ks
                },
            },
        },
    }
    output_p = Path(output_path)
    summary_path = str(output_p.parent / f"{output_p.stem}_summary.json")
    with open(summary_path, "w", encoding="utf-8") as f:
        json.dump(summary, f, ensure_ascii=False, indent=2)
