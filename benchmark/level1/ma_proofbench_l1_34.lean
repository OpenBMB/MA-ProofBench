import Mathlib

open MeasureTheory

/--
If $f\in \operatorname{Lip}1$ on $[a,b]$ (i.e. $f$ is Lipschitz continuous on $[a,b]$ with Lipschitz constant $1$), prove that $f$ is absolutely continuous and that $f'\in L^\infty$.
-/

theorem ma_proofbench_l1_34 {f : ℝ → ℝ} {a b : ℝ} (hab : a ≤ b)
    (hf : LipschitzOnWith 1 f (Set.Icc a b)) :
    AbsolutelyContinuousOnInterval f a b ∧
      eLpNorm (fun x => deriv f x) ⊤ (volume.restrict (Set.Icc a b)) < ⊤ := by
  sorry
