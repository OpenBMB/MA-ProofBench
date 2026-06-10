import Mathlib

/--
Let $a,b\in\mathbb{C}$, $\omega\in\mathbb{R}$, and $f:\mathbb{C}\to\mathbb{C}$ be twice differentiable with

\[
f(z)+\omega^{2}f''(z)=0,\qquad f(0)=a,\qquad f'(0)=\omega b.
\]
Show that $f\in C^{\infty}(\mathbb{C})$.
-/

theorem ma_proofbench_l1_69 (a b : ℂ) (ω : ℝ) (f : ℂ → ℂ)
    (hf2 : ContDiff ℂ 2 f)
    (hode : ∀ z : ℂ, f z + ω ^ 2 * (deriv (deriv f) z) = 0)
    (h0 : f 0 = a)
    (h1 : deriv f 0 = ω * b) :
    ContDiff ℂ (⊤ : ℕ∞) f := by
  sorry
