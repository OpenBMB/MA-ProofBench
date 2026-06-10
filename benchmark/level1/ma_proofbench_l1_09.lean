import Mathlib

/--
Prove that the function

\[
f(z)=\sum_{j=0}^{\infty} 2^{-j} z^{(2^j)}
\]
is holomorphic on $D(0,1)$ and continuous on $\overline{D}(0,1)$.
-/

noncomputable def f (z : ℂ) : ℂ :=
  ∑' j : ℕ, ((1 / (2 : ℂ)) ^ j) * z ^ (2 ^ j)

theorem ma_proofbench_l1_09 :
    DifferentiableOn ℂ f (Metric.ball 0 1) ∧
      ContinuousOn f (closure (Metric.ball 0 1)) := by
  sorry
