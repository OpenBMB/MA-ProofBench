import Mathlib

open MeasureTheory

/--
Consider the operator $T:L^{2}([0,1])\to L^{2}([0,1])$ defined by

\[
T(f)(t)=tf(t).
\]
Prove that $T$ is a bounded linear operator.
-/

theorem ma_proofbench_l1_31 :
    ∃ T : Lp ℝ 2 (volume.restrict (Set.Icc (0 : ℝ) 1)) →L[ℝ] Lp ℝ 2 (volume.restrict (Set.Icc (0 : ℝ) 1)),
      ∀ f : Lp ℝ 2 (volume.restrict (Set.Icc (0 : ℝ) 1)),
        ((T f : Lp ℝ 2 (volume.restrict (Set.Icc (0 : ℝ) 1))) : ℝ → ℝ)
          =ᵐ[volume.restrict (Set.Icc (0 : ℝ) 1)]
            fun t => t * (f : ℝ → ℝ) t := by
  sorry
