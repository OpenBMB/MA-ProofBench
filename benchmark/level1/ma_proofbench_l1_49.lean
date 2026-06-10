import Mathlib

open scoped InnerProductSpace

/--
Suppose $f$ is a differentiable mapping of $R^1$ into $R^3$ such that $|f(t)|=1$ for every $t$. Prove that $f'(t)\cdot f(t)=0$.
-/

theorem ma_proofbench_l1_49 (f : ℝ → EuclideanSpace ℝ (Fin 3)) (hf : Differentiable ℝ f) (hnorm : ∀ t : ℝ, ‖f t‖ = 1) :
    ∀ t : ℝ, ⟪deriv f t, f t⟫_ℝ = 0 := by
  sorry
