import Mathlib

/--
For $n\in\N^\ast$, prove the following error estimate:

\[
0<e-\sum_{k=0}^{n}\frac{1}{k!}<\frac{1}{n\,n!}.
\]
-/

theorem ma_proofbench_l1_73 (n : ℕ) (hn : 0 < n) :
    0 < Real.exp 1 - (∑ k ∈ Finset.range (n + 1), (1 : ℝ) / (Nat.factorial k)) ∧ 
    Real.exp 1 - (∑ k ∈ Finset.range (n + 1), (1 : ℝ) / (Nat.factorial k)) < (1 : ℝ) / (n * Nat.factorial n) := by
  sorry
