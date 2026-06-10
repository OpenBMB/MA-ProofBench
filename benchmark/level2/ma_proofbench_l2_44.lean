import Mathlib

/--
Let $\mu$ be a Borel measure on $\mathbb{R}^n$. Suppose that $\mu$ is singular with respect to the Lebesgue measure $m_n$ and define
\[
M_\mu(x) = \sup_{r>0} \frac{\mu(B(x, r))}{m_n(B(x, r))}.
\]
Prove that $\mu\{x : M_\mu(x) < \infty\} = 0$.
-/

theorem ma_proofbench_l2_44
    {n : ℕ}
    (μ : MeasureTheory.Measure (EuclideanSpace ℝ (Fin n)))
    (hsing : MeasureTheory.Measure.MutuallySingular μ MeasureTheory.volume)
    (Mmu : EuclideanSpace ℝ (Fin n) → ENNReal)
    (hMdef : ∀ x : EuclideanSpace ℝ (Fin n),
      Mmu x = ⨆ (r : ℝ) (_ : 0 < r),
        μ (Metric.ball x r) / MeasureTheory.volume (Metric.ball x r)) :
    μ {x : EuclideanSpace ℝ (Fin n) | Mmu x < ⊤} = 0 := by
  sorry
