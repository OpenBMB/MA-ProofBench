import Mathlib

open MeasureTheory Filter

/--
For $x\in [0,1]$, define $\delta_x\in (C([0,1]))^{*}$ by $\delta_x(f)=f(x)$.
Prove that the map $x\mapsto \delta_x$ is continuous for $(C([0,1]))^{*}$ equipped with the weak-* topology.
-/

theorem ma_proofbench_l2_35 (δ : Set.Icc (0 : ℝ) 1 → WeakDual ℝ (C(Set.Icc (0 : ℝ) 1, ℝ)))
    (hδ : ∀ x (g : C(Set.Icc (0 : ℝ) 1, ℝ)), δ x g = g x) :
    Continuous δ := by
  sorry
