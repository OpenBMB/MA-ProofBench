import Mathlib

open scoped FourierTransform

/--
Let $F$ denote the Fourier transform on $\mathbb{R}^n$.
Prove that there exists $C > 0$ such that the following holds for all $f \in \mathcal{S}(\mathbb{R}^n)$:
\[
\|Ff\|_{L^{p'}} \le C \|f\|_{L^p}, \quad \forall 1 \le p \le 2, \quad \frac{1}{p'} + \frac{1}{p} = 1.
\]
-/

theorem ma_proofbench_l2_84
    {n : ℕ} :
    ∃ C : ℝ, 0 < C ∧
      ∀ p p' : ENNReal,
        1 ≤ p → p ≤ 2 → ENNReal.HolderConjugate p p' →
          ∀ f : SchwartzMap (EuclideanSpace ℝ (Fin n)) ℂ,
            ‖(𝓕 f).toLp p'
                (MeasureTheory.volume : MeasureTheory.Measure (EuclideanSpace ℝ (Fin n)))‖ ≤
              C * ‖f.toLp p
                (MeasureTheory.volume : MeasureTheory.Measure (EuclideanSpace ℝ (Fin n)))‖ := by
  sorry
