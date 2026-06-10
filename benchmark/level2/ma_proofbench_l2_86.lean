import Mathlib

/--
Let $D=\{z:|z|<1\}\subset\mathbb{C}$ be the unit disk and $g:D\to\mathbb{C}$ be a holomorphic
function such that $g(0)=0$ and $|\operatorname{Re} g(z)|<1$ for any $z\in D$. Prove that for any
$z\in D$,
\[
|g(z)|\le \frac{2}{\pi}\log\frac{1+|z|}{1-|z|}.
\]
-/

abbrev D : Set ℂ := Metric.ball (0 : ℂ) 1

theorem ma_proofbench_l2_86
  (g : ℂ → ℂ)
  (hg_holo : DifferentiableOn ℂ g D)
  (hg0 : g 0 = 0)
  (hRe : ∀ z : ℂ, z ∈ D → |(Complex.re (g z))| < 1) :
  ∀ z : ℂ,
    z ∈ D →
      ‖g z‖ ≤ (2 / Real.pi) * Real.log ((1 + ‖z‖) / (1 - ‖z‖)) := by
  sorry
