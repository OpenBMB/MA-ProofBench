import Mathlib

/--
The function $f(x)=1+x+x^2/2!+\cdots+x^n/n!$, $x\in\mathbb{R}$, has a unique zero for odd

$n\in\mathbb{N}^*$.
-/

theorem ma_proofbench_l1_19 (n : ℕ) (hnpos : 0 < n) (hnodd : Odd n) :
    ∃! x : ℝ, (∑ k ∈ Finset.range (n + 1), x ^ k / (Nat.factorial k)) = 0 := by
  sorry
