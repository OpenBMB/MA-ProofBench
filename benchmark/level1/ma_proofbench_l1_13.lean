import Mathlib

/--
$I$ is a compact interval containing more than one point. Let $f:I\to\mathbb{R}$ be continuous and injective. Show that $f$ is strictly monotone.
-/

theorem ma_proofbench_l1_13 {a b : ℝ} (hab : a < b) (f : Set.Icc a b → ℝ) (hf_cont : Continuous f) (hf_inj : Function.Injective f) :
    StrictMono f ∨ StrictAnti f := by
  sorry
