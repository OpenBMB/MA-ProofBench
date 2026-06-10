import Mathlib

open MeasureTheory

/--
Suppose $f\in L^1(\mu)$. Prove that to each $\epsilon>0$ there exists a $\delta>0$ such that $\int_E |f|\,d\mu<\epsilon$ whenever $\mu(E)<\delta$.
-/

theorem ma_proofbench_l1_85 {α : Type*} [MeasurableSpace α] {μ : Measure α} {f : α → ℝ}
    (hf : Integrable f μ) :
    ∀ ε : ℝ, 0 < ε → ∃ δ : ENNReal, 0 < δ ∧
      ∀ E : Set α, MeasurableSet E → μ E < δ → (∫ x in E, ‖f x‖ ∂μ) < ε := by
  sorry
