import Mathlib

/--
Let $f\in L^{1}(0,1)$ be such that $\int_{0}^{1} f(x)g^{(3)}(x)\,dx=0$ for all $g\in C_{c}^{\infty}(0,1)$, where $g^{(3)}$ is the third derivative of $g$. Show that $f$ is (almost everywhere) a polynomial of degree at most $2$.
-/

theorem ma_proofbench_l2_66
  (f : ℝ → ℝ)
  (hf : MeasureTheory.MemLp f 1 (MeasureTheory.Measure.restrict MeasureTheory.volume (Set.Icc 0 1)))
  (hweak : ∀ g : ℝ → ℝ, ContDiff ℝ (⊤ : ℕ∞) g →
    (∃ a b : ℝ, Function.support g ⊆ Set.Icc a b ∧
      Set.Icc a b ⊆ Set.Ioo (0 : ℝ) 1) →
      ∫ x in Set.Icc 0 1, f x * deriv (deriv (deriv g)) x = 0) :
  ∃ a b c : ℝ, ∀ᵐ x ∂(MeasureTheory.Measure.restrict MeasureTheory.volume (Set.Icc 0 1)), f x = a + b * x + c * x ^ 2 := by
  sorry
