import Mathlib

open scoped FourierTransform

/--
Fix $s\in \left(\tfrac12,1\right]$. For a Schwartz function $f:\mathbb{R}\to\mathbb{C}$, define
\[
\|f\|_{\dot H^{s}(\mathbb{R})} = \left( \int_{\mathbb{R}} |\xi|^{2s} |\widehat{f}|^{2}(\xi)\, d\xi \right)^{1/2}.
\]
Prove that there exists $C_1>0$ such that whenever $f\in \mathcal{S}(\mathbb{R})$ and $\operatorname{supp}(\widehat f)\subset [-A,A]$, then
 \[
 \|f'\|_{L^\infty(\mathbb{R})} \le C_1 A^{\frac32 - s}\, \|f\|_{\dot H^{s}(\mathbb{R})}.
 \]
-/

noncomputable def dotHSeminorm (s : ℝ) (f : SchwartzMap ℝ ℂ) : ℝ :=
  Real.sqrt (∫ ξ : ℝ, Real.rpow ‖ξ‖ (2 * s) * ‖(𝓕 f) ξ‖ ^ 2)

theorem ma_proofbench_l2_00
    (s : ℝ) (hs : s ∈ Set.Ioc (1 / 2 : ℝ) 1) :
    ∃ C1 > 0, ∀ (A : NNReal),
      ∀ f : SchwartzMap ℝ ℂ,
        Function.support (fun ξ : ℝ => (𝓕 f) ξ) ⊆ Set.Icc (-(A : ℝ)) (A : ℝ) →
          sSup (Set.range (fun x : ℝ => ‖deriv (fun y : ℝ => f y) x‖)) ≤
            C1 * Real.rpow (A : ℝ) (3 / 2 - s) *
              dotHSeminorm s f := by
  sorry
