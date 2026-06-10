import Mathlib

/--
Prove the following: Let $B$ be a ball in $\mathbb{R}^d$ of radius $r$. Then $m(B)=v_d r^d$, where $v_d=m(B_1)$, and $B_1$ is the unit ball, $B_1=\{x\in\mathbb{R}^d:|x|<1\}$.
-/

theorem ma_proofbench_l1_39 (d : ℕ) (dpos : 0 < d) (c : EuclideanSpace ℝ (Fin d)) (r : ℝ) (hr : 0 < r) :
    MeasureTheory.volume (Metric.ball c r) = MeasureTheory.volume (Metric.ball (0 : EuclideanSpace ℝ (Fin d)) 1) *
       ENNReal.ofReal (r ^ d) := by
  sorry
