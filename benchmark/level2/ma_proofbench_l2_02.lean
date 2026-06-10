import Mathlib

open MeasureTheory

/--
Let $f \in L^1([0, 1])$ and let $1 < p < \infty$. Prove that $f \in L^p([0, 1])$ if and only if
\[
\sup_{\{I_j\}} \sum_j |I_j| \left(\frac{1}{|I_j|}\int_{I_j} |f|\right)^p < \infty,
\]
where the supremum is taken over all finite partitions of $[0, 1]$ into intervals $\{I_j\}$.
-/

noncomputable section

def IsPartition01 {n : ℕ} (t : Fin (n + 1) → ℝ) : Prop :=
  t 0 = 0 ∧ t (Fin.last n) = 1 ∧ StrictMono t

def partitionAverageSum (f : ℝ → ℝ) (p : ℝ) {n : ℕ} (t : Fin (n + 1) → ℝ) : ℝ :=
  ∑ i : Fin n,
    let a := t i.castSucc
    let b := t i.succ
    (b - a) * Real.rpow ((1 / (b - a)) * ∫ x in Set.Icc a b, |f x|) p

theorem ma_proofbench_l2_02
    (f : ℝ → ℝ) (p : ℝ)
    (hp : 1 < p)
    (hf_L1 : MemLp f 1 (volume.restrict (Set.Icc (0 : ℝ) 1))) :
    MemLp f (ENNReal.ofReal p) (volume.restrict (Set.Icc (0 : ℝ) 1)) ↔
      ∃ C : ℝ, ∀ n : ℕ, ∀ t : Fin (n + 1) → ℝ,
        IsPartition01 t →
          partitionAverageSum f p t ≤ C := by
  sorry
