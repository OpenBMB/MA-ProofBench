import Mathlib

/--
Given a sequence of functions $f_n\in L^1(\mathbb{R})$ such that $f_n$ converges to $f\in L^1(\mathbb{R})$ almost everywhere.

If in addition $\|f_n\|_{L^1}$ converges to $\|f\|_{L^1}$, then $f_n$ converges to $f$ in $L^1$ norm.
-/

theorem ma_proofbench_l2_76
  (f : ℝ → ℝ)
  (fn : ℕ → ℝ → ℝ)
  (hf : MeasureTheory.Integrable f)
  (hfn : ∀ n : ℕ, MeasureTheory.Integrable (fn n))
  (hae : ∀ᵐ x ∂MeasureTheory.volume, Filter.Tendsto (fun n : ℕ => fn n x) Filter.atTop (nhds (f x)))
  (hnorm : Filter.Tendsto
      (fun n : ℕ => ∫ x : ℝ, |fn n x|)
      Filter.atTop
      (nhds (∫ x : ℝ, |f x|))) :
  Filter.Tendsto
    (fun n : ℕ => ∫ x : ℝ, |fn n x - f x|)
    Filter.atTop
    (nhds 0) := by
  sorry
