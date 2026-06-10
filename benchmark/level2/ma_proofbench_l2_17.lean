import Mathlib

open MeasureTheory Filter

/--
Let $f, g \in L^2(\mathbb{R}^n)$. Show that $f \ast g \in C(\mathbb{R}^n)$ and $\lim_{|x|\to\infty}(f \ast g)(x) = 0$.
-/

theorem ma_proofbench_l2_17 (n : ℕ) (f g : (Fin n → ℝ) → ℂ)
    (hf : MemLp f 2 volume) (hg : MemLp g 2 volume) :
    Continuous (fun x : Fin n → ℝ => ∫ y, f (x - y) * g y) ∧
    Filter.Tendsto (fun x : Fin n → ℝ => ∫ y, f (x - y) * g y)
      (Filter.cocompact (Fin n → ℝ)) (nhds 0) := by
  sorry
