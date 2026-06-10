import Mathlib

/--
Let $X$ be a Banach space over $\mathbb{R}$.
Let $Y \subset X$ be a subspace. Show that $Y$ is closed in the norm topology if and only if $Y$ is closed in the weak topology.
-/

theorem ma_proofbench_l2_78
    {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]
    (Y : Submodule ℝ X) :
    IsClosed (Y : Set X) ↔
      IsClosed ((toWeakSpace ℝ X) '' (Y : Set X) : Set (WeakSpace ℝ X)) := by
  sorry
