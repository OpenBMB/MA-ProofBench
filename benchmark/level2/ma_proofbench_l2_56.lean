import Mathlib

/--
Let $\{f_n(x,y,z)\}_{n=1}^\infty$ be a sequence of $C^1$ functions on $\mathbb{R}^3$ satisfying
\[
\left(\int_{\mathbb{R}^3} (|\nabla f_n|^2+|f_n|^2)\,dxdydz\right)^{1/2}\le 1.
\]
Prove that $\{f_n(x,y,0)\}$ is bounded in $L^2(dxdy)$.
-/

theorem ma_proofbench_l2_56
    (f : ℕ → ℝ × ℝ × ℝ → ℝ)
    (hC1 : ∀ n : ℕ, ContDiff ℝ 1 (f n))
    (henergy : ∀ n : ℕ,
      (∫ x : ℝ × ℝ × ℝ,
        (‖f n x‖ ^ 2 + ‖fderiv ℝ (f n) x‖ ^ 2) ∂MeasureTheory.volume) ≤ 1) :
    ∃ C : ℝ, 0 ≤ C ∧
      ∀ n : ℕ,
        (∫ p : ℝ × ℝ, ‖f n (p.1, p.2, 0)‖ ^ 2 ∂MeasureTheory.volume) ≤ C := by
  sorry
