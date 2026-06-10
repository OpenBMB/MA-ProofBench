import Mathlib

open scoped ComplexConjugate

/--
If $f$ and $\overline{f}$ are both holomorphic on a connected open set $U\subseteq\mathbb{C}$, then prove that $f$ is identically constant.
-/

theorem ma_proofbench_l1_04 {U : Set ℂ} (hUopen : IsOpen U) (hUconn : IsConnected U)
    (f : ℂ → ℂ)
    (hf : DifferentiableOn ℂ f U)
    (hconj : DifferentiableOn ℂ (fun z => conj (f z)) U) :
    ∃ c : ℂ, Set.EqOn f (fun _ => c) U := by
  sorry
