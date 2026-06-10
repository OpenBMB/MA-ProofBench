import Mathlib

open MeasureTheory

/--
Suppose $\mu(\Omega)=1$ and $h:\Omega\to[0,\infty)$ is measurable. If

\[
A=\int_\Omega h\,d\mu,
\]
prove that
\[
\sqrt{1+A^2}\le \int_\Omega \sqrt{1+h^2}\,d\mu \le 1+A.
\]
-/

theorem ma_proofbench_l1_66 {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    (h : Ω → NNReal) (hmeas : Measurable h)
    (hA_finite : (∫⁻ x, h x ∂μ) ≠ ⊤) (A : ℝ) (hA : A = (∫⁻ x, h x ∂μ).toReal) :
    Real.sqrt (1 + A ^ 2) ≤ ∫ x, Real.sqrt (1 + (h x).toReal ^ 2) ∂μ ∧
      (∫ x, Real.sqrt (1 + (h x).toReal ^ 2) ∂μ) ≤ 1 + A := by
  sorry
