import Mathlib

open MeasureTheory ENNReal Filter Topology

/--
Assume $|\Omega|<\infty$. Let $f\in L^{\infty}(\Omega)$. Prove that $\lim_{p\to\infty}\|f\|_{p}=\|f\|_{\infty}$.
-/

theorem ma_proofbench_l1_42 {α : Type*} [MeasurableSpace α] {μ : Measure α}
    (hmu : μ Set.univ < ∞) {f : α → ℝ} (hf : MemLp f ∞ μ) :
    Tendsto (fun p : NNReal => eLpNorm f p μ) atTop
      (𝓝 (eLpNorm f ∞ μ)) := by
  sorry
