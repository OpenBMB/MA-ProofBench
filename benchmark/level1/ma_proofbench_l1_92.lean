import Mathlib

/--
Construct a monotonic function $f$ on $\mathbb{R}^1$ so that $f'(x)$ exists (finitely) for every $x\in \mathbb{R}^1$, but $f'$ is not a continuous function.
-/

theorem ma_proofbench_l1_92 :
    ∃ f : ℝ → ℝ, Monotone f ∧ (∀ x : ℝ, DifferentiableAt ℝ f x) ∧ ¬ Continuous (deriv f) := by
  sorry
