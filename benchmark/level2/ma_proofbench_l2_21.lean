import Mathlib

open scoped FourierTransform

/--
Fix $s\in \left(\tfrac12,1\right]$. For a Schwartz function $f:\mathbb{R}\to\mathbb{C}$, define
\[
\|f\|_{\dot H^{s}(\mathbb{R})} = \left( \int_{\mathbb{R}} |\xi|^{2s} |\widehat{f}|^{2}(\xi)\, d\xi \right)^{1/2}.
\]
Prove that there exists $C_3>0$ such that the following holds for all $f\in \mathcal{S}(\mathbb{R})$:
 \[
 \sup_{x\ne y} \frac{|f(x)-f(y)|}{|x-y|^{\,s-\frac12}} \le C_3 \|f\|_{\dot H^{s}(\mathbb{R})}.
 \]
-/

noncomputable def dotHSeminorm (s : ℝ) (f : SchwartzMap ℝ ℂ) : ℝ :=
  Real.sqrt (∫ ξ : ℝ, Real.rpow ‖ξ‖ (2 * s) * ‖(𝓕 f) ξ‖ ^ 2)

theorem ma_proofbench_l2_21
    (s : ℝ) (hs : s ∈ Set.Ioc (1 / 2 : ℝ) 1) :
    ∃ C3 > 0, ∀ f : SchwartzMap ℝ ℂ,
      sSup
          (Set.range
            (fun p : {xy : ℝ × ℝ // xy.1 ≠ xy.2} =>
              ‖f p.1.1 - f p.1.2‖ / Real.rpow ‖p.1.1 - p.1.2‖ (s - 1 / 2)))
        ≤ C3 * dotHSeminorm s f := by
  sorry
