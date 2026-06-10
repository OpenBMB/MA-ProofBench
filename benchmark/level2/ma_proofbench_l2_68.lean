import Mathlib

open scoped BigOperators

/--
Let $H$ be an infinite-dimensional separable Hilbert space, and $T:H\to H$ a bounded operator. The operator norm and Hilbert-Schmidt norm of $T$ are
\[
\|T\|_{\mathrm{op}} := \sup_{\|x\|=1}\|Tx\|,\qquad
\|T\|_{\mathrm{HS}} := \sqrt{\sum_{i=1}^{\infty}\|Tu_i\|^2},
\]
where $\{u_i\}_{i=1}^{\infty}$ is any fixed orthonormal basis of $H$.
Show that $\|Tx\|\le \|T\|_{\mathrm{HS}}$ for any $x\in H$ with $\|x\|=1$.
-/

noncomputable def hsNorm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (T : H →L[ℝ] H) (u : ℕ → H) : ℝ :=
  Real.sqrt (∑' n : ℕ, ‖T (u n)‖ ^ 2)

theorem ma_proofbench_l2_68
    (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (T : H →L[ℝ] H)
    (u : HilbertBasis ℕ ℝ H) :
    (∑' n : ℕ, ENNReal.ofReal (‖T (u n)‖ ^ 2)) = ⊤ ∨
      (∀ x : H, ‖x‖ = 1 → ‖T x‖ ≤ hsNorm T u) := by
  sorry
