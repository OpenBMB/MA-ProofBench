import Mathlib

open MeasureTheory

/--
Prove that for any $A\subset \mathbb{R}$ with positive Lebesgue measure there exist $x\in A$ and $y>0$ for which $x+y,\ x-y\in A$.
-/

theorem ma_proofbench_l2_75 (A : Set ℝ) (hAmeas : MeasurableSet A) (hApos : (0 : ENNReal) < volume A) :
    ∃ x ∈ A, ∃ y : ℝ, 0 < y ∧ x + y ∈ A ∧ x - y ∈ A := by
  sorry
