import Mathlib

open scoped BigOperators

/--
Let $H$ be an infinite-dimensional separable Hilbert space, and $T:H\to H$ a bounded operator. The operator norm and Hilbert-Schmidt norm of $T$ are
\[
\|T\|_{\mathrm{op}} := \sup_{\|x\|=1}\|Tx\|,\qquad
\|T\|_{\mathrm{HS}} := \sqrt{\sum_{i=1}^{\infty}\|Tu_i\|^2},
\]
where $\{u_i\}_{i=1}^{\infty}$ is any fixed orthonormal basis of $H$.
Suppose that $H/\ker(T)$ is finite-dimensional. Show that $\|T\|_{\mathrm{HS}}\le C\|T\|_{\mathrm{op}}$ for some constant $C>0$ depending only on the dimension of $H/\ker(T)$.
-/

noncomputable def hsNorm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (T : H →L[ℝ] H) (u : ℕ → H) : ℝ :=
  Real.sqrt (∑' n : ℕ, ‖T (u n)‖ ^ 2)

theorem ma_proofbench_l2_98
    (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (T : H →L[ℝ] H)
    (u : ℕ → H) (hu : Orthonormal ℝ u)
    [FiniteDimensional ℝ (H ⧸ T.ker)] :
    ∃ C : ℕ → ℝ, (∀ n : ℕ, 0 < C n) ∧
      hsNorm T u ≤ C (Module.finrank ℝ (H ⧸ T.ker)) * ‖T‖ := by
  sorry
