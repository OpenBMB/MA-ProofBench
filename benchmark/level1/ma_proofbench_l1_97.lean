import Mathlib

/--
Neither the inclusion $L^{2}(\mathbb{R}^{d}) \subset L^{1}(\mathbb{R}^{d})$ nor the inclusion $L^{1}(\mathbb{R}^{d}) \subset L^{2}(\mathbb{R}^{d})$ is valid.
-/

theorem ma_proofbench_l1_97 (d : ℕ) (hd : 0 < d) :
    (¬ (∀ f : (Fin d → ℝ) → ℝ,
        MeasureTheory.MemLp f 2 →
        MeasureTheory.MemLp f 1)) ∧
    (¬ (∀ f : (Fin d → ℝ) → ℝ,
        MeasureTheory.MemLp f 1 →
        MeasureTheory.MemLp f 2)) := by
  sorry
