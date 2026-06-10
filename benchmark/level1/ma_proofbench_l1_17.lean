import Mathlib

open MeasureTheory Filter Topology

/--
Suppose $f_n:X\to[0,\infty]$ is measurable for $n=1,2,3,\dots$, $f_1\ge f_2\ge f_3\ge\dots\ge 0$, $f_n(x)\to f(x)$ as $n\to\infty$, for every $x\in X$, and $f_1\in L^1(\mu)$. Prove that then

\[
\lim_{n\to\infty}\int_X f_n\,d\mu=\int_X f\,d\mu
\]
-/

theorem ma_proofbench_l1_17 {X : Type*} [MeasurableSpace X] (μ : Measure X)
    (fseq : ℕ → X → ENNReal) (f : X → ENNReal)
    (hmeas : ∀ n, Measurable (fseq n))
    (hmono : ∀ n x, fseq (n + 1) x ≤ fseq n x)
    (hlim : ∀ x, Tendsto (fun n => fseq n x) atTop (𝓝 (f x)))
    (hint : HasFiniteIntegral (fseq 0) μ) :
    Tendsto (fun n => ∫⁻ x, fseq n x ∂μ) atTop (𝓝 (∫⁻ x, f x ∂μ)) := by
  sorry
