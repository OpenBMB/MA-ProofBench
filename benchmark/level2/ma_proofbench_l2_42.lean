import Mathlib

open TopologicalSpace

/--
Prove that if H is a nonseparable Hilbert space and A is a compact operator on H, then the nullspace ker(A) is itself a nonseparable Hilbert space.
-/

theorem ma_proofbench_l2_42 {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A : H →L[ℂ] H)
    (hH : ¬ SeparableSpace H)
    (hA : IsCompactOperator A) :
    ¬ SeparableSpace (A.ker) := by
  sorry
