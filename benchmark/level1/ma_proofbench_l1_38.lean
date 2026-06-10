import Mathlib

open MeasureTheory

/--
Let $\Gamma\subset \mathbb{R}^{d}\times\mathbb{R}$, $\Gamma=\{(x,y)\in\mathbb{R}^{d}\times\mathbb{R}:y=f(x)\}$, and assume $f$ is measurable on $\mathbb{R}^{d}$. Show that $\Gamma$ is a measurable subset of $\mathbb{R}^{d+1}$, and $m(\Gamma)=0$.
-/

theorem ma_proofbench_l1_38 {d : ℕ} (f : (Fin d → ℝ) → ℝ) (Γ : Set (Fin (d + 1) → ℝ))
    (hΓ : Γ = {z : Fin (d + 1) → ℝ | z (Fin.last d) = f (fun i : Fin d => z (Fin.castSucc i))})
    (hf : Measurable f) : MeasurableSet Γ ∧ volume Γ = 0 := by
  sorry
