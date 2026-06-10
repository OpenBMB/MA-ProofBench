import Mathlib

open Topology Filter

/--
Let the function $f$ be analytic in the entire complex plane, and suppose that $f(z)/z\to 0$ as $|z|\to\infty$. Prove that $f$ is constant.
-/

theorem ma_proofbench_l2_28 {f : ℂ → ℂ} (hf : Differentiable ℂ f) 
  (hlim : Tendsto (fun z : ℂ => f z / z) (comap (fun z : ℂ => ‖z‖) atTop) (𝓝 (0 : ℂ))) : 
  ∃ c : ℂ, ∀ z : ℂ, f z = c := by
sorry
