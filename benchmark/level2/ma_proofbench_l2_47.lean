import Mathlib

open scoped FourierTransform

/--
Let $F$ denote the Fourier transform on $\mathbb{R}^n$.
Prove that there exists $C > 0$ such that the following holds. For any Lebesgue measurable $E \subset \mathbb{R}^n$ with $L^n(E) < \infty$ and for all $f \in \mathcal{S}(\mathbb{R}^n)$ with $\operatorname{supp}(Ff) \subset E$:
\[
\|f\|_{L^q} \le C (L^n(E))^{\frac{1}{p} - \frac{1}{q}} \|f\|_{L^p}, \quad \forall 1 \le p \le q \le \infty, \quad 1 \le p \le 2.
\]
-/

theorem ma_proofbench_l2_47
    {n : ℕ} :
    ∃ C : ℝ, 0 < C ∧
      ∀ (E : Set (EuclideanSpace ℝ (Fin n))),
        MeasurableSet E →
        (MeasureTheory.volume E) < ⊤ →
        ∀ p q : ENNReal,
          1 ≤ p → p ≤ q → q ≤ ⊤ → p ≤ 2 →
            ∀ f : SchwartzMap (EuclideanSpace ℝ (Fin n)) ℂ,
              Function.support (fun ξ : EuclideanSpace ℝ (Fin n) => (𝓕 f) ξ) ⊆ E →
                ‖f.toLp q
                    (MeasureTheory.volume : MeasureTheory.Measure (EuclideanSpace ℝ (Fin n)))‖ ≤
                  C *
                    Real.rpow (MeasureTheory.volume E).toReal
                      (1 / p.toReal -  (1 / q).toReal) *
                    ‖f.toLp p (MeasureTheory.volume : MeasureTheory.Measure (EuclideanSpace ℝ (Fin n)))‖ := by
  sorry
