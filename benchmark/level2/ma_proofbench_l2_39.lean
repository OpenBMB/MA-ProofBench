import Mathlib

/--
Let $\omega > 0$ and $g : \mathbb{R} \to \mathbb{R}$ be a continuous function with period $2\pi$. Consider
the equation
\[
\frac{d^2 u}{dx^2} + \omega^2 u = g(x).
\]

Show that if $\omega$ is not an integer, then there is a unique solution with period $2\pi$
and all solutions are bounded.
-/

theorem ma_proofbench_l2_39
  (ω : ℝ) (hωpos : 0 < ω) (hω_nonint : ∀ n : ℕ, ω ≠ n)
  (g : ℝ → ℝ) (hg_cont : Continuous g)
  (hper : Function.Periodic g (2 * Real.pi)) :
  (∃! u : ℝ → ℝ, ContDiff ℝ 2 u ∧
  (∀ x : ℝ, deriv (deriv u) x + ω ^ 2 * u x = g x) ∧
  Function.Periodic u (2 * Real.pi)) ∧
  (∀ u : ℝ → ℝ, ContDiff ℝ 2 u →
  (∀ x : ℝ, deriv (deriv u) x + ω ^ 2 * u x = g x) →
  Bornology.IsBounded (Set.range u)) := by
  sorry
