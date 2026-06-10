import Mathlib

/--
Let $X$ be a Banach space, and $V\subset X$ be a subspace with finite codimension.

Suppose there exist a Banach space $Y$ and a bounded linear operator $A$ from $Y$
to $X$, such that $V=R(A)$. Show that $V$ is closed.
-/

theorem ma_proofbench_l2_30
  (𝕜 : Type*)
  [RCLike 𝕜]
  (X : Type*)
  [NormedAddCommGroup X]
  [NormedSpace 𝕜 X]
  [CompleteSpace X]
  (V : Submodule 𝕜 X)
  (hV_codim : FiniteDimensional 𝕜 (X ⧸ V))
  (Y : Type*)
  [NormedAddCommGroup Y]
  [NormedSpace 𝕜 Y]
  [CompleteSpace Y]
  (A : Y →L[𝕜] X)
  (hV_range : V = LinearMap.range (A : Y →ₗ[𝕜] X)) :
  IsClosed (V : Set X) := by
  sorry
