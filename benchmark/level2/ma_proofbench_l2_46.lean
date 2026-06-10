import Mathlib

open scoped FourierTransform

/--
Given $f \in S(\mathbb{R})$, denote its Fourier transform by $\hat{f}$. Prove that there exists $C > 0$ such that the following inequality holds for any $c, d \in \mathbb{R}$ and for any $f \in S(\mathbb{R})$,
\[
\left(\int_{-\infty}^{\infty} |f|^2(x)\, dx\right)^2 \le C
\left(\int_{-\infty}^{\infty} (x - c)^2 |f(x)|^2 dx\right)
\left(\int_{-\infty}^{\infty} (\xi - d)^2 |\hat{f}(\xi)|^2 d\xi\right).
\]
-/

theorem ma_proofbench_l2_46 :
    ∃ C : ℝ, 0 < C ∧
      ∀ c d : ℝ, ∀ f : SchwartzMap ℝ ℂ,
        (∫ x : ℝ, ‖f x‖ ^ 2) ^ 2 ≤
          C * (∫ x : ℝ, (x - c) ^ 2 * ‖f x‖ ^ 2) *
            (∫ ξ : ℝ, (ξ - d) ^ 2 * ‖(𝓕 f) ξ‖ ^ 2) := by
  sorry
