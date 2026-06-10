import Mathlib

open Set

/--
Let $f:[0,1]\to \mathbb{R}$ be a smooth function. Suppose that for every $x\in [0,1]$, there exists $n\in \mathbb{Z}_{\ge 0}$ such that $f^{(n)}(x)=0$. Prove that $f$ is a polynomial.
-/

theorem ma_proofbench_l2_81 (f : ℝ → ℝ)
    (hf : ContDiffOn ℝ ⊤ f (Icc (0 : ℝ) 1))
    (hvanish : ∀ x ∈ Icc (0 : ℝ) 1, ∃ n : ℕ, iteratedDeriv n f x = 0) :
    ∃ p : Polynomial ℝ, ∀ x ∈ Icc (0 : ℝ) 1, f x = p.eval x := by
  sorry
