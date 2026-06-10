import Mathlib

open Set

/--
For $f \in C^2(\mathbb{R})$, let $M_k = \sup_x |f^{(k)}(x)|$.
Prove that $M_1 \le 2\sqrt{M_0 M_2}$.
-/

theorem ma_proofbench_l2_92
    (f : ℝ → ℝ)
    (hf : ContDiff ℝ 2 f)
    (M : ℕ → ℝ)
    (hM : M = fun k => ⨆ x : ℝ, |iteratedDeriv k f x|)
    (hB0 : BddAbove (Set.range (fun x : ℝ => |iteratedDeriv 0 f x|)))
    (hB2 : BddAbove (Set.range (fun x : ℝ => |iteratedDeriv 2 f x|))) :
    BddAbove (Set.range (fun x : ℝ => |iteratedDeriv 1 f x|)) ∧
      M 1 ≤ 2 * Real.sqrt (M 0 * M 2) := by
  sorry
