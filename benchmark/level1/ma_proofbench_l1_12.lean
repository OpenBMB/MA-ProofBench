import Mathlib

/--
If $0<x<\dfrac{\pi}{2}$, prove that

\[
\frac{2}{\pi} < \frac{\sin x}{x} < 1.
\]
-/

theorem ma_proofbench_l1_12
    {x : ℝ} (hx0 : 0 < x) (hx : x < (Real.pi / 2)) :
    (2 / Real.pi) < Real.sin x / x ∧ Real.sin x / x < 1 := by
  sorry
