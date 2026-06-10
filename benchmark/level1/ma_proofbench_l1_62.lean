import Mathlib

/--
Let $f:\mathbb{R}\to\mathbb{R}$. Prove that $f$ satisfies the Lipschitz condition

\[
|f(x)-f(y)|\le M|x-y|
\]
for some $M$ and all $x,y\in\mathbb{R}$, if and only if $f$ satisfies the following two properties:
$f$ is absolutely continuous.
$|f'(x)|\le M$ for a.e.\ $x$.
-/

theorem ma_proofbench_l1_62 (f : ℝ → ℝ) (M : NNReal) : (LipschitzWith M f) ↔ 
  ((∀ a b : ℝ, AbsolutelyContinuousOnInterval f a b) ∧ (∀ᵐ x, ‖deriv f x‖ ≤ (M : ℝ))) := by
  sorry
