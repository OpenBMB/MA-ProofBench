import Mathlib

open MeasureTheory Convolution

/--
Suppose $1\le p\le\infty$, $f\in L^1(R^1)$, and $g\in L^p(R^1)$. Assume $\varepsilon>0$, show that there exist $f\in L^1(R^1)$ and $g\in L^p(R^1)$ such that

\[
\|f*g\|_p>(1-\varepsilon)\|f\|_1\|g\|_p.
\]
-/

theorem ma_proofbench_l1_45 (p : ENNReal) (hp : 1 ≤ p) (ε : ℝ) (hε : 0 < ε) :
    ∃ (f g : ℝ → ℝ), MemLp f 1 ∧ MemLp g p ∧
      (eLpNorm (f ⋆ g) p).toReal > ((1 - ε) * (eLpNorm f 1).toReal * (eLpNorm g p).toReal) := by
  sorry
