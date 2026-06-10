import Mathlib

open MeasureTheory

/--
Let $L^2([1,2])$ be the Hilbert space of real-valued functions with inner product $\langle f, g\rangle = \int_1^2 f(x)g(x)\,dx$.
Consider the linear map $T : L^2([1,2]) \to L^2([1,2])$ given by $Tf(x)=xf(x)$ for $x\in[1,2]$. Show that this map is continuous and invertible, and show that $T=T^*$.
-/

noncomputable abbrev L2OnOneTwo : Type :=
  (ℝ →₂[volume.restrict (Set.Icc (1 : ℝ) 2)] ℝ)

theorem ma_proofbench_l2_26
    (T : L2OnOneTwo →ₗ[ℝ] L2OnOneTwo)
    (hT : ∀ f : L2OnOneTwo,
      T f =ᵐ[volume.restrict (Set.Icc (1 : ℝ) 2)] fun x : ℝ => x * f x) :
    Continuous T ∧ Function.Bijective T ∧
      ∃ Tc : L2OnOneTwo →L[ℝ] L2OnOneTwo,
        Tc.toLinearMap = T ∧ Tc.adjoint = Tc := by
  sorry
