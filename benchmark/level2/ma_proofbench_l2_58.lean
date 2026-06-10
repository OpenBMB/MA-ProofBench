import Mathlib

open MeasureTheory

/--
Let $H$ be a separable Hilbert space and $\{e_j\}_{j=1}^\infty$ be an orthonormal basis. A bounded operator $A$ on $H$ is called Hilbert--Schmidt if
\[
\sum_{j=1}^\infty \|A e_j\|^2 < \infty.
\]
If $H = L^2([0, 1]; dx)$, prove that the Volterra operator
\[
V u(x) = \int_0^x u(y) \, dy, \quad x \in [0, 1],
\]
is Hilbert--Schmidt.
-/

noncomputable section

def IsHilbertSchmidtOperator
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (A : H →L[ℂ] H) : Prop :=
  ∃ e : ℕ → H, Orthonormal ℂ e ∧ Summable (fun j : ℕ => ‖A (e j)‖ ^ 2)

abbrev μ_Icc01 : Measure ℝ :=
  Measure.restrict volume (Set.Icc (0 : ℝ) 1)

abbrev L2_Icc01 : Type :=
  MeasureTheory.Lp ℂ (2 : ENNReal) μ_Icc01

theorem ma_proofbench_l2_58
    (V : L2_Icc01 →L[ℂ] L2_Icc01)
    (hV : ∀ u : L2_Icc01,
      ∀ᵐ x ∂μ_Icc01, V u x = ∫ y in Set.Icc (0 : ℝ) x, u y) :
    IsHilbertSchmidtOperator V := by
  sorry
