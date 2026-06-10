import Mathlib

open scoped BigOperators

/--
Consider the entire function
\[
F(z)=1+\sum_{n=1}^{\infty}\left(\frac{z}{n}\right)^{n}.
\]
Show that for any $R>0$, the function $F(z)$ has no more than $4R$ zeros (counting multiplicity) in the ball $\{z\in\mathbb{C}:\lvert z\rvert<R\}$.
-/

noncomputable def F : ℂ → ℂ :=
  fun z => 1 + ∑' n : ℕ, (z / (n + 1 : ℂ)) ^ (n + 1)

theorem ma_proofbench_l2_91
  (R : ℝ)
  (hR : 0 < R) :
  ∃ s : Finset ℂ,
    (∀ z : ℂ, z ∈ s ↔ ‖z‖ < R ∧ F z = 0) ∧
    ((∑ z ∈ s, analyticOrderNatAt F z) : ℝ) ≤ 4 * R := by
  sorry
