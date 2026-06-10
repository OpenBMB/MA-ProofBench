import Mathlib

/--
Prove that

\[
\int_0^\infty \left(\frac{\sin x}{x}\right)^2 dx = \frac{\pi}{2}.
\]
-/

theorem ma_proofbench_l1_35 :
    ∫ x in Set.Ioi (0 : ℝ), (Real.sin x / x) ^ 2 = Real.pi / 2 := by
  sorry
