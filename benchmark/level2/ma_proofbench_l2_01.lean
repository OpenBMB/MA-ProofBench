import Mathlib

/--
Let $f : \mathbb{R}^2 \to \mathbb{R}$ be an infinitely differentiable function. Suppose $f(x,y)=0$ whenever $xy=0$.
Prove that there exists $C>0$ such that
\[
|f(x,y)| \le C|x||y|, \quad \forall (x,y)\in B(0,1).
\]
-/

theorem ma_proofbench_l2_01
    (f : ℝ × ℝ → ℝ)
    (hf : ContDiff ℝ (⊤ : ℕ∞) f)
    (hzero : ∀ x y : ℝ, x * y = 0 → f (x, y) = 0) :
    ∃ C : ℝ, 0 < C ∧
      ∀ x y : ℝ, (x, y) ∈ Metric.ball (0 : ℝ × ℝ) 1 →
        |f (x, y)| ≤ C * |x| * |y| := by
  sorry
