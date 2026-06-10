import Mathlib

/--
Suppose $f(x)f(y)=f(x+y)$ for all real $x$ and $y$. Assuming that $f$ is continuous and not zero, prove that

 \[
 f(x)=e^{cx},
 \]
 where $c$ is a constant.
-/

theorem ma_proofbench_l1_32
    {f : ℝ → ℝ}
    (hadd : ∀ x y : ℝ, f x * f y = f (x + y))
    (hcont : Continuous f)
    (hnz : f ≠ 0) :
    ∃ c : ℝ, ∀ x : ℝ, f x = Real.exp (c * x) := by
  sorry
