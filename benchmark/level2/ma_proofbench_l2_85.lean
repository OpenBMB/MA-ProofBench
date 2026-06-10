import Mathlib

open MeasureTheory Filter

/--
Show that if $X, Y$ are Hilbert spaces, $A \in L(X, Y)$, and $\mathrm{Ran}\,A$ is closed then $\mathrm{Ran}\,A^*$ is closed (where $A^* \in L(Y, X)$ is the Hilbert space adjoint).
-/

theorem ma_proofbench_l2_85 {X Y : Type*}
    [NormedAddCommGroup X] [InnerProductSpace ℂ X] [CompleteSpace X]
    [NormedAddCommGroup Y] [InnerProductSpace ℂ Y] [CompleteSpace Y]
    (A : X →L[ℂ] Y)
    (hRan : IsClosed (LinearMap.range A.toLinearMap : Set Y)) :
    IsClosed (LinearMap.range A.adjoint.toLinearMap : Set X) := by
  sorry
