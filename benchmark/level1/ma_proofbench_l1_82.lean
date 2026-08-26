import Mathlib

open MeasureTheory

variable {X : Type*} [MeasurableSpace X] (μ : Measure X)

/--
Suppose $\mu$ is a positive measure on $X$ and $f:X\to(0,\infty)$ satisfies $\int_X f\,d\mu=1$. Prove, for every $E\subset X$ with $0<\mu(E)<\infty$, that

\[
\int_E (\log f)\,d\mu \le \mu(E)\log\frac{1}{\mu(E)}
\]
-/
theorem ma_proofbench_l1_82 (f : X → ℝ)
    (hf_pos : ∀ x, 0 < f x)
    (hf_int : Integrable f μ)
    (hf_one : (∫ x, f x ∂μ) = 1)
    (E : Set X) (hE_meas : MeasurableSet E)
    (hE_pos : 0 < μ E)
    (hE_fin : μ E < ⊤) :
    (IntegrableOn (fun x => Real.log (f x)) E μ ∧
    (∫ x in E, Real.log (f x) ∂μ) ≤ (μ E).toReal * Real.log (1 / (μ E).toReal))
    ∨ ¬ IntegrableOn (fun x ↦ Real.log (f x)) E μ := by
  sorry
