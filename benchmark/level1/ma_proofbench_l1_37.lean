import Mathlib

/--
Prove that if $f$ is entire and one-to-one, then $f$ must be linear
(in the affine sense: $f(z)=az+b$ with $a \ne 0$).
-/

theorem ma_proofbench_l1_37 (f : ℂ → ℂ) (hf : Differentiable ℂ f) (hinj : Function.Injective f) :
    ∃ a b : ℂ, a ≠ 0 ∧ ∀ z : ℂ, f z = a * z + b := by
  sorry
