import Mathlib

/--
Suppose $f\in C^{1}(I,\mathbb{R})$ has $f(\alpha)=f(\beta)=0$. Show that

\[
\|f\|_{\infty}^{2}\le \frac{1}{2}\int_{\alpha}^{\beta}\bigl(f^{2}+(f')^{2}\bigr)\,dx.
\]
-/

theorem ma_proofbench_l1_54 {α β : ℝ} (hαβ : α ≤ β) {f : ℝ → ℝ}
    (hf : ContDiffOn ℝ 1 f (Set.Icc α β))
    (hfa : f α = 0) (hfb : f β = 0) :
    (sSup (Set.image (fun x => ‖f x‖) (Set.Icc α β))) ^ 2
      ≤ (1 / 2 : ℝ) *
          ∫ x in α..β, ((f x) ^ 2 + (deriv f x) ^ 2) := by
  sorry
