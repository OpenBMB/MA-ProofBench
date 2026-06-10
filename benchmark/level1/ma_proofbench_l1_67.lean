import Mathlib

/--
The function $f(z)=1/z$ is holomorphic on $U=\{z\in\mathbb{C}:1<|z|<2\}$. Prove that $f$ does not have a holomorphic antiderivative on $U$.
-/

theorem ma_proofbench_l1_67 (U : Set ℂ)
  (hU : U = {z : ℂ | 1 < norm z ∧ norm z < 2}) :
  ¬ ∃ F : ℂ → ℂ, ∀ z ∈ U, HasDerivAt F (1 / z) z:= by
  sorry
