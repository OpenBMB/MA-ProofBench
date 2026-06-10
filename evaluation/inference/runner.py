from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any, Dict, List, Optional

import tqdm

from ..config import EXTERNAL_API_URL, SAVE_INTERVAL
from ..data_utils import (
    build_inference_prompt,
    extract_formal_statement,
    extract_nl,
    load_jsonl,
    write_jsonl,
)
from ..lean.utils import extract_lean_code_from_inference, normalize_lean_code
from .api_client import call_external_api, set_raw_log_path


def run_inference(
    model_path: str,
    output_path: str,
    dataset_paths: List[str],
    max_workers: int,
    num_samples: int,
    timeout: int,
    eval_max_tokens: int,
    eval_temperature: float,
    prompt_template: str,
    limit: Optional[int],
    no_think: bool,
    splits: Optional[List[str]] = None,
) -> None:
    log_path = str(Path(output_path).parent / "api_raw_responses.jsonl")
    set_raw_log_path(log_path)
    print(f"External API mode: model={model_path}, workers={max_workers}, url={EXTERNAL_API_URL}")
    print(f"Raw API response log: {log_path}")

    dataset = load_jsonl(dataset_paths, splits=splits)
    if limit is not None:
        dataset = dataset[:limit]

    existing_map: Dict[Any, Dict[str, Any]] = {}
    output_file = Path(output_path)
    if output_file.exists():
        try:
            existing_rows = load_jsonl([output_path])
            for row in existing_rows:
                if isinstance(row, dict) and "id" in row:
                    existing_map[row["id"]] = row
            if existing_map:
                print(f"Found existing inference output; resuming from: {output_path}")
        except Exception as e:
            print(f"Failed to read existing inference output; running full inference: {e}")

    examples = []
    for idx, data in enumerate(dataset):
        example = dict(data)
        example["problem_id"] = idx
        example["formal_statement"] = extract_formal_statement(data)
        example["informal_statement"] = extract_nl(data)
        examples.append(example)

    results_map: Dict[int, Dict[str, Any]] = {}
    for ex in examples:
        existing = existing_map.get(ex["id"])
        existing_candidates = []
        existing_raw = []
        if existing:
            existing_candidates = existing["lean_candidates"]
            existing_raw = existing["raw_outputs"]
        results_map[ex["problem_id"]] = {
            "problem_id": ex["problem_id"],
            "id": ex["id"],
            "split": ex["split"],
            "topic": ex["topic"],
            "tag": ex["tag"],
            "benchmark_name": ex["benchmark_name"],
            "informal_statement": ex["informal_statement"],
            "lean_candidates": (existing_candidates + [""] * num_samples)[:num_samples],
            "raw_outputs": (existing_raw + [""] * num_samples)[:num_samples],
        }

    entries = []
    request_id = 0
    for ex in examples:
        prompt = build_inference_prompt(
            ex["formal_statement"],
            prompt_template,
            ex["informal_statement"],
        )
        for sample_id in range(num_samples):
            existing_item = results_map[ex["problem_id"]]
            if (
                existing_item["lean_candidates"][sample_id]
                and existing_item["raw_outputs"][sample_id]
            ):
                continue
            entries.append(
                {
                    "problem_id": ex["problem_id"],
                    "sample_id": sample_id,
                    "prompt": prompt,
                    "request_id": request_id,
                }
            )
            request_id += 1

    total_requests = len(entries)
    print(f"Starting inference generation (requests={total_requests}, workers={max_workers})...")

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {
            executor.submit(
                call_external_api,
                entry["prompt"],
                model_path,
                entry["request_id"],
                eval_temperature,
                eval_max_tokens,
                timeout,
            ): entry
            for entry in entries
        }
        with tqdm.tqdm(total=total_requests, desc="inference") as pbar:
            completed = 0
            for future in as_completed(futures):
                entry = futures[future]
                try:
                    response = future.result(timeout=timeout + 30)
                except Exception as e:
                    response = {"status": "failed", "output": "", "error": str(e)}
                if not isinstance(response, dict):
                    response = {
                        "status": "failed",
                        "output": "",
                        "error": f"invalid response type: {type(response).__name__}",
                    }
                raw = response["output"]
                current_header = examples[entry["problem_id"]]["header"]
                lean_code = normalize_lean_code(
                    extract_lean_code_from_inference(raw, no_think=no_think) or "",
                    current_header,
                )
                result = results_map[entry["problem_id"]]
                result["lean_candidates"][entry["sample_id"]] = lean_code
                result["raw_outputs"][entry["sample_id"]] = raw
                pbar.update(1)
                completed += 1
                if completed % SAVE_INTERVAL == 0:
                    write_jsonl(output_path, [results_map[ex["problem_id"]] for ex in examples])

    write_jsonl(output_path, [results_map[ex["problem_id"]] for ex in examples])
