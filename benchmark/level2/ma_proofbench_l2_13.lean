import Mathlib

/--
Let $\mu$ be a finite Borel measure on the unit circle $T = \{z \in \mathbb{C} : |z| = 1\}$ such that $\lim_{n\to\infty} \int_T z^n d\mu(z) = 0$. Prove that for any $f : T \to \mathbb{C}$, $f \in L^1(T, \mu)$, we have
\[
\lim_{n\to\infty} \int_T z^n f(z) d\mu(z) = 0.
\]
-/

theorem ma_proofbench_l2_13
    (μ : MeasureTheory.Measure ℂ)
    (hfinite : μ Set.univ < ⊤)
    (hsphere : ∀ᵐ z ∂μ, z ∈ Metric.sphere (0 : ℂ) 1)
    (hpow : Filter.Tendsto (fun n : ℕ => ∫ z, z ^ n ∂μ) Filter.atTop (nhds 0))
    (f : ℂ → ℂ)
    (hf : MeasureTheory.Integrable f μ) :
    Filter.Tendsto (fun n : ℕ => ∫ z, z ^ n * f z ∂μ) Filter.atTop (nhds 0) := by
  sorry
