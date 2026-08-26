import Mathlib

/--
Define $f(0,0)=0$ and

\[
f(x,y)=\frac{x^3}{x^2+y^2}\qquad \text{if }(x,y)\ne(0,0).
\]
Prove that $D_1f$ and $D_2f$ are bounded functions in $R^2$.
-/

theorem ma_proofbench_l1_56 (f : ℝ × ℝ → ℝ) (h0 : f (0, 0) = 0)
    (hxy : ∀ p : ℝ × ℝ, p ≠ (0, 0) → f p = (p.1 ^ 3) / (p.1 ^ 2 + p.2 ^ 2)) :
    (∃ M : ℝ, ∀ x y : ℝ, ‖deriv (fun t => f (t, y)) x‖ ≤ M) ∧
    (∃ M : ℝ, ∀ x y : ℝ, ‖deriv (fun t => f (x, t)) y‖ ≤ M) := by
  sorry
