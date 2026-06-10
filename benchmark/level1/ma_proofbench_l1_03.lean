import Mathlib

/--
Suppose $0<\delta<\pi$, show that

\[
\sum_{n=1}^\infty \frac{\sin^2(n\delta)}{n^2\delta} = \frac{\pi-\delta}{2}.
\]
-/

theorem ma_proofbench_l1_03
    {δ : ℝ} (hδ0 : 0 < δ) (hδpi : δ < Real.pi) :
    (∑' n : ℕ,
        (Real.sin ((n + 1 : ℕ) * δ)) ^ 2 / (((n + 1 : ℕ) ^ 2) * δ))
      = (Real.pi - δ) / 2 := by
  sorry
