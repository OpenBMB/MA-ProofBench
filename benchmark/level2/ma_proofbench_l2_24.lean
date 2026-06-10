import Mathlib

/--
Fix $1 \le p < q < \infty$.
Suppose $f \in L^p(\mathbb{R})$ and $\int_A |f|^q < \infty$ for any measurable $A$ with $|A| < \infty$. Show that $f \in L^q(\mathbb{R})$.
-/

theorem ma_proofbench_l2_24
    {p q : ENNReal}
    (hp : 1 ≤ p) (hpq : p < q) (hq : q < ⊤)
    (f : ℝ → ℝ)
    (hfLp : MeasureTheory.MemLp f p MeasureTheory.volume)
    (hA : ∀ A : Set ℝ, MeasurableSet A → MeasureTheory.volume A < ⊤ →
      (∫⁻ x in A, (ENNReal.ofReal |f x|) ^ q.toReal ∂MeasureTheory.volume) < ⊤) :
    MeasureTheory.MemLp f q MeasureTheory.volume := by
  sorry
