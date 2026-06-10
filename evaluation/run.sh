#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
cd "$PROJECT_ROOT"

PYTHON="${PYTHON:-python}"

DATASET_PATHS=(${DATASET_PATHS:-"$PROJECT_ROOT/benchmark/ma_proofbench.jsonl"})
SPLITS=(${SPLITS:-all})
NUM_SAMPLES="${NUM_SAMPLES:-8}"
PROMPT_TEMPLATE="${PROMPT_TEMPLATE:-baseline}"
NO_THINK="${NO_THINK:-0}"
EVAL_MAX_TOKENS="${EVAL_MAX_TOKENS:-32768}"
EVAL_TEMPERATURE="${EVAL_TEMPERATURE:-1.0}"
EVAL_MODEL_PATH="${EVAL_MODEL_PATH:-}"
API_MAX_WORKERS="${API_MAX_WORKERS:-64}"

OUTPUT_DIR="${OUTPUT_DIR:-$SCRIPT_DIR/output}"
if [[ "$OUTPUT_DIR" != /* ]]; then
  OUTPUT_DIR="$PROJECT_ROOT/$OUTPUT_DIR"
fi
PREDICTIONS_PATH="${PREDICTIONS_PATH:-$OUTPUT_DIR/predictions.jsonl}"
OUTPUT_PATH="${OUTPUT_PATH:-$OUTPUT_DIR/results.jsonl}"
LOG_DIR="${LOG_DIR:-$OUTPUT_DIR/logs}"

mkdir -p "$OUTPUT_DIR" "$LOG_DIR"

check_complete() {
  local kind="$1"
  local path="$2"
  "$PYTHON" -m evaluation.checks \
    --kind "$kind" \
    --output_path "$path" \
    --dataset_path "${DATASET_PATHS[@]}" \
    --num_samples "$NUM_SAMPLES" \
    --split "${SPLITS[@]}"
}

if check_complete infer "$PREDICTIONS_PATH"; then
  echo "Found complete predictions: $PREDICTIONS_PATH"
else
  if [[ -z "$EVAL_MODEL_PATH" ]]; then
    echo "EVAL_MODEL_PATH is required for inference." >&2
    exit 1
  fi
  infer_extra=()
  if [[ "$NO_THINK" == "1" ]]; then
    infer_extra+=(--no_think)
  fi
  "$PYTHON" -m evaluation.main \
    --mode infer \
    --model_path "$EVAL_MODEL_PATH" \
    --output_path "$PREDICTIONS_PATH" \
    --dataset_path "${DATASET_PATHS[@]}" \
    --split "${SPLITS[@]}" \
    --num_samples "$NUM_SAMPLES" \
    --eval_max_tokens "$EVAL_MAX_TOKENS" \
    --eval_temperature "$EVAL_TEMPERATURE" \
    --prompt_template "$PROMPT_TEMPLATE" \
    --api_max_workers "$API_MAX_WORKERS" \
    "${infer_extra[@]}"
fi

if check_complete eval "$OUTPUT_PATH"; then
  echo "Found complete evaluation results: $OUTPUT_PATH"
else
  "$PYTHON" -m evaluation.main \
    --mode eval \
    --output_path "$OUTPUT_PATH" \
    --predictions_path "$PREDICTIONS_PATH" \
    --dataset_path "${DATASET_PATHS[@]}" \
    --split "${SPLITS[@]}" \
    --num_samples "$NUM_SAMPLES"
fi
