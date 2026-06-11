# MA-ProofBench: A Two-Tiered Evaluation of LLMs for Theorem Proving in Mathematical Analysis

<p align="center">
  <b>English</b> | <a href="README_zh.md">中文</a>
</p>

<p align="center">
  <a href="https://huggingface.co/datasets/openbmb/MA-ProofBench"><img alt="Hugging Face" src="https://img.shields.io/badge/%F0%9F%A4%97-Hugging%20Face-FFD21E?style=flat"></a>
  <a href="#"><img alt="arXiv" src="https://img.shields.io/badge/arXiv-Paper-B31B1B?style=flat&logo=arxiv&logoColor=white"></a>
</p>

We introduce **MA-ProofBench**, to the best of our knowledge, the first formal benchmark for evaluating large language models (LLMs) on theorem proving in **M**athematical **A**nalysis. It contains **200** rigorously formalized theorem-proving problems in [Lean 4](https://leanprover.github.io/) (v4.28.0), split into two difficulty tiers:

| Tier         | Description    | Source                                   | Count |
|--------------|----------------|------------------------------------------|-------|
| **Level I**  | Undergraduate  | Basic Textbook Exercises                 | 100   |
| **Level II** | Ph.D.          | Exam Problems from Top-Tier Universities | 100   |

The problems span **6 core topics** and **27 subcategories**, including *measure and integration theory*, *complex analysis*, and *functional analysis*. MA-ProofBench targets areas that are underrepresented in prior benchmarks and require deep reasoning about continuity, limits, and topological structures. Each problem is built through a human-led, LLM-assisted formalization pipeline with independent expert blind review to ensure mathematical fidelity.



<p align="center">
  <img src="assets/ma_proofbench_category_donut_level1.png" alt="Level I category distribution" width="35%">
  <img src="assets/ma_proofbench_category_donut_level2.png" alt="Level II category distribution" width="35%">
</p>


## Category Distribution

Problems are classified following the **Mathematics Subject Classification (MSC)** scheme:


| Category                        | Level I | Level II |
| ------------------------------- | ------- | -------- |
| Real Functions                  | 44      | 12       |
| Functional Analysis             | 15      | 31       |
| Functions of a Complex Variable | 19      | 16       |
| Measure & Integration           | 13      | 17       |
| Operator Theory                 | 4       | 23       |
| Sequences, Series, Summability  | 5       | 1        |

## Evaluation

<p align="center">
  <img src="assets/results.png" alt="MA-ProofBench evaluation results" width="90%">
</p>

The `evaluation/` package generates proofs via an OpenAI-compatible API and verifies them with [Kimina Lean Server](https://github.com/project-numina/kimina-lean-server). 

First, install the evaluation dependencies:

```bash
pip install -r requirements.txt
```

Then set up and start the Lean server (make sure it uses Lean v4.28.0):

```bash
cd kimina-lean-server

cp .env.template .env # Optional
bash setup.sh # Installs Lean, repl and mathlib4
pip install -r requirements.txt
pip install .
prisma generate
python -m server
```

With the Lean server running, launch the evaluation script with an OpenAI-compatible API endpoint:

```bash
EXTERNAL_API_URL=https://your-api/v1/chat/completions \
EXTERNAL_API_KEY=sk-xxx \
EVAL_MODEL_PATH=your-model-name \
NUM_SAMPLES=8 \
EVAL_MAX_TOKENS=32768 \
EVAL_TEMPERATURE=1.0 \
bash evaluation/run.sh
```

To run a stage manually:

```bash
# Inference only
EXTERNAL_API_URL=https://your-api/v1/chat/completions \
EXTERNAL_API_KEY=sk-xxx \
python -m evaluation.main --mode infer \
  --model_path "$EVAL_MODEL_PATH" \
  --output_path predictions.jsonl \
  --split level1 level2 --num_samples 8 \
  --eval_max_tokens 32768 --eval_temperature 1.0

# Verification only
python -m evaluation.main --mode eval \
  --predictions_path predictions.jsonl \
  --output_path results.jsonl \
  --split level1 level2 --num_samples 8
```

## Citation

```bibtex
@article{ma-proofbench,
  title={MA-ProofBench: A Two-Tiered Evaluation of LLMs for Theorem Proving in Mathematical Analysis},
  author={Lushi Pu and Weiming Zhang and Xinheng Xie and Zixuan Fu and Bingxiang He and Hongya Lyu and Xin Li and Jie Zhou and Yudong Wang},
  year={2026}
}
```

## License

This project is released under the [MIT License](LICENSE).