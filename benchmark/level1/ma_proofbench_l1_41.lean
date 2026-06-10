import Mathlib

/--
If $f$ is bounded ($|f(x)| \le M$), and $f \in L^{1}(\mathbb{R}^{d})$, then $f \in L^{2}(\mathbb{R}^{d})$ with

\[
\|f\|_{L^{2}(\mathbb{R}^{d})} \le M^{1/2}\,\|f\|_{L^{1}(\mathbb{R}^{d})}^{1/2}.
\]
-/

theorem ma_proofbench_l1_41 (d : ℕ) (f : (Fin d → ℝ) → ℝ) (M : ℝ) (hM : 0 ≤ M) (hbound : ∀ x, ‖f x‖ ≤ M)
    (hf : MeasureTheory.MemLp f 1) :
    (MeasureTheory.MemLp f 2) ∧
      (MeasureTheory.eLpNorm f 2).toReal ≤
        Real.sqrt M * Real.sqrt (MeasureTheory.eLpNorm f 1).toReal := by
  sorry
