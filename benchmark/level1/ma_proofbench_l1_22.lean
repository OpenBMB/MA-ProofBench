import Mathlib

/--
Let $E$ be a Banach space and let $T : E \to E^*$ be a linear operator satisfying

\[
\langle Tx, y\rangle = \langle Ty, x\rangle \quad \forall x,y\in E.
\]
Prove that $T$ is a bounded operator.
-/

theorem ma_proofbench_l1_22 {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (T : E →ₗ[ℝ] StrongDual ℝ E) (hsym : ∀ x y : E, (T x) y = (T y) x) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ x : E, ‖T x‖ ≤ C * ‖x‖ := by
  sorry
