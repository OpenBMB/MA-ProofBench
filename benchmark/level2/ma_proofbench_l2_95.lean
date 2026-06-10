import Mathlib

open Topology Filter

/--
Let $I_n$ be the integral of $\left|\sum_{i=1}^n x_i\right|$ over the unit $n$-cube $-1/2\le x_i\le 1/2$. Prove that $n^{-1/2}I_n\to (6\pi)^{-1/2}$ as $n\to\infty$.
-/

theorem ma_proofbench_l2_95
    (I : ℕ → ℝ)
    (hI : ∀ n : ℕ,
      I n = ∫ x in (Set.Icc
          (fun _ : Fin n => (-1 / 2 : ℝ))
          (fun _ : Fin n => (1 / 2 : ℝ))),
        |∑ i : Fin n, x i|) :
    Tendsto (fun n : ℕ => I n / Real.sqrt (n : ℝ)) atTop
      (𝓝 (1 / Real.sqrt (6 * Real.pi))) := by
  sorry
