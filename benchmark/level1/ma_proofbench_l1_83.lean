import Mathlib

/--
Let $f\in C_{2\pi}(\mathbb R,\mathbb R)$ be differentiable. Show that $f'$ has a zero in $(0,2\pi)$.
-/

theorem ma_proofbench_l1_83 {f : ℝ → ℝ}
    (hper : Function.Periodic f (2 * Real.pi))
    (hdiff : Differentiable ℝ f) :
    ∃ c ∈ Set.Ioo 0 (2 * Real.pi), deriv f c = 0 := by
  sorry
