import Mathlib

/--
$I$ is a compact interval containing more than one point. Let $f:I\to I$ be continuous. Show that $f$ has a fixed point, that is, there exists $\xi\in I$ such that

\[
f(\xi)=\xi .
\]
-/

theorem ma_proofbench_l1_64 {a b : ℝ} (hab : a < b) (f : Set.Icc a b → Set.Icc a b) (hf : Continuous f) :
    ∃ ξ : Set.Icc a b, f ξ = ξ := by
  sorry
