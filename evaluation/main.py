import argparse

from .config import (
    DEFAULT_DATASET_PATHS,
    DEFAULT_INFER_PROMPT_TEMPLATE,
    DEFAULT_MODEL_PATH,
    EXTERNAL_API_MAX_WORKERS,
    INFERENCE_PROMPT_TEMPLATES,
)
from .inference import run_inference
from .lean import run_eval


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run MA-ProofBench inference or Lean verification.")
    parser.add_argument("--mode", choices=["infer", "eval"], default="eval", help="Run mode.")
    parser.add_argument("--model_path", type=str, default=DEFAULT_MODEL_PATH, help="API model name.")
    parser.add_argument("--output_path", type=str, required=True, help="Output JSONL path.")
    parser.add_argument("--dataset_path", type=str, nargs="+", default=DEFAULT_DATASET_PATHS, help="Benchmark JSONL path(s).")
    parser.add_argument(
        "--split",
        type=str,
        nargs="+",
        choices=["all", "level1", "level2"],
        default=["all"],
        help="Dataset split(s) to evaluate.",
    )
    parser.add_argument("--predictions_path", type=str, default=None, help="Optional prediction JSONL path.")
    parser.add_argument("--num_samples", type=int, default=8, help="Number of candidates per problem.")
    parser.add_argument("--timeout", type=int, default=480, help="Request timeout in seconds.")
    parser.add_argument("--eval_max_tokens", type=int, default=2048, help="Maximum generation tokens for inference.")
    parser.add_argument("--eval_temperature", type=float, default=0.6, help="Sampling temperature for inference.")
    parser.add_argument(
        "--prompt_template",
        type=str,
        default=DEFAULT_INFER_PROMPT_TEMPLATE,
        choices=sorted(INFERENCE_PROMPT_TEMPLATES.keys()),
        help="Prompt template for inference.",
    )
    parser.add_argument("--limit", type=int, default=None, help="Evaluate only the first N examples.")
    parser.add_argument(
        "--no_think",
        action="store_true",
        help="Use the full model answer as Lean code without extracting code blocks.",
    )

    parser.add_argument(
        "--api_max_workers",
        type=int,
        default=EXTERNAL_API_MAX_WORKERS,
        help=f"Worker count for external API mode. Default: {EXTERNAL_API_MAX_WORKERS}.",
    )
    args = parser.parse_args()

    print(f"Dataset: {args.dataset_path}; split: {args.split}")

    if args.mode == "infer":
        if not args.model_path:
            parser.error("--model_path is required for --mode infer")
        print(f"External API mode; workers: {args.api_max_workers}")
        run_inference(
            model_path=args.model_path,
            output_path=args.output_path,
            dataset_paths=args.dataset_path,
            max_workers=args.api_max_workers,
            num_samples=args.num_samples,
            timeout=args.timeout,
            eval_max_tokens=args.eval_max_tokens,
            eval_temperature=args.eval_temperature,
            prompt_template=args.prompt_template,
            limit=args.limit,
            no_think=args.no_think,
            splits=args.split,
        )
    else:
        run_eval(
            output_path=args.output_path,
            dataset_paths=args.dataset_path,
            num_samples=args.num_samples,
            predictions_path=args.predictions_path,
            limit=args.limit,
            splits=args.split,
        )
