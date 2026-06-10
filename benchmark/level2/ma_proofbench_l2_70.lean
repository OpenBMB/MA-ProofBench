import Mathlib

open scoped FourierTransform

/--
Prove that there exists $C_0 > 0$ such that the following holds for all $1 \le p \le \infty$ and all $f \in \mathcal{S}(\mathbb{R})$ satisfying $\mathrm{supp}(\mathcal{F}f) \subset B(0, 1)$:
\[
\|f'\|_{L^p(\mathbb{R})} \le C_0 \|f\|_{L^p(\mathbb{R})},
\]
where $\mathcal{F}$ denotes the Fourier transform.
-/

theorem ma_proofbench_l2_70 :
    ∃ C0 > 0, ∀ p : ENNReal,
      (1 : ENNReal) ≤ p  →
      ∀ f : SchwartzMap ℝ ℂ,
        Function.support (fun ξ : ℝ => (𝓕 f) ξ) ⊆ Metric.ball (0 : ℝ) 1 →
          ‖(SchwartzMap.derivCLM ℂ ℂ f).toLp p
              (MeasureTheory.volume : MeasureTheory.Measure ℝ)‖ ≤
            C0 * ‖f.toLp p (MeasureTheory.volume : MeasureTheory.Measure ℝ)‖ := by
  sorry
