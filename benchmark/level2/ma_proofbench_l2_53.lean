import Mathlib

/--
Let $H$ be a separable Hilbert space and $\{e_j\}_{j=1}^\infty$ be an orthonormal basis. A bounded operator $A$ on $H$ is called Hilbert--Schmidt if
\[
\sum_{j=1}^\infty \|A e_j\|^2 < \infty.
\]
Show that this implies that $\sum_{j=1}^\infty \|A e'_j\|^2 < \infty$ for any orthonormal basis $\{e'_j\}_{j=1}^\infty$ of $H$.
-/

theorem ma_proofbench_l2_53
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [TopologicalSpace.SeparableSpace H]
    (A : H →L[ℂ] H)
    (e : HilbertBasis ℕ ℂ H)
    (hHS : ∃ e0 : HilbertBasis ℕ ℂ H, Summable (fun j : ℕ => ‖A (e0 j)‖ ^ 2)) :
    Summable (fun j : ℕ => ‖A (e j)‖ ^ 2) := by
  sorry
