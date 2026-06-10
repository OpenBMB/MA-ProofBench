import Mathlib

/--
Suppose $\nu,\nu_{1},\nu_{2}$ are signed measures on $(X,\mathcal{M})$ and $\mu$ a (positive) measure on $\mathcal{M}$. Prove $\nu_{1}\perp \nu_{2}$ implies $|\nu_{1}|\perp |\nu_{2}|$.
-/

theorem ma_proofbench_l1_98 {X : Type*} [MeasurableSpace X]
    (ν₁ ν₂ : MeasureTheory.SignedMeasure X)
    (h : MeasureTheory.VectorMeasure.MutuallySingular ν₁ ν₂) :
    (MeasureTheory.Measure.MutuallySingular ν₁.totalVariation ν₂.totalVariation) := by
  sorry
