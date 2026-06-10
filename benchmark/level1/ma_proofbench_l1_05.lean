import Mathlib

/--
Verify that the series

$\sum (1-\cos(x/n))$
converges uniformly on any compact subinterval of $\mathbb{R}$.
-/

theorem ma_proofbench_l1_05 (f : ℕ → ℝ → ℝ) (hf : ∀ n x, f n x = 1 - Real.cos (x / (n + 1))) :
    ∀ a b : ℝ, a < b → ∃ g : ℝ → ℝ,
        TendstoUniformlyOn
          (fun N x => ∑ n ∈ Finset.range N, f n x) g Filter.atTop (Set.Icc a b) := by
  sorry
