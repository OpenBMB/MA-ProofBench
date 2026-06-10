import Mathlib

/--
Define $f$ in $R^3$ by

\[
f(x,y_1,y_2)=x^2y_1+e^x+y_2.
\]
Show that there exists a differentiable function $g$ in some neighborhood of $(1,-1)$ in $R^2$, such that $g(1,-1)=0$ and
\[
f(g(y_1,y_2),y_1,y_2)=0.
\]
-/

theorem ma_proofbench_l1_43 (f : ℝ → ℝ → ℝ → ℝ) (hf : f = fun x y₁ y₂ => x ^ 2 * y₁ + Real.exp x + y₂) :
    ∃ (U : Set (ℝ × ℝ)), IsOpen U ∧ ((1, -1) ∈ U) ∧
      ∃ g : (ℝ × ℝ) → ℝ,
        DifferentiableOn ℝ g U ∧ g (1, -1) = 0 ∧ ∀ y ∈ U, f (g y) y.1 y.2 = 0 := by
  sorry
