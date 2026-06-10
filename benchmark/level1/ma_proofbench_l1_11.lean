import Mathlib

open Set

/--
Let $a>0$ and $f\in C^{2}([-a,a],\mathbb{R})$ be even.

Show that there exists $g\in C^{1}([0,a^{2}],\mathbb{R})$ such that
$f(x)=g(x^{2})$ for all $x\in[-a,a]$.
-/

theorem ma_proofbench_l1_11 (a : ℝ) (ha : 0 < a)
    (f : ℝ → ℝ)
    (hf_C2 : ContDiffOn ℝ 2 f (Icc (-a) a))
    (hf_even : ∀ x : ℝ, x ∈ Icc (-a) a → f x = f (-x)) :
    ∃ g : ℝ → ℝ,
      ContDiffOn ℝ 1 g (Icc 0 (a ^ (2 : ℕ))) ∧
      ∀ x : ℝ, x ∈ Icc (-a) a → f x = g (x ^ (2 : ℕ)) := by
  sorry
