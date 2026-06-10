import Mathlib

/--
Let $H$ be a Hilbert space and let $U$ be a bounded linear operator acting on $H$.
If $U$ is a unitary operator, and $\sigma(U)$ denotes the spectrum of $U$, prove that $\sigma(U)\subseteq\{z\in\mathbb{C}:|z|=1\}$.
-/

theorem ma_proofbench_l2_73 (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (U : H →L[ℂ] H)
    (h₁ : U.adjoint * U = 1) (h₂ : U * U.adjoint = 1) :
    spectrum ℂ U ⊆ {z : ℂ | ‖z‖ = 1} := by
  sorry
