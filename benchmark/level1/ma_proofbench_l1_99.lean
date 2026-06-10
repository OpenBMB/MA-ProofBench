import Mathlib

/--
Consider the function $F(x)=x^2\sin(1/x^2)$, $x\ne 0$, with $F(0)=0$. Show that $F'(x)$ exists for every $x$, but $F'$ is not integrable on $[-1,1]$.
-/

theorem ma_proofbench_l1_99 (F : ℝ → ℝ) (h0 : F 0 = 0)
    (hF : ∀ x ≠ 0, F x = x ^ 2 * Real.sin (1 / (x ^ 2))) :
    (∀ x : ℝ, DifferentiableAt ℝ F x) ∧
      ¬ MeasureTheory.IntegrableOn (fun x : ℝ => deriv F x) (Set.Icc (-1 : ℝ) (1 : ℝ)) := by
  sorry
