import Mathlib

open Filter MeasureTheory

/--
Let $p$ be a real number such that $1\le p\le +\infty$.

Let $A\subset L^{p}(\mathbb{R})$ denote those functions for which
\[
\lim_{L\to +\infty}\int_{0}^{L} f(x)\,dx=0.
\]
Show that $A$ is a Borel subset of $L^{p}(\mathbb{R})$.
-/

def vanishingIntegralSet (p : ENNReal) : Set (Lp ℝ p (volume : Measure ℝ)) :=
  {f |
    Tendsto
      (fun L : ℝ => ∫ x in Set.Icc (0 : ℝ) L, f x ∂(volume : Measure ℝ))
      atTop (nhds 0)}

theorem ma_proofbench_l2_25
  (p : ENNReal)
  [Fact ((1 : ENNReal) ≤ p)] :
  @MeasurableSet (Lp ℝ p (volume : Measure ℝ))
    (borel (Lp ℝ p (volume : Measure ℝ)))
    (vanishingIntegralSet p) := by
  sorry
