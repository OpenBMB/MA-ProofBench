import Mathlib

open MeasureTheory

/--
Suppose $(X,\mathcal{S},\mu)$ and $(Y,\mathcal{T},\lambda)$ are $\sigma$-finite measure spaces, and suppose $\psi$ is a measure on $\mathcal{S}\times\mathcal{T}$ such that

\[
\psi(A\times B)=\mu(A)\lambda(B)
\]
whenever $A\in\mathcal{S}$ and $B\in\mathcal{T}$. Prove that then $\psi(E)=(\mu\times\lambda)(E)$ for every $E\in\mathcal{S}\times\mathcal{T}$.
-/

theorem ma_proofbench_l1_10 {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (μ : Measure X) (ν : Measure Y) [SigmaFinite μ] [SigmaFinite ν]
    (ψ : Measure (X × Y))
    (hψ : ∀ (A : Set X) (B : Set Y), MeasurableSet A → MeasurableSet B → ψ (A ×ˢ B) = μ A * ν B) :
    ∀ (E : Set (X × Y)), MeasurableSet E → ψ E = (μ.prod ν) E := by
  sorry
