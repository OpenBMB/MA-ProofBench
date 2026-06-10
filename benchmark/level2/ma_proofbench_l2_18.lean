import Mathlib

/--
Let $D=\{z\in\mathbb{C}:|z|<1\}$ be the unit disk and suppose $f:D\to\mathbb{C}$ is an injective holomorphic function with $f(0)=0$ and $f'(0)=1$. Define $\Omega:=f(D)$.

Show that $\mathrm{dist}(0,\partial\Omega):=\inf\{|z|:z\in\partial\Omega\}\le 1$.
-/

theorem ma_proofbench_l2_18
  (f : ℂ → ℂ) (hf_holo : DifferentiableOn ℂ f (Metric.ball (0 : ℂ) 1))
  (hf_inj : Set.InjOn f (Metric.ball (0 : ℂ) 1)) (hf0 : f 0 = 0) (hf'0 : deriv f 0 = 1) :
  Metric.infDist (0 : ℂ) (frontier (f '' (Metric.ball (0 : ℂ) 1))) ≤ 1 := by
  sorry
