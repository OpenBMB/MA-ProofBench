import Mathlib

/--
Suppose $f:D\to\mathbb{C}$ is holomorphic. Show that the diameter $d=\sup_{z,w\in D}|f(z)-f(w)|$ of the image of $f$ satisfies

\[
2|f'(0)|\le d.
\]
-/

theorem ma_proofbench_l1_78 (f : ℂ → ℂ) (hf : DifferentiableOn ℂ f (Metric.ball (0 : ℂ) 1)) :
    ENNReal.ofReal (2 * ‖deriv f 0‖) ≤ Metric.ediam (f '' (Metric.ball (0 : ℂ) 1)) := by
  sorry
