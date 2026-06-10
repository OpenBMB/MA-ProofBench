import Mathlib

/--
Denote by $\mathcal{S}(\mathbb{R})$ the Schwartz space on $\mathbb{R}$ consisting of all complex-valued $C^\infty$ functions $f(x)$ on $\mathbb{R}$ such that
\[
\sup_{x\in\mathbb{R}} |x|^k \left|\frac{d^\ell f}{dx^\ell}(x)\right| < \infty
\quad\text{for all } k,\ell\in\mathbb{N}\cup\{0\}.
\]
Suppose $\psi(x)\in\mathcal{S}(\mathbb{R})$ satisfies
\[
\int_{-\infty}^{\infty}|\psi(x)|^2\,dx=1.
\]
Denote by $\hat{\psi}(\xi)$ the Fourier transform of $\psi(x)$ defined by
\[
\hat{\psi}(\xi)=\int_{-\infty}^{\infty}\psi(x)e^{-2\pi i x\xi}\,dx.
\]
Prove the Fourier-transform version of the Heisenberg uncertainty principle
\[
\left(\int_{-\infty}^{\infty} x^2|\psi(x)|^2\,dx\right)
\left(\int_{-\infty}^{\infty} \xi^2|\hat{\psi}(\xi)|^2\,d\xi\right)
\ge \frac{1}{16\pi^2}.
\]
-/

noncomputable def schwartzFourierHat (ψ : SchwartzMap ℝ ℂ) (ξ : ℝ) : ℂ :=
  ∫ x : ℝ, (ψ x) * Complex.exp (-(2 * Real.pi) * Complex.I * (x * ξ))

theorem ma_proofbench_l2_57 (ψ : SchwartzMap ℝ ℂ)
    (hL2 : (∫ x : ℝ, ‖ψ x‖ ^ 2) = 1) :
    ( (∫ x : ℝ, (x ^ 2) * (‖ψ x‖ ^ 2)) *
        (∫ ξ : ℝ, (ξ ^ 2) * (‖(schwartzFourierHat ψ) ξ‖ ^ 2)) )
      ≥ 1 / (16 * Real.pi ^ 2) := by
  sorry
