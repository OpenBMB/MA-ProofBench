import Mathlib

/--
For $\varepsilon > 0$, define $u_{\pm,\varepsilon} : S(\mathbb{R}) \to \mathbb{C}$ by $u_{\pm,\varepsilon}(\phi) = \int_{\mathbb{R}} (x \pm i\varepsilon)^{-1}\phi(x)\, dx$, $\phi \in S(\mathbb{R})$.

Show that for all $\varepsilon > 0$, $u_{\pm,\varepsilon} \in S'(\mathbb{R})$, and that there exist $u_\pm \in S'(\mathbb{R})$ such that for all $\phi \in S(\mathbb{R})$, $u_{\pm,\varepsilon}(\phi) \to u_\pm(\phi)$ as $\varepsilon \to 0$.
-/

noncomputable section

open MeasureTheory

def uPlusEps (ε : ℝ) (φ : SchwartzMap ℝ ℂ) : ℂ :=
  ∫ x : ℝ, (((x : ℂ) + (ε : ℂ) * Complex.I)⁻¹) * φ x

def uMinusEps (ε : ℝ) (φ : SchwartzMap ℝ ℂ) : ℂ :=
  ∫ x : ℝ, (((x : ℂ) - (ε : ℂ) * Complex.I)⁻¹) * φ x

theorem ma_proofbench_l2_15 :
    (∀ ε > 0,
      ∃ uPlus_eps uMinus_eps : TemperedDistribution ℝ ℂ,
        (∀ φ : SchwartzMap ℝ ℂ, uPlus_eps φ = uPlusEps ε φ) ∧
          (∀ φ : SchwartzMap ℝ ℂ, uMinus_eps φ = uMinusEps ε φ)) ∧
    (∃ uPlus uMinus : TemperedDistribution ℝ ℂ,
      (∀ φ : SchwartzMap ℝ ℂ,
        Filter.Tendsto (fun ε : ℝ => uPlusEps ε φ)
          (nhdsWithin 0 (Set.Ioi (0 : ℝ))) (nhds (uPlus φ))) ∧
      (∀ φ : SchwartzMap ℝ ℂ,
        Filter.Tendsto (fun ε : ℝ => uMinusEps ε φ)
          (nhdsWithin 0 (Set.Ioi (0 : ℝ))) (nhds (uMinus φ)))) := by
  sorry
