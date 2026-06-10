import Mathlib

/--
Prove that

\[
\int_{0}^{1}\frac{\log(1+x)}{1+x^{2}}\,dx=\frac{\pi}{8}\log 2.
\]
-/

theorem ma_proofbench_l1_58 : (∫ x in 0..1, Real.log (1 + x) / (1 + x ^ 2))
      =
    (Real.pi / 8) * Real.log 2 := by
  sorry
