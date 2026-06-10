import Mathlib

/--
Suppose $F$ is of bounded variation and continuous. Prove that $F=F_1-F_2$, where both $F_1$ and $F_2$ are monotonic and continuous.
-/

theorem ma_proofbench_l1_33 {F : ℝ → ℝ} (hF_bv : BoundedVariationOn F (Set.univ : Set ℝ))
    (hF_cont : Continuous F) :
    ∃ F₁ F₂ : ℝ → ℝ, Monotone F₁ ∧ Continuous F₁ ∧ Monotone F₂ ∧ Continuous F₂ ∧ F = F₁ - F₂ := by
  sorry
