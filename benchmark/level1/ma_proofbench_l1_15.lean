import Mathlib

/--
Consider the convolution

\[
(f*g)(x)=\int_{\mathbb{R}^{d}} f(x-y)g(y)\,dy.
\]
Show that $f*g$ is uniformly continuous when $f$ is integrable and $g$ bounded.
-/

theorem ma_proofbench_l1_15 (d : ℕ)
    (f g : (Fin d → ℝ) → ℝ) (hf : MeasureTheory.Integrable f)
    (hg_meas : Measurable g)
    (hg_bdd : Bornology.IsBounded (Set.range g)) :
    UniformContinuous
      (fun x =>
        ∫ y, (f (x - y)) * (g y)) := by
  sorry
