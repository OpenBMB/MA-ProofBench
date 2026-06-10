import Mathlib

/--
Assume $|\Omega|<\infty$ and let $1 < p\le q < \infty$. Prove that $L^{q}(\Omega)\subset L^{p}(\Omega)$ with continuous injection. More precisely, show that

\[
\|f\|_{p}\le |\Omega|^{\frac1p-\frac1q}\|f\|_{q}\qquad \forall f\in L^{q}(\Omega).
\]
-/

theorem ma_proofbench_l1_70 {α : Type*} [MeasurableSpace α] (μ : MeasureTheory.Measure α)
    {p q : ℝ} (hp₁ : 1 < p) (hpq : p ≤ q) (hμ : μ Set.univ < ⊤) :
    ∀ (f : α → ℝ), MeasureTheory.MemLp f (ENNReal.ofReal q) μ →
      MeasureTheory.eLpNorm f (ENNReal.ofReal p) μ ≤
        (ENNReal.rpow (μ Set.univ) ((1 / p) - (1 / q))) * MeasureTheory.eLpNorm f (ENNReal.ofReal q) μ := by
  sorry
