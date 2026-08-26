import Mathlib

open scoped FourierTransform

noncomputable def dotHSeminorm (s : ℝ) (f : SchwartzMap ℝ ℂ) : ℝ :=
  Real.sqrt (∫ ξ : ℝ, Real.rpow ‖ξ‖ (2 * s) * ‖(𝓕 f) ξ‖ ^ 2)

/--
Fix $s\in \left(\tfrac12,1\right]$. For a Schwartz function $f:\mathbb{R}\to\mathbb{C}$, define
\[
\|f\|_{\dot H^{s}(\mathbb{R})} = \left( \int_{\mathbb{R}} |\xi|^{2s} |\widehat{f}|^{2}(\xi)\, d\xi \right)^{1/2}.
\]
Prove that there exists $C_2>0$ such that whenever $f\in \mathcal{S}(\mathbb{R})$ and $\operatorname{supp}(\widehat f)\subset \mathbb{R}\setminus [-A,A]$, then
 \[
 \|f\|_{L^\infty(\mathbb{R})} \le C_2 A^{-s+\frac12}\, \|f\|_{\dot H^{s}(\mathbb{R})}.
 \]
-/

theorem ma_proofbench_l2_05
    (s : ℝ) (hs : s ∈ Set.Ioc (1 / 2 : ℝ) 1) :
    ∃ C2 > 0, ∀ (A : NNReal),
      0 < (A : ℝ) →
      ∀ f : SchwartzMap ℝ ℂ,
        tsupport (fun ξ : ℝ => (𝓕 f) ξ) ⊆ (Set.Icc (-(A : ℝ)) (A : ℝ))ᶜ →
          sSup (Set.range (fun x : ℝ => ‖f x‖)) ≤
            C2 * Real.rpow (A : ℝ) (-s + 1 / 2) * dotHSeminorm s f := by
  sorry
