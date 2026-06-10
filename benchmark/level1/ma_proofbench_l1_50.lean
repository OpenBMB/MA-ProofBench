import Mathlib

/--
Verify that $g:\mathbb R^2\setminus\{0\}\to\mathbb R$ defined by

\[
g(x):=
\log|x|,
\]
is harmonic in $\mathbb R^2\setminus\{0\}$.
-/

theorem ma_proofbench_l1_50 : InnerProductSpace.HarmonicOnNhd (fun x : EuclideanSpace ℝ (Fin 2) => Real.log ‖x‖) ({0}ᶜ) := by
  sorry
