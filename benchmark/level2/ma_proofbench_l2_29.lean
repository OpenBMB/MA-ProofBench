import Mathlib

open MeasureTheory

/--
Consider the following operator
\[
Tf(x)=\int_{0}^{\infty}\frac{f(y)}{x+y}\,dy,
\]

Show that for $p\in(1,\infty)$, and any $f\in C_{c}([0,\infty))$,
\[
\|Tf\|_{L^{p}([0,\infty))}\le C_{p}\|f\|_{L^{p}([0,\infty))},
\]
where
\[
C_{p}:=\int_{0}^{\infty}\frac{dx}{x^{1/p}(1+x)}.
\]
-/

theorem ma_proofbench_l2_29 (p : ℝ) (hp : 1 < p) (T : (ℝ → ℝ) → (ℝ → ℝ))
  (hT : ∀ g : ℝ → ℝ, ∀ x : ℝ, T g x = ∫ y in Set.Ici (0 : ℝ), g y / (x + y))
  (f : ℝ → ℝ) (hf_cont : ContinuousOn f (Set.Ici (0 : ℝ)))
  (hf_cpt : HasCompactSupport f)
  (hf_support : Function.support f ⊆ Set.Ici (0 : ℝ))
  (Cp : ℝ) (hCp : Cp = ∫ x in Set.Ici (0 : ℝ), 1 / (x ^ (1 / p) * (1 + x))) :
  eLpNorm (T f) (ENNReal.ofReal p) (volume.restrict (Set.Ici (0 : ℝ))) ≤
    ENNReal.ofReal Cp * eLpNorm f (ENNReal.ofReal p) (volume.restrict (Set.Ici (0 : ℝ))) := by
  sorry
