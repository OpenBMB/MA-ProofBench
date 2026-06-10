import Mathlib

/--
Suppose $f\in C^{1}(I,\mathbb{R})$ has $f(\alpha)=0$. Show that

\[
\int_{\alpha}^{\beta} |f f'|\,dx \le \frac{\beta-\alpha}{2}\int_{\alpha}^{\beta} |f'|^{2}\,dx.
\]
-/

theorem ma_proofbench_l1_76 {α β : ℝ} (hαβ : α ≤ β) {f : ℝ → ℝ}
    (hf : ContDiffOn ℝ 1 f (Set.Icc α β))
    (hfa : f α = 0) :
    (∫ x in α..β, |f x * deriv f x|)
      ≤ ((β - α) / 2) * ∫ x in α..β, (|deriv f x| ^ 2) := by
  sorry
