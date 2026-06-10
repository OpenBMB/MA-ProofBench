import Mathlib

/--
Suppose $f$ is integrable on $(-\pi,\pi]$ and extended to $\mathbb{R}$ by making it periodic of period $2\pi$. Show that

\[
\int_{-\pi}^{\pi} f(x)\,dx=\int_{I} f(x)\,dx,
\]
where $I$ is any interval in $\mathbb{R}$ of length $2\pi$.
-/

theorem ma_proofbench_l1_08 (f : ℝ → ℝ) (hf_int : MeasureTheory.IntegrableOn f (Set.Ioc (-Real.pi) Real.pi))
    (hf_per : Function.Periodic f (2 * Real.pi)) : ∀ a : ℝ, 
    (∫ x in (-Real.pi)..Real.pi, f x) = (∫ x in a..(a + 2 * Real.pi), f x) := by
  sorry
