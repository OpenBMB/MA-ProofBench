import Mathlib

/--
Fix a positive integer $k$. Suppose that $f$ is an entire function such that, for some $k$, the $k$th derivative $f^{(k)}$ of $f$ is a polynomial.

Prove that $f$ is a polynomial.
-/

theorem ma_proofbench_l1_90 {k : ℕ} (hk : 0 < k) {f : ℂ → ℂ}
    (hf : Differentiable ℂ f)
    (hpoly : ∃ p : Polynomial ℂ, iteratedDeriv k f = fun z => p.eval z) :
    ∃ q : Polynomial ℂ, f = fun z => q.eval z := by
  sorry
