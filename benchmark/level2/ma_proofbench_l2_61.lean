import Mathlib

/--
Let $f$ and $g$ be entire functions such that
\[
f^3+g^3=1\quad \text{on } \mathbb{C}.
\]
Show that $f$ and $g$ are constant.
-/

theorem ma_proofbench_l2_61
    (f g : ℂ → ℂ)
    (hf_entire : Differentiable ℂ f)
    (hg_entire : Differentiable ℂ g)
    (hfg : ∀ z : ℂ, f z ^ (3 : ℕ) + g z ^ (3 : ℕ) = 1) :
    ∃ a b : ℂ, (∀ z : ℂ, f z = a) ∧ (∀ z : ℂ, g z = b) := by
  sorry
