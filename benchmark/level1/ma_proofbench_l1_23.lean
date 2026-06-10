import Mathlib

open Function

/--
Show that every sequence in $\R$ has a monotone subsequence.
-/

theorem ma_proofbench_l1_23 (u : ℕ → ℝ) :
    (∃ φ : ℕ → ℕ, StrictMono φ ∧ Monotone (u ∘ φ)) ∨ (∃ φ : ℕ → ℕ, StrictMono φ ∧ Antitone (u ∘ φ)) := by
  sorry
