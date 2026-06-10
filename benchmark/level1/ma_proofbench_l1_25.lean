import Mathlib

/--
Let $f$ be non-constant and holomorphic in an open set containing the closed unit disc.

Show that if $|f(z)|=1$ whenever $|z|=1$, then the image of $f$ contains the unit disc.
-/

theorem ma_proofbench_l1_25 {f : ℂ → ℂ} {U : Set ℂ}
    (hU : IsOpen U)
    (hclosed : Metric.closedBall (0 : ℂ) 1 ⊆ U)
    (hf : DifferentiableOn ℂ f U)
    (hnonconst : ∃ z₁ ∈ U, ∃ z₂ ∈ U, f z₁ ≠ f z₂)
    (hboundary : ∀ z, z ∈ Metric.sphere (0 : ℂ) 1 → ‖f z‖ = 1) :
    Metric.ball (0 : ℂ) 1 ⊆ f '' U := by
  sorry
