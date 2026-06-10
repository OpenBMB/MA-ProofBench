import Mathlib

/--
Suppose that $f\in C([a,b],\mathbb{R})$ is differentiable on $(a,b)$ and satisfies

$f(a)\ge 0$ and $f'(x)\ge 0$ for all $x\in(a,b)$.
Prove that $f(x)\ge 0$ for all $x\in[a,b]$.
-/

theorem ma_proofbench_l1_87 {a b : ℝ} (hab : a ≤ b)
    (f : ℝ → ℝ)
    (hf_cont : ContinuousOn f (Set.Icc a b))
    (hf_diff : DifferentiableOn ℝ f (Set.Ioo a b))
    (hfa : 0 ≤ f a)
    (hfderiv : ∀ x : ℝ, x ∈ Set.Ioo a b → 0 ≤ deriv f x) :
    ∀ x : ℝ, x ∈ Set.Icc a b → 0 ≤ f x := by
  sorry
