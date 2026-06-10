import json
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Set

import numpy as np

from .config import INFERENCE_PROMPT_TEMPLATES


VALID_SPLITS = {"level1", "level2"}


def normalize_splits(values: Optional[Iterable[str]]) -> Optional[Set[str]]:
    if not values:
        return None
    splits = {str(value).strip() for value in values if str(value).strip()}
    if not splits or splits == {"all"}:
        return None
    invalid = splits - VALID_SPLITS
    if invalid:
        raise ValueError(f"invalid split(s): {sorted(invalid)}; expected one of {sorted(VALID_SPLITS)}")
    return splits


def load_jsonl(
    paths: Iterable[str],
    splits: Optional[Iterable[str]] = None,
) -> list[dict[str, Any]]:
    split_filter = normalize_splits(splits)
    rows = []
    for path in paths:
        with open(path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                item = json.loads(line)
                split = item["split"]
                if split_filter and split not in split_filter:
                    continue
                item["benchmark_name"] = split
                rows.append(item)
    return rows


def write_jsonl(path: str, items: Iterable[Dict[str, Any]]) -> None:
    Path(path).parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        for item in items:
            f.write(json.dumps(item, ensure_ascii=False) + "\n")


def extract_nl(data: Dict[str, Any]) -> str:
    value = data["informal_statement"]
    if not isinstance(value, str) or not value.strip():
        raise ValueError("informal_statement must be a non-empty string")
    return value.strip()


def extract_formal_statement(data: Dict[str, Any]) -> str:
    value = data["formal_statement"]
    if not isinstance(value, str) or not value.strip():
        raise ValueError("formal_statement must be a non-empty string")
    return value.strip()


def extract_candidates_from_item(data: Dict[str, Any]) -> List[str]:
    value = data["lean_candidates"]
    if not isinstance(value, list):
        raise ValueError("lean_candidates must be a list")
    return [str(v) if isinstance(v, str) else "" for v in value]


def build_inference_prompt(
    formal_statement: str,
    template_name: str,
    informal_statement: str = "",
) -> str:
    """Build an inference prompt from the selected template."""
    template = INFERENCE_PROMPT_TEMPLATES[template_name]
    out = template.replace("{informal_statement}", informal_statement)
    out = out.replace("{formal_statement}", formal_statement)
    return out


def attach_predictions(
    examples: List[Dict[str, Any]],
    predictions: List[Dict[str, Any]],
) -> List[List[str]]:
    pred_map: Dict[Any, List[str]] = {}
    for pred in predictions:
        pred_map[pred["id"]] = extract_candidates_from_item(pred)

    candidates = []
    for ex in examples:
        candidates.append(pred_map[ex["id"]])
    return candidates


def compute_pass_at_k(is_correct: List[bool], k: int) -> float:
    n = len(is_correct)
    c = sum(1 for v in is_correct if v)
    if k <= 0 or n == 0:
        return 0.0
    if c == 0:
        if k > n:
            print(f"Warning: filling {k - n} entries with unsuccessful")
        return 0.0
    if n - c < k:
        return 1.0
    return float(1.0 - np.prod(1.0 - k / np.arange(n - c + 1, n + 1)))
