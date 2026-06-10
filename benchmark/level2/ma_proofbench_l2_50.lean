import Mathlib

open Filter MeasureTheory

/--
Let $\Omega$ be an open subset of $\mathbb{R}^d$ and $a<b$ be real numbers. For any positive integer $n$ let $f_n(x,y)$ be a complex-valued measurable function on $\Omega\times(a,b)$. Let $a<c<b$. Assume that for each positive integer $n$ the following three conditions are satisfied.
\begin{enumerate}
\item For each $n$ and for almost all $x\in\Omega$ the function $f_n(x,y)$ as a function of $y$ is absolutely continuous in $y$ for $y\in(a,b)$.
\item The function $\partial f_n/\partial y$ is measurable on $\Omega\times(a,b)$ for each $n$ and the function
\[
\sum_{n=1}^\infty \left|\frac{\partial f_n}{\partial y}(x,y)\right|
\]
is integrable on $\Omega\times(a,b)$.
\item The function $\sum_{n=1}^\infty |f_n(x,c)|$ is integrable on $\Omega$.
\end{enumerate}
Prove that the function
\[
y\mapsto \int_{x\in\Omega}\sum_{n=1}^\infty f_n(x,y)\,dx
\]
is a well-defined function for almost all $y\in(a,b)$ and that
\[
\frac{d}{dy}\int_{x\in\Omega}\sum_{n=1}^\infty f_n(x,y)\,dx
=
\sum_{n=1}^\infty \int_{x\in\Omega} \frac{\partial f_n}{\partial y}(x,y)\,dx
\]
for almost all $y\in(a,b)$.
-/

theorem ma_proofbench_l2_50
    {d : ℕ} (Ω : Set (Fin d → ℝ)) (hΩ : IsOpen Ω)
    (a b c : ℝ) (hab : a < b) (hac : a < c) (hcb : c < b)
    (f : ℕ → (Fin d → ℝ) → ℝ → ℂ)
    (h_ac : ∀ n : ℕ, ∀ᵐ x ∂(volume.restrict Ω),
      AbsolutelyContinuousOnInterval (fun y => f n x y) a b)
    (h_deriv_meas : ∀ n : ℕ,
      AEStronglyMeasurable (fun p : (Fin d → ℝ) × ℝ =>
        deriv (fun y => f n p.1 y) p.2)
        ((volume.restrict Ω).prod (volume.restrict (Set.Ioo a b))))
    (h_deriv_sum_finite_ae :
      ∀ᵐ p ∂((volume.restrict Ω).prod (volume.restrict (Set.Ioo a b))),
        Summable (fun n : ℕ => ‖deriv (fun y => f n p.1 y) p.2‖))
    (h_deriv_int :
      Integrable (fun p : (Fin d → ℝ) × ℝ =>
        ∑' n : ℕ, ‖deriv (fun y => f n p.1 y) p.2‖)
        ((volume.restrict Ω).prod (volume.restrict (Set.Ioo a b))))
    (h_at_c_sum_finite_ae :
      ∀ᵐ x ∂(volume.restrict Ω), Summable (fun n : ℕ => ‖f n x c‖))
    (h_at_c :
      Integrable (fun x : Fin d → ℝ => ∑' n : ℕ, ‖f n x c‖) (volume.restrict Ω)) :
    ∃ F : ℝ → ℂ,
      (∀ᵐ y ∂(volume.restrict (Set.Ioo a b)),
        Integrable (fun x : Fin d → ℝ => ∑' n : ℕ, f n x y) (volume.restrict Ω)) ∧
      (∀ᵐ y ∂(volume.restrict (Set.Ioo a b)),
        F y = ∫ x, ∑' n : ℕ, f n x y ∂(volume.restrict Ω)) ∧
      (∀ᵐ y ∂(volume.restrict (Set.Ioo a b)),
        HasDerivAt F (∑' n : ℕ, ∫ x, deriv (fun t => f n x t) y ∂(volume.restrict Ω)) y) := by
  sorry
