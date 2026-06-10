import Mathlib

open scoped Topology

/--
Let $f_n : [0,1] \to [0,1]$ be a sequence of Lebesgue measurable functions such that $\lim_{n \to \infty} f_n(x) = 0$ almost everywhere. Let
\[
Mf_n(x) = \sup_{x \in I \subset [0,1]} \frac{1}{|I|} \int_I |f(y)|\,dy,
\]
where the maximum is taken over closed intervals, be the Hardy--Littlewood maximal function. Show that $\lim_{n \to \infty} Mf_n = 0$ a.e.
-/

theorem ma_proofbench_l2_74
    (f : ℕ → ℝ → ℝ)
    (hf_meas : ∀ n, AEMeasurable (f n) (MeasureTheory.volume.restrict (Set.Icc (0 : ℝ) 1)))
    (hf_range : ∀ n x, x ∈ Set.Icc (0 : ℝ) 1 → f n x ∈ Set.Icc (0 : ℝ) 1)
    (h_lim : ∀ᵐ x ∂(MeasureTheory.volume.restrict (Set.Icc (0 : ℝ) 1)),
        Filter.Tendsto (fun n => f n x) Filter.atTop (𝓝 (0 : ℝ)))
    (Mf : ℕ → ℝ → ℝ)
    (hMf : ∀ n x, Mf n x = sSup {r : ℝ | ∃ a b : ℝ, x ∈ Set.Icc a b ∧
      Set.Icc a b ⊆ Set.Icc (0 : ℝ) 1 ∧ 0 < b - a ∧
        r = (b - a)⁻¹ * ∫ y in Set.Icc a b, |f n y| ∂MeasureTheory.volume}) :
    ∀ᵐ x ∂(MeasureTheory.volume.restrict (Set.Icc (0 : ℝ) 1)),
      Filter.Tendsto (fun n => Mf n x) Filter.atTop (𝓝 (0 : ℝ)) := by
  sorry
