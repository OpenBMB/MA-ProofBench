import Mathlib

/--
Suppose $f:\mathbb{R}^{2}\to\mathbb{R}$ is defined by

\[
f(x,y):=
\begin{cases}
\sqrt{x^{2}+y^{2}}, & y>0,\\
x, & y=0,\\
-\sqrt{x^{2}+y^{2}}, & y<0.
\end{cases}
\]
Show $f$ is not differentiable at $(0,0)$.
-/

theorem ma_proofbench_l1_06 {f : ℝ × ℝ → ℝ} (hpos : ∀ x y : ℝ, y > 0 → f (x, y) = Real.sqrt (x ^ 2 + y ^ 2))
    (hzero : ∀ x : ℝ, f (x, 0) = x)
    (hneg : ∀ x y : ℝ, y < 0 → f (x, y) = -Real.sqrt (x ^ 2 + y ^ 2)) :
    ¬ DifferentiableAt ℝ f (0, 0) := by
  sorry
