import Mathlib

open Filter Topology

/--
Let $(a_n)$ be a sequence in $(0,\infty)$ and define

\[
x_n := \sum_{k=0}^n (a_k+1/a_k),\qquad n\in\N.
\]
Show that $(1/x_n)$ is a null sequence.
-/

noncomputable def xSeq (a : ℕ → ℝ) : ℕ → ℝ :=
  fun n ↦ ∑ k ∈ Finset.range (n + 1), (a k + (1 / a k))

theorem ma_proofbench_l1_18 (a : ℕ → ℝ) (ha : ∀ n : ℕ, 0 < a n) :
    Tendsto (fun n ↦ 1 / xSeq a n) atTop (𝓝 0) := by
  sorry
