import Mathlib

open scoped BigOperators

/--
Let $H$ be a Hilbert space. Suppose $\{x_n\}_{n=1}^{\infty}\subset H$ is a sequence such that $x_n \rightharpoonup x$ for some $x\in H$ in the weak topology.
Let $y_n=\frac1n(x_1+\cdots+x_n)$. Prove that $y_n \rightharpoonup x$ in the weak topology.
-/

theorem ma_proofbench_l2_97 {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (x : ℕ → H) (x0 : H)
    (hweak : ∀ l : H →L[ℝ] ℝ,
      Filter.Tendsto (fun n => l (x n)) Filter.atTop (nhds (l x0))) :
    ∀ l : H →L[ℝ] ℝ,
      Filter.Tendsto
        (fun n : ℕ => l ((1 / (n + 1 : ℝ)) • Finset.sum (Finset.range (n + 1)) (fun i => x i)))
        Filter.atTop (nhds (l x0)) := by
  sorry
