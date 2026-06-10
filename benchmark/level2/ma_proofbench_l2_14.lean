import Mathlib

open MeasureTheory Filter

/--
Let $U\subset \mathbb{R}^{n}$ be an open set and $x_0\in U$. Prove that there is a $C^{\infty}$ function $g:\mathbb{R}^{n}\to\mathbb{R}$ such that $g(x_0)=1$ and $\operatorname{supp}(g)\subset U$.s
-/

theorem ma_proofbench_l2_14 {n : ℕ} (U : Set (Fin n → ℝ)) (hUopen : IsOpen U) (x0 : Fin n → ℝ)
    (hx0 : x0 ∈ U) :
    ∃ g : (Fin n → ℝ) → ℝ, ContDiff ℝ (⊤ : ℕ∞) g ∧ g x0 = 1 ∧ tsupport g ⊆ U := by
  sorry
