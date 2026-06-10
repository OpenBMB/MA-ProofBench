import Mathlib

/--
Let $f$ be continuous on the entire plane and holomorphic on the complement of the coordinate axes.

Prove that $f$ is actually holomorphic on all of $\C$.
-/

def realAxis : Set ℂ := {z : ℂ | z.im = 0}

def imagAxis : Set ℂ := {z : ℂ | z.re = 0}

def coordAxes : Set ℂ := realAxis ∪ imagAxis

theorem ma_proofbench_l1_27 (f : ℂ → ℂ) (hc : Continuous f) (hhol : DifferentiableOn ℂ f (coordAxesᶜ)) :
    Differentiable ℂ f := by
  sorry
