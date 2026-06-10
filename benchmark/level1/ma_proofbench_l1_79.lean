import Mathlib

/--
Show that

\[
1-\frac{1}{x}\le \log x\le x-1,\qquad x>0.
\]
-/

theorem ma_proofbench_l1_79 (x : ℝ) (hx : 0 < x) :
    1 - 1 / x ≤ Real.log x ∧ Real.log x ≤ x - 1 := by
  sorry
