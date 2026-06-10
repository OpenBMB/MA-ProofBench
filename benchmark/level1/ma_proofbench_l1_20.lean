import Mathlib

/--
Let $F:\mathbb{H}\to\mathbb{C}$ be a holomorphic function that satisfies

\[
|F(z)|\le 1\qquad\text{and}\qquad F(i)=0.
\]
Prove that
\[
|F(z)|\le \left|\frac{z-i}{z+i}\right|\qquad\text{for all } z\in\mathbb{H}.
\]
-/

theorem ma_proofbench_l1_20 (F : ℂ → ℂ)
    (hHolo : DifferentiableOn ℂ F {z : ℂ | 0 < z.im})
    (hBound : ∀ z, 0 < z.im → norm (F z) ≤ 1)
    (hFi : F Complex.I = 0) :
    ∀ z : ℂ, 0 < z.im →
      norm (F z) ≤ norm ((z - Complex.I) / (z + Complex.I)) := by
  sorry
