import Mathlib

open Filter MeasureTheory

/--
Let $\{f_n\}_{n=1}^\infty\subset L^2([0,1])$. Suppose $\|f_n\|_{L^2}\le 2024\|f_n\|_{L^1}$ for all $n\in\mathbb{Z}_{>0}$.
If $\lim_{n\to\infty}\|f_n\|_{L^1}=\infty$, prove that there exists a sequence $y_n\to\infty$ such that
\[
\inf_n |\{x: |f_n(x)|\ge y_n\}|>0.
\]
-/

noncomputable abbrev μIcc01 : Measure ℝ :=
  volume.restrict (Set.Icc (0 : ℝ) 1)

theorem ma_proofbench_l2_04
    (f : ℕ → ℝ → ℝ)
    (hf_L2 : ∀ n : ℕ, MemLp (f n) 2 μIcc01)
    (hbound : ∀ n : ℕ,
      eLpNorm (f n) 2 μIcc01 ≤
        ENNReal.ofReal 2024 * eLpNorm (f n) 1 μIcc01)
    (hL1_div : Tendsto (fun n : ℕ => eLpNorm (f n) 1 μIcc01) atTop atTop) :
    ∃ y : ℕ → ℝ,
      Tendsto y atTop atTop ∧
      0 < sInf (Set.range (fun n : ℕ =>
        μIcc01 {x : ℝ | |f n x| ≥ y n})) := by
  sorry
