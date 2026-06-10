import Mathlib

/--
Let $p\in[1,\infty)$ and $\{f_n\}_{n=1}^\infty$ a sequence of functions in $L^p(\mathbb{R})$ such that $f_n\to f$ a.e. and $f\in L^p(\mathbb{R})$.

If $p\in(1,\infty)$, prove that if $\sup_n \|f_n\|_{L^p}<\infty$, then $f_n$ converges to $f$ weakly, i.e. for any $g\in L^q(\mathbb{R})$ with $q=\dfrac{p}{p-1}$,
\[
\lim_{n\to\infty}\int_{\mathbb{R}} f_n g\,dx=\int_{\mathbb{R}} f g\,dx.
\]
-/

theorem ma_proofbench_l2_82
  (p q : ENNReal)
  (hp : 1 < p)
  (hp_top : p < ⊤)
  (hq : 1 / p + 1 / q = 1)
  (f : ℝ → ℝ)
  (fn : ℕ → ℝ → ℝ)
  (hfnLp : ∀ n : ℕ, MeasureTheory.MemLp (fn n) p MeasureTheory.volume)
  (hfLp : MeasureTheory.MemLp f p MeasureTheory.volume)
  (hae : ∀ᵐ x ∂MeasureTheory.volume, Filter.Tendsto (fun n : ℕ => fn n x) Filter.atTop (nhds (f x)))
  (hbound : ∃ M : ENNReal, M < ⊤ ∧ ∀ n : ℕ, MeasureTheory.eLpNorm (fn n) p MeasureTheory.volume ≤ M)
  (g : ℝ → ℝ)
  (hg : MeasureTheory.MemLp g q MeasureTheory.volume) :
  Filter.Tendsto
    (fun n : ℕ => ∫ x : ℝ, fn n x * g x)
    Filter.atTop
    (nhds (∫ x : ℝ, f x * g x)) := by
  sorry
