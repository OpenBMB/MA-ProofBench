import Mathlib

open MeasureTheory

/--
Let $\theta:\mathbb{R}\to\mathbb{R}^{+}$ be a $C^{1}$
function such that $\|\theta'/\theta\|_{L^{\infty}(\mathbb{R})}\le 1$. Show that for all
$u\in C^{\infty}_{c}(\mathbb{R})$, there exists some absolute constant $C$ s.t.,
\[
\int_{\mathbb{R}} u^{6}\theta \le C\|u\|^{4}_{L^{2}(\mathbb{R})}\int_{\mathbb{R}} \left(|u'|^{2}+|u|^{2}\right)\theta.
\]
-/

theorem ma_proofbench_l2_67
  (θ : ℝ → ℝ) (hθ_pos : ∀ x : ℝ, 0 < θ x)
  (hθ_C1 : ContDiff ℝ 1 θ)
  (hθ_Linf : eLpNorm (fun x : ℝ => deriv θ x / θ x) ⊤ volume ≤ 1) :
  ∃ C : ℝ, 0 < C ∧ ∀ u : ℝ → ℝ, ContDiff ℝ (⊤ : ℕ∞) u → HasCompactSupport u →
    ∫ x : ℝ, (u x) ^ (6 : ℕ) * θ x ≤
      C * (ENNReal.toReal (eLpNorm u 2 volume)) ^ (4 : ℕ) *
        ∫ x : ℝ, (|deriv u x| ^ (2 : ℕ) + |u x| ^ (2 : ℕ)) * θ x := by
  sorry
