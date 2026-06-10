import Mathlib

/--
Show that for any $f\in L^{2}(\mathbb{R})$,
\[
\lim_{n\to\infty} n\iint f(x)f(y)e^{-2n\lvert x-y\rvert}\,dx\,dy=\int_{\mathbb{R}} f(x)^{2}\,dx.
\]
-/

theorem ma_proofbench_l2_96
  (f : ℝ → ℝ)
  (hf : MeasureTheory.MemLp f 2 MeasureTheory.volume) :
  Filter.Tendsto
    (fun n : ℕ =>
      (n : ℝ) * (∫ x : ℝ, ∫ y : ℝ, f x * f y * Real.exp (-2 * (n : ℝ) * |x - y|)))
    Filter.atTop
    (nhds (∫ x : ℝ, f x ^ (2 : ℕ))) := by
  sorry
