import Mathlib

open scoped Topology

/--
Let $L^0([0,1])$ be the vector space of Lebesgue measurable functions. Let $d$ be the metric on $L^0([0,1])$ given by
\[
d(f,g) = \int_0^1 \frac{|f-g|(x)}{1 + |f-g|(x)}\,dx.
\]
Prove that $f_n \to f$ in the metric $d$ if and only if $f_n \to f$ in measure.
-/

abbrev L0UnitInterval : Type := {f : ℝ → ℝ // Measurable f}

noncomputable def L0Metric (f g : L0UnitInterval) : ℝ :=
  ∫ x, |f.1 x - g.1 x| / (1 + |f.1 x - g.1 x|)
    ∂(MeasureTheory.volume.restrict (Set.Icc (0 : ℝ) 1))

theorem ma_proofbench_l2_07
    (fSeq : ℕ → L0UnitInterval) (f : L0UnitInterval) :
    Filter.Tendsto (fun n => L0Metric (fSeq n) f) Filter.atTop (𝓝 (0 : ℝ)) ↔
      MeasureTheory.TendstoInMeasure
        (MeasureTheory.volume.restrict (Set.Icc (0 : ℝ) 1))
        (fun n x => (fSeq n).1 x) Filter.atTop (fun x => f.1 x) := by
  sorry
