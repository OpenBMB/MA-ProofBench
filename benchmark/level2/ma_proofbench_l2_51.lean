import Mathlib

/--
Suppose $R_1, R_2$ are bounded, simply-connected open subsets of $\mathbb{C}$. Let $z_1 \in R_1$ and $z_2 \in R_2$.
Prove that there is a holomorphic bijective function $f : R_1 \to R_2$ such that $f(z_1) = z_2$.
-/

theorem ma_proofbench_l2_51
    (R₁ R₂ : Set ℂ)
    (hR₁_open : IsOpen R₁) (hR₂_open : IsOpen R₂)
    (hR₁_bdd : Bornology.IsBounded R₁) (hR₂_bdd : Bornology.IsBounded R₂)
    (hR₁_sc : IsSimplyConnected R₁) (hR₂_sc : IsSimplyConnected R₂)
    (z₁ z₂ : ℂ) (hz₁ : z₁ ∈ R₁) (hz₂ : z₂ ∈ R₂) :
    ∃ f : ℂ → ℂ,
      DifferentiableOn ℂ f R₁ ∧
      Set.BijOn f R₁ R₂ ∧
      f z₁ = z₂ := by
  sorry
