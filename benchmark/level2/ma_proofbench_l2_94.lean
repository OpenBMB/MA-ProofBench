import Mathlib

/--
Prove that there is $C > 0$ such that the following holds for all $f \in \mathcal{S}(\mathbb{R})$:
\[
\|f\|_{L^\infty(\mathbb{R})} \le C \|f\|_{L^2(\mathbb{R})}^{1/2} \|f'\|_{L^2(\mathbb{R})}^{1/2}.
\]
-/

theorem ma_proofbench_l2_94 :
    ∃ C > 0, ∀ f : SchwartzMap ℝ ℝ,
      ‖f.toLp (⊤ : ENNReal) (MeasureTheory.volume : MeasureTheory.Measure ℝ)‖ ≤
        C * Real.sqrt ‖f.toLp (2 : ENNReal) (MeasureTheory.volume : MeasureTheory.Measure ℝ)‖ *
          Real.sqrt
            ‖(SchwartzMap.derivCLM ℝ ℝ f).toLp
                (2 : ENNReal) (MeasureTheory.volume : MeasureTheory.Measure ℝ)‖ := by
  sorry
