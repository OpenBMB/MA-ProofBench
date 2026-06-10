import Mathlib

/--
Suppose $f\in L^{1}(\mathbb{R})$ and $\lambda>0$. Show that $\lim_{n\to +\infty} n^{-\lambda}f(nx)=0$ for almost all $x\in\mathbb{R}$ (where $n\in\mathbb{N}$).
-/

theorem ma_proofbench_l2_37
  (f : ℝ → ℝ)
  (hf : MeasureTheory.MemLp f 1 MeasureTheory.volume)
  (lam : ℝ)
  (hlam : 0 < lam) :
  ∀ᵐ x ∂MeasureTheory.volume,
    Filter.Tendsto (fun n : ℕ => (n + 1 : ℝ) ^ (-lam) * f ((n + 1) * x))
      Filter.atTop (nhds 0) := by
  sorry
