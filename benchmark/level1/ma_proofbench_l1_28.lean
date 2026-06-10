import Mathlib

/--
Let $\chi_{[0,1]}$ be the characteristic function of $[0,1]$. Show that there is no everywhere continuous function $f$ on $\mathbb{R}$ such that

\[
f(x)=\chi_{[0,1]}(x) \qquad \text{almost everywhere.}
\]
-/

theorem ma_proofbench_l1_28 : ¬ ∃ f : ℝ → ℝ, Continuous f ∧
  (∀ᵐ x ∂(MeasureTheory.volume), f x = Set.indicator (Set.Icc (0 : ℝ) 1) (fun _ => (1 : ℝ)) x) := by
  sorry
