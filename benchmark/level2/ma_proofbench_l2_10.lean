import Mathlib

open MeasureTheory Filter

/--
Let $p\in(1,+\infty)$. Suppose that $(f_n)_n \subset L^{p}(0,1)$ and $\|f_n\|_{L^{p}}\le 1$ for all $n$. Assuming that $f_n(x)\to 0$ a.e., prove that $(f_n)_n$ converges weakly to $0$ in $L^{p}(0,1)$.
-/

noncomputable abbrev μI01 : Measure ℝ := Measure.restrict volume (Set.Ioo (0 : ℝ) 1)

theorem ma_proofbench_l2_10
  (p q : ENNReal)
  (hp_ne_top : p ≠ ⊤)
  (hp_gt_one : 1 < p)
  (hq : 1 / p + 1 / q = 1)
  (f : ℕ → Lp ℝ p μI01)
  (h_bound : ∀ n, eLpNorm (f n) p μI01 ≤ 1)
  (h_ae : ∀ᵐ x ∂μI01, Tendsto (fun n => f n x) atTop (nhds 0)) :
  ∀ g : Lp ℝ q μI01, Tendsto (fun n => ∫ x, (f n x) * g x ∂μI01) atTop (nhds 0) := by
  sorry
