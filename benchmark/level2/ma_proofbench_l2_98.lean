import Mathlib

open scoped BigOperators

noncomputable def hsNorm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (T : H →L[ℝ] H) (u : ℕ → H) : ℝ :=
  Real.sqrt (∑' n : ℕ, ‖T (u n)‖ ^ 2)

/--
Let $H$ be an infinite-dimensional separable Hilbert space, and $T:H\to H$ a bounded operator. The operator norm and Hilbert-Schmidt norm of $T$ are
\[
\|T\|_{\mathrm{op}} := \sup_{\|x\|=1}\|Tx\|,\qquad
\|T\|_{\mathrm{HS}} := \sqrt{\sum_{i=1}^{\infty}\|Tu_i\|^2},
\]
where $\{u_i\}_{i=1}^{\infty}$ is any fixed orthonormal basis of $H$.
Suppose that $H/\ker(T)$ is finite-dimensional. Show that $\|T\|_{\mathrm{HS}}\le C\|T\|_{\mathrm{op}}$ for some constant $C>0$ depending only on the dimension of $H/\ker(T)$.
-/

theorem ma_proofbench_l2_98 :
    ∃ C : ℕ → ℝ, (∀ n : ℕ, 0 < C n) ∧
      ∀ (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
        [TopologicalSpace.SeparableSpace H] (hH : ¬ FiniteDimensional ℝ H)
        (T : H →L[ℝ] H) (b : HilbertBasis ℕ ℝ H)
        [FiniteDimensional ℝ (H ⧸ T.ker)],
        hsNorm T (⇑b) ≤ C (Module.finrank ℝ (H ⧸ T.ker)) * ‖T‖ := by
  sorry
