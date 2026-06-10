import Mathlib

/--
For $a>1$, show that

\[
\frac{1}{1+x}-\frac{1}{1+ax}\le \frac{\sqrt{a}-1}{\sqrt{a}+1},\qquad x\ge 1.
\]
-/

theorem ma_proofbench_l1_01 {a x : ℝ} (ha : 1 < a) (hx : 1 ≤ x) :
    (1 / (1 + x) - 1 / (1 + a * x)) ≤ (Real.sqrt a - 1) / (Real.sqrt a + 1) := by
  sorry
