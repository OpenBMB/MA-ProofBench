import Mathlib

/--
Let $\mathbb{C}_{+}=\{z:\Im z>0\}$. Suppose $f:\mathbb{C}_{+}\to\mathbb{R}$ is harmonic, non-negative, and satisfies
\[
\int_{0}^{\infty}\lvert f(iy)\rvert\,dy<\infty.
\]
Show that $f$ is identically zero.
-/

theorem ma_proofbench_l2_20
  (f : ℂ → ℝ)
  (hharm : InnerProductSpace.HarmonicOnNhd f UpperHalfPlane.upperHalfPlaneSet)
  (hnonneg : ∀ z ∈ UpperHalfPlane.upperHalfPlaneSet, 0 ≤ f z)
  (hint :
    MeasureTheory.IntegrableOn
      (fun y : ℝ => |f (Complex.I * (y : ℂ))|)
      (Set.Ioi (0 : ℝ))) :
  ∀ z ∈ UpperHalfPlane.upperHalfPlaneSet, f z = 0 := by
  sorry
