import Mathlib

/--
Suppose $T:X\to Y$ is a bounded linear operator between Hilbert spaces and $T^*T$ is Fredholm.
Show that $T$ has closed range.
-/

def IsFredholm {X Y : Type*}
    [NormedAddCommGroup X] [InnerProductSpace ℂ X] [CompleteSpace X]
    [NormedAddCommGroup Y] [InnerProductSpace ℂ Y] [CompleteSpace Y]
    (A : X →L[ℂ] Y) : Prop :=
  FiniteDimensional ℂ A.ker ∧
    ∃ G : Submodule ℂ Y, FiniteDimensional ℂ G ∧ IsCompl A.range G

theorem ma_proofbench_l2_23 {X Y : Type*}
    [NormedAddCommGroup X] [InnerProductSpace ℂ X] [CompleteSpace X]
    [NormedAddCommGroup Y] [InnerProductSpace ℂ Y] [CompleteSpace Y]
    (T : X →L[ℂ] Y)
    (hFredholm : IsFredholm (T.adjoint.comp T)) :
    IsClosed (LinearMap.range T.toLinearMap : Set Y) := by
  sorry
