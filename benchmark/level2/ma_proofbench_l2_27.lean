import Mathlib

open MeasureTheory
open scoped FourierTransform

/--
For all $u_0\in C_c^\infty(\mathbb{R})$, we define $u(t,x)\in C^\infty(\mathbb{R}^2)$ as follows
\[
u(t,x)=\frac{1}{\sqrt{2\pi}}\int_{\mathbb{R}} e^{i(t\xi^3+x\xi)}\widehat{u_0}(\xi)\,d\xi.
\]
Show that for all $x_0\in\mathbb{R}$, the function $t\mapsto \partial_x u(t,x_0)$ belongs to $L^2(\mathbb{R})$ and there exists a constant $c_0>0$ independent of $x_0$ and $u$, such that
\[
\int_{\mathbb{R}} |\partial_x u(t,x_0)|^2\,dt = c_0 \int_{\mathbb{R}} |u_0(x)|^2\,dx.
\]
-/

noncomputable def AirySolution (u0 : ℝ → ℂ) (t x : ℝ) : ℂ :=
  (Real.sqrt (2 * Real.pi))⁻¹ *
    ∫ ξ : ℝ,
      Complex.exp (Complex.I * (t * ξ ^ (3 : ℕ) + x * ξ)) * (𝓕 u0) ξ

theorem ma_proofbench_l2_27
  (u0 : ℝ → ℂ)
  (hu0_smooth : ContDiff ℝ (⊤ : ℕ∞) u0)
  (hu0_compact : HasCompactSupport u0) :
  (∀ x0 : ℝ,
      MemLp (fun t : ℝ => deriv (fun x : ℝ => AirySolution u0 t x) x0) (2 : ENNReal) volume) ∧
    ∃ c0 : ℝ, 0 < c0 ∧
      ∀ x0 : ℝ,
        ∫ t : ℝ, ‖deriv (fun x : ℝ => AirySolution u0 t x) x0‖ ^ (2 : ℕ) =
          c0 * ∫ x : ℝ, ‖u0 x‖ ^ (2 : ℕ) := by
  sorry
