import Mathlib

open Topology Filter

/--
if we assume that $f$ is uniformly continuous on $\mathbb{R}$ and integrable, then $\lim_{|x|\to\infty} f(x)=0$.
-/

theorem ma_proofbench_l1_48 (f : ℝ → ℝ) (hfuc : UniformContinuous f) (hint : MeasureTheory.Integrable f) :
    Tendsto f (comap (fun x : ℝ => ‖x‖) atTop) (𝓝 0) := by
  sorry
