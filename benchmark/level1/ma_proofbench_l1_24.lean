import Mathlib

/--
Let $\sum_{k=0}^{\infty}a_k x^k$ and $\sum_{k=0}^{\infty}b_k x^k$ be real power series which converge for $|x|<1$.

Suppose that $\sum_{k=0}^{\infty}a_k x^k=\sum_{k=0}^{\infty}b_k x^k$ when $x=1/2,1/3,1/4,\dots$.
Prove that $a_k=b_k$ for all $k$.
-/

theorem ma_proofbench_l1_24 (a b : ℕ → ℝ) (ha : ∀ x : ℝ, |x| < 1 → Summable (fun k : ℕ => a k * x ^ k)) (hb : ∀ x : ℝ, |x| < 1 → Summable (fun k : ℕ => b k * x ^ k))
    (hEq : ∀ n : ℕ, (∑' k : ℕ, a k * ((1 : ℝ) / (n + 2)) ^ k) = (∑' k : ℕ, b k * ((1 : ℝ) / (n + 2)) ^ k)) :
    ∀ k : ℕ, a k = b k := by
  sorry
