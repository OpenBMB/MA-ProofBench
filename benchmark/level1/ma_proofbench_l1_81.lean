import Mathlib

/--
Verify that $g_m:\mathbb R^m\setminus\{0\}\to\mathbb R$ defined by

\[
g_m(x):=|x|^{2-m}, & m>2,
\]
is harmonic in $\mathbb R^m\setminus\{0\}$.
-/

theorem ma_proofbench_l1_81 {m : ℕ} (hm : 2 < m) : InnerProductSpace.HarmonicOnNhd 
  (fun x : EuclideanSpace ℝ (Fin m) => 1 / ‖x‖ ^ (m - 2)) ({0}ᶜ) := by
  sorry
