import Mathlib

/--
Suppose $f$ is integrable on $\mathbb{R}^{d}$. For each $\alpha>0$, let $E_{\alpha}=\{x:|f(x)|>\alpha\}$. Prove that

\[
\int_{\mathbb{R}^{d}} |f(x)|\,dx=\int_{0}^{\infty} m(E_{\alpha})\,d\alpha.
\]
-/

theorem ma_proofbench_l1_52 (d : ℕ) (f : (Fin d → ℝ) → ℝ) (hf : MeasureTheory.Integrable f MeasureTheory.volume) :
    (∫ x, |f x|) =
      ∫ α in Set.Ioi (0 : ℝ),
        (MeasureTheory.volume.real {x : Fin d → ℝ | |f x| > α}) := by
  sorry
