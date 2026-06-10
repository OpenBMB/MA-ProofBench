import Mathlib

/--
Let $f$ be holomorphic on a neighborhood of $\overline{D}(P,r)$. Suppose that $f$ is not identically zero on $D(P,r)$. Prove that $f$ has at most finitely many zeros in $D(P,r)$.
-/

theorem ma_proofbench_l1_26 (f : ℂ → ℂ) (P : ℂ) (r : ℝ) (hr : 0 < r)
    (hhol : ∃ U : Set ℂ, IsOpen U ∧ Metric.closedBall P r ⊆ U ∧ DifferentiableOn ℂ f U)
    (hnot : ¬ ∀ z ∈ Metric.ball P r, f z = 0) :
    (Set.Finite {z : ℂ | z ∈ Metric.ball P r ∧ f z = 0}) := by
  sorry
