import Mathlib

/--
Verify that the function $f:\mathbb{R}\to\mathbb{R}$, \ $x\mapsto e^{x-1}-e^{1-x}$ has a unique fixed point

$x^*$.
-/

theorem ma_proofbench_l1_59 :
    ∃! x : ℝ, (Real.exp (x - 1) - Real.exp (1 - x)) = x := by
  sorry
