import Mathlib

/--
Suppose $H$ is a closed subspace of $L^2([0, 1])$ such that $H \subset C([0, 1])$. Prove that $H$ is finite-dimensional.
-/

theorem ma_proofbench_l2_11
    (H : Submodule ℝ (MeasureTheory.Lp ℝ (2 : ENNReal)
        (MeasureTheory.volume : MeasureTheory.Measure (Set.Icc (0 : ℝ) 1))))
    (hclosed : IsClosed (H : Set (MeasureTheory.Lp ℝ (2 : ENNReal)
          (MeasureTheory.volume : MeasureTheory.Measure (Set.Icc (0 : ℝ) 1)))))
    (hsubset : H ≤ (ContinuousMap.toLp (E := ℝ) (p := (2 : ENNReal))
        (MeasureTheory.volume : MeasureTheory.Measure (Set.Icc (0 : ℝ) 1)) ℝ).range) :
    FiniteDimensional ℝ ↥H := by
  sorry
