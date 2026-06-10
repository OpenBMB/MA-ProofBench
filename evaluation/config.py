import os
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parents[1]

DEFAULT_MODEL_PATH = os.environ.get("EVAL_MODEL_PATH", "")
DEFAULT_DATASET_PATHS = [
    str(PROJECT_ROOT / "benchmark" / "ma_proofbench.jsonl"),
]

LEAN_SERVER_HOST = "127.0.0.1"
LEAN_SERVER_PORT = 8000
LEAN_SERVER_TIMEOUT = 180
LEAN_SERVER_MAX_WORKERS = 24
SAVE_INTERVAL = 50

EXTERNAL_API_URL = os.environ.get("EXTERNAL_API_URL", "")
EXTERNAL_API_KEY = os.environ.get("EXTERNAL_API_KEY", "")

EXTERNAL_API_MAX_WORKERS = 64

INFERENCE_PROMPT_TEMPLATES = {
    "goedelv2": 
        "Complete the following Lean 4 code:\n\n```lean4\n{formal_statement}```\n\nBefore producing the Lean 4 code to formally prove the given theorem, provide a detailed proof plan outlining the main proof steps and strategies.\nThe plan should highlight key ideas, intermediate lemmas, and proof structures that will guide the construction of the final formal proof.",
    "deepseek_prover_v2": 
        "Complete the following Lean 4 code:\n\n```lean4\n{formal_statement}```\n\nBefore producing the Lean 4 code to formally prove the given theorem, provide a detailed proof plan outlining the main proof steps and strategies.\nThe plan should highlight key ideas, intermediate lemmas, and proof structures that will guide the construction of the final formal proof.",
    "kimina": 
        "You are an expert in mathematics and proving theorems in Lean 4. Think about and solve the following problem step by step in Lean 4.\nProblem:{informal_statement}\nFormal statement:\n```lean4\n{formal_statement}\n```",
    "baseline": 
        "You are an expert in Lean 4 and Mathematics. Please finish the following proof in Lean4 code.\nDo not change the original statement. Copy the final statement to prove exactly.\nPlease include the complete header (including imports and namespaces) so that your code can pass the Lean4 compiler. Please solve the statement step by step and provide your complete Lean4 code between ```lean4 and ``` after careful reasoning.\nThe statement for you to complete is:\n\n```lean4\n{formal_statement}\n```"
}
DEFAULT_INFER_PROMPT_TEMPLATE = "goedelv2"
