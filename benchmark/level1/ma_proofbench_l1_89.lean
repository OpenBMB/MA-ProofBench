import Mathlib

/--
Prove that

\[
\int_0^{2\pi} \frac{d\theta}{a+b\cos\theta}
= \frac{2\pi}{\sqrt{a^2-b^2}}
\]
if $a>|b|$ and $a,b\in\mathbb{R}$.
-/

theorem ma_proofbench_l1_89 (a b : ℝ) (hab : a > |b|) :
    (∫ θ in 0..(2 * Real.pi), (1 / (a + b * Real.cos θ))) =
      (2 * Real.pi) / Real.sqrt (a ^ 2 - b ^ 2) := by
  sorry
