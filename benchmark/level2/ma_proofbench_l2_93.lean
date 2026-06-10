import Mathlib

open MeasureTheory

/--
Let $p,q,r\in[1,\infty]$ satisfy $\frac{1}{p}+\frac{1}{q}=\frac{1}{r}+1$. Let $f\in L^p(\mathbb{R})$ and $g\in L^q(\mathbb{R})$. Define the convolution
\[
(f*g)(x)=\int_{\mathbb{R}} f(y)g(x-y)\,dy.
\]
Prove that
\[
\|f*g\|_{L^r(\mathbb{R})} \le \|f\|_{L^p(\mathbb{R})}\|g\|_{L^q(\mathbb{R})}.
\]
-/

theorem ma_proofbench_l2_93
    (p q r : ENNReal)
    (hp : 1 ≤ p) (hq : 1 ≤ q) (hr : 1 ≤ r)
    (hrelation : 1 / p + 1 / q = 1 / r + 1)
    (f g : ℝ → ℝ)
    (hf : MemLp f p volume)
    (hg : MemLp g q volume) :
    eLpNorm (fun x : ℝ => ∫ y, f y * g (x - y)) r volume ≤
      eLpNorm f p volume * eLpNorm g q volume := by
  sorry
