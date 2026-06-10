import argparse
from pathlib import Path
from typing import Any, Dict, Iterable, Tuple

from .data_utils import load_jsonl


def _load_result_map(rows: Iterable[Dict[str, Any]]) -> Dict[Any, Dict[str, Any]]:
    result: Dict[Any, Dict[str, Any]] = {}
    for row in rows:
        if isinstance(row, dict) and "id" in row:
            result[row["id"]] = row
    return result


def check_inference_complete(
    output_path: str,
    dataset_paths: list[str],
    num_samples: int,
    splits: list[str] | None = None,
) -> bool:
    if not Path(output_path).exists():
        return False

    dataset = load_jsonl(dataset_paths, splits=splits)
    rows = load_jsonl([output_path])
    results = _load_result_map(rows)
    if not dataset:
        return False

    for example in dataset:
        item = results.get(example.get("id"))
        if not item:
            return False
        leans = item.get("lean_candidates") or []
        raws = item.get("raw_outputs") or []
        if len(leans) < num_samples or len(raws) < num_samples:
            return False
        for sample_id in range(num_samples):
            if not str(leans[sample_id]).strip() or not str(raws[sample_id]).strip():
                return False
    return True


def check_eval_complete(
    output_path: str,
    dataset_paths: list[str],
    num_samples: int,
    splits: list[str] | None = None,
) -> bool:
    if not Path(output_path).exists():
        return False

    dataset = load_jsonl(dataset_paths, splits=splits)
    rows = load_jsonl([output_path])
    results: Dict[Tuple[Any, int], Dict[str, Any]] = {}
    for row in rows:
        if not isinstance(row, dict):
            continue
        sample_id = row.get("sample_id")
        if isinstance(sample_id, int) and "id" in row:
            results[(row["id"], sample_id)] = row

    if not dataset or len(results) < len(dataset) * num_samples:
        return False

    for example in dataset:
        for sample_id in range(num_samples):
            item = results.get((example.get("id"), sample_id))
            if not item:
                return False
            status = str(item.get("request_status", "")).strip().lower()
            if status not in {"success", "skipped"}:
                return False
    return True


def main() -> None:
    parser = argparse.ArgumentParser(description="Check whether evaluation artifacts are complete.")
    parser.add_argument("--kind", choices=["infer", "eval"], required=True)
    parser.add_argument("--output_path", required=True)
    parser.add_argument("--dataset_path", nargs="+", required=True)
    parser.add_argument("--num_samples", type=int, required=True)
    parser.add_argument("--split", nargs="+", choices=["all", "level1", "level2"], default=["all"])
    args = parser.parse_args()

    if args.kind == "infer":
        complete = check_inference_complete(args.output_path, args.dataset_path, args.num_samples, args.split)
    else:
        complete = check_eval_complete(args.output_path, args.dataset_path, args.num_samples, args.split)
    raise SystemExit(0 if complete else 1)


if __name__ == "__main__":
    main()
