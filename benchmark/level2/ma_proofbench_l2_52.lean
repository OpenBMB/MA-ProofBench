import Mathlib

open MeasureTheory

/--
Let $\{f_n\}_{n=1}^\infty$ be a sequence of measurable functions on $[0,1]$ such that
\[
M := \sup_{n\ge1}\sup_{p\ge1}\|f_n\|_{L^p[0,1]} < \infty.
\]
Prove that $\sup_{n\ge1}\|f_n\|_{L^\infty[0,1]}\le M$.
-/

theorem ma_proofbench_l2_52
    (f : ℕ → ℝ → ℝ) (M : ℝ)
    (hf : ∀ n : ℕ, AEStronglyMeasurable (f n) (volume.restrict (Set.Icc (0 : ℝ) 1)))
    (hM : ∀ n : ℕ, ∀ p : ℝ, 1 ≤ p →
      eLpNorm (f n) (ENNReal.ofReal p) (volume.restrict (Set.Icc (0 : ℝ) 1)) ≤ ENNReal.ofReal M) :
    ∀ n : ℕ, eLpNorm (f n) ⊤ (volume.restrict (Set.Icc (0 : ℝ) 1)) ≤ ENNReal.ofReal M := by
  sorry
