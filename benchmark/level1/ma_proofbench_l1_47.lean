import Mathlib

/--
If $X$ is compact and $f:X\to(-\infty,\infty)$ is upper semicontinuous, prove that $f$ attains its maximum at some point of $X$.
-/

theorem ma_proofbench_l1_47 {X : Type*} [TopologicalSpace X] [CompactSpace X] [Nonempty X]
    (f : X → ℝ) (hf : UpperSemicontinuous f) :
    ∃ x₀ : X, ∀ x : X, f x ≤ f x₀ := by
  sorry
