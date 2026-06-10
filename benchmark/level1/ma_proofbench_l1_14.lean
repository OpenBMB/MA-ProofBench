import Mathlib

/--
Give an example of a power series $\sum_{k=0}^{\infty}a_k z^k$ which converges for every complex value of $z$ and which sums to zero

for infinitely many values of $z$ but which is not the identically zero series.
-/

theorem ma_proofbench_l1_14 : ∃ a : ℕ → ℂ,
      (∀ z : ℂ, Summable (fun k : ℕ => a k * z ^ k)) ∧
      Set.Infinite {z : ℂ | (∑' k : ℕ, a k * z ^ k) = 0} ∧
      (∃ k : ℕ, a k ≠ 0) := by
  sorry
