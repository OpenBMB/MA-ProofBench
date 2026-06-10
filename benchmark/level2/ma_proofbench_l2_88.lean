import Mathlib

/--
Let $\Omega\subseteq\mathbb{C}$ be an open and connected set and let $h:\Omega\to\mathbb{R}$ be a harmonic function. Show that if $h$ vanishes on a set of positive measure in $\Omega$, then $h=0$.
-/

theorem ma_proofbench_l2_88
  (Ω : Set ℂ) (h : ℂ → ℝ) (hΩ_open : IsOpen Ω) (hΩ_connected : IsConnected Ω)
  (hh_harmonic : InnerProductSpace.HarmonicOnNhd h Ω)
  (h_zero_on_pos_meas :
    ∃ s : Set ℂ, s ⊆ Ω ∧ 0 < MeasureTheory.volume s ∧ ∀ z ∈ s, h z = 0) :
  ∀ z ∈ Ω, h z = 0 := by
  sorry
