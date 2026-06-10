import Mathlib

/--
In the case of equality in the Cauchy-Schwarz inequality we have the following. If $|(f,g)| = \|f\| \|g\|$ and $g \ne 0$, then $f = cg$ for some scalar $c$.
-/

theorem ma_proofbench_l1_91 {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (f g : E)
    (h : ‖inner ℝ f g‖ = ‖f‖ * ‖g‖)
    (hg : g ≠ 0) :
    ∃ c : ℝ, f = c • g := by
  sorry
