import Mathlib

/--
Prove that the function

\[
\phi(z)=i\,\frac{1-z}{1+z}
\]
maps the set $D=\{z\in\mathbb{C}:|z|<1\}$ one-to-one onto the set $U=\{z\in\mathbb{C}:\mathrm{Im}\,z>0\}$.
-/

theorem ma_proofbench_l1_63
    (φ : ℂ → ℂ) (hφ : φ = fun z : ℂ => Complex.I * (1 - z) / (1 + z)) :
    Set.BijOn φ (Metric.ball (0 : ℂ) 1) {w : ℂ | 0 < w.im} := by
  sorry
