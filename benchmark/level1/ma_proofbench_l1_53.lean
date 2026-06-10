import Mathlib

open MeasureTheory

/--
Suppose $\mu$ is a positive measure, $f\in L^p(\mu)$, $g\in L^p(\mu)$.

If $0<p<1$, prove that
\[
\int \bigl||f|^p-|g|^p\bigr|\,d\mu \le \int |f-g|^p\,d\mu.
\]
-/

theorem ma_proofbench_l1_53 {α : Type*} [MeasurableSpace α] {μ : Measure α} {p : ENNReal} (hp0 : 0 < p) (hp1 : p < 1)
    {f g : Lp ℝ p μ} :
    (∫ x, |((|f x|) ^ p.toReal) - ((|g x|) ^ p.toReal)| ∂μ) ≤
      ∫ x, (|f x - g x|) ^ p.toReal ∂μ := by
  sorry
