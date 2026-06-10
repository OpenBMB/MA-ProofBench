import Mathlib

/--
The function $f\in C^{1}(\mathbb{R}^{2},\mathbb{R})$ satisfies $\partial_{1}f=\partial_{2}f$ and $f(0,0)=0$. Show that there is a

$g\in C(\mathbb{R}^{2},\mathbb{R})$ such that $f(x,y)=g(x,y)(x+y)$ for $(x,y)\in\mathbb{R}^{2}$.
-/

theorem ma_proofbench_l1_02 {f : ℝ × ℝ → ℝ} (hf : ContDiff ℝ 1 f)
    (hpar : ∀ p : ℝ × ℝ, (fderiv ℝ f p) (1, 0) = (fderiv ℝ f p) (0, 1))
    (h0 : f (0, 0) = 0) :
    ∃ g : ℝ × ℝ → ℝ, Continuous g ∧
      ∀ x y : ℝ, f (x, y) = g (x, y) * (x + y) := by
  sorry
