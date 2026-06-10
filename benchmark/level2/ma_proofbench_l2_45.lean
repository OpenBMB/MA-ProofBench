import Mathlib

open Filter MeasureTheory

/--
Let $\{f_n\}_{n=1}^\infty$ be a sequence of functions in $L^p(\mathbb{R})$ with $p\ge1$ finite.
Suppose $\sup_n \|f_n\|_{L^p(\mathbb{R})} < \infty$ and $f_n \to f$ almost everywhere. Show that $\|f\|_{L^p(\mathbb{R})} < \infty$.
-/

theorem ma_proofbench_l2_45
    {p : ENNReal} (hp1 : 1 ≤ p) (hpfin : p ≠ ⊤)
    (u : ℕ → ℝ → ℝ) (f : ℝ → ℝ)
    (hLp : ∀ n : ℕ, MemLp (u n) p)
    (hbound : ∃ C : ENNReal, C ≠ ⊤ ∧ ∀ n : ℕ, eLpNorm (u n) p volume ≤ C)
    (hae : ∀ᵐ x ∂volume, Tendsto (fun n : ℕ => u n x) atTop (nhds (f x))) :
    MemLp f p := by
  sorry
