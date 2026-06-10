import Mathlib

/--
Prove that the following inequality holds for any $f \in S(\mathbb{R})$:
\[
\|f\|_{L^2}^2 \le 2\|xf\|_{L^2}\|f'\|_{L^2}.
\]
-/

theorem ma_proofbench_l2_40 (f : SchwartzMap ℝ ℝ) :
    (∫ x : ℝ, ‖f x‖ ^ 2) ≤
      2 * Real.sqrt (∫ x : ℝ, ‖x * f x‖ ^ 2) *
        Real.sqrt (∫ x : ℝ, ‖deriv (fun y : ℝ => f y) x‖ ^ 2) := by
  sorry
