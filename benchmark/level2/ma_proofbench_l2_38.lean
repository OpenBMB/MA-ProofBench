import Mathlib

open MeasureTheory Filter

/--
Suppose that $\{f_n\}_{n=1}^{\infty}$ is a sequence of measurable functions such that $f_n \to 0$ almost everywhere on $[0, 1]$. Prove that there exists a sequence $c_n$ such that $|c_n| \to \infty$ as $n \to \infty$ and $c_n f_n \to 0$ almost everywhere.
-/

theorem ma_proofbench_l2_38 (f : ℕ → ℝ → ℝ)
    (hf_meas : ∀ n, Measurable (f n))
    (hf_ae : ∀ᵐ x ∂(volume.restrict (Set.Icc (0 : ℝ) 1)),
      Filter.Tendsto (fun n => f n x) Filter.atTop (nhds 0)) :
    ∃ c : ℕ → ℝ,
      Filter.Tendsto (fun n => |c n|) Filter.atTop Filter.atTop ∧
      (∀ᵐ x ∂(volume.restrict (Set.Icc (0 : ℝ) 1)),
        Filter.Tendsto (fun n => c n * f n x) Filter.atTop (nhds 0)) := by
  sorry
