import Mathlib

open MeasureTheory

/--
Prove that if $f$ is integrable on $\mathbb{R}^{d}$, real-valued, and $\int_{E} f(x)\,dx\ge 0$ for every measurable $E$, then $f(x)\ge 0$ a.e.\ $x$.
-/

theorem ma_proofbench_l1_71 (d : ℕ) (f : (EuclideanSpace ℝ (Fin d)) → ℝ)
    (hf : Integrable f)
    (hE : ∀ E : Set (EuclideanSpace ℝ (Fin d)), MeasurableSet E → 0 ≤ ∫ x in E, f x) :
    (∀ᵐ x, 0 ≤ f x) := by
  sorry
