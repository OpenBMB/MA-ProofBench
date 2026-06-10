import Mathlib

/--
Let $S$ denote a subspace of a Hilbert space $\mathcal{H}$. Prove that $(S^{\perp})^{\perp}$ is the smallest closed subspace of $\mathcal{H}$ that contains $S$.
-/

theorem ma_proofbench_l1_40 {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (S : Submodule ℂ H) :
    IsClosed ((Sᗮᗮ : Submodule ℂ H) : Set H) ∧ S ≤ Sᗮᗮ ∧ ∀ K : Submodule ℂ H,
    IsClosed ((K : Submodule ℂ H) : Set H) → S ≤ K → Sᗮᗮ ≤ K := by
  sorry
