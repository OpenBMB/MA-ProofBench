import Mathlib

/--
Assume $0 \in \Omega$ is an open connected subset of the unit disk $D$. Let $F$ be the
family of all the holomorphic maps $f : \Omega \to D$ such that $f$ is injective, $f(0) = 0$ and
$f(\Omega) \subset D$. Prove that there is a holomorphic map $g \in F$ such that
\[
|g'(0)| = \sup_{f \in F} |f'(0)|.
\]
-/

abbrev unitDisk : Set ℂ := Metric.ball (0 : ℂ) 1

def AdmissibleFamily (Ω : Set ℂ) : Set (ℂ → ℂ) :=
  {f | DifferentiableOn ℂ f Ω ∧ Set.InjOn f Ω ∧ f 0 = 0 ∧ Set.MapsTo f Ω unitDisk}

theorem ma_proofbench_l2_22
  (Ω : Set ℂ)
  (hΩ_open : IsOpen Ω)
  (hΩ_connected : IsConnected Ω)
  (h0 : (0 : ℂ) ∈ Ω)
  (hΩ_subset : Ω ⊆ unitDisk) :
  ∃ g ∈ AdmissibleFamily Ω,
    ‖deriv g 0‖ = sSup ((fun f : ℂ → ℂ => ‖deriv f 0‖) '' AdmissibleFamily Ω) := by
  sorry
