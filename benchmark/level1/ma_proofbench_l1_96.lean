import Mathlib

/--
If $\{f_j\}$ is a sequence of holomorphic functions

on a domain $U$ and if the sequence converges uniformly on compact subsets of $U$ to a limit function $f$,
then $f$ is holomorphic on $U$.
-/

theorem ma_proofbench_l1_96 {U : Set ℂ} (hUopen : IsOpen U) (hUconn : IsConnected U)
    {fj : ℕ → ℂ → ℂ} {f : ℂ → ℂ}
    (hhol : ∀ j : ℕ, DifferentiableOn ℂ (fj j) U)
    (hconv :
      ∀ K : Set ℂ, IsCompact K → K ⊆ U → TendstoUniformlyOn fj f Filter.atTop K) :
    DifferentiableOn ℂ f U := by
  sorry
