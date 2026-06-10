import Mathlib

open scoped ComplexConjugate

/--
Show that $f:\mathbb{C}\to\mathbb{C}$, $z\mapsto \bar z$, is nowhere differentiable.
-/

theorem ma_proofbench_l1_57 (f : ℂ → ℂ) (hf : ∀ z : ℂ, f z = conj z) :
    ∀ z : ℂ, ¬ DifferentiableAt ℂ f z := by
  sorry
