import Mathlib

/--
Let $f:\Omega\to\mathbb{C}$ be non-constant and holomorphic, where $\Omega\subset\mathbb{C}$ is an open set containing the closed unit disk $|z|\le 1$. Assume that $|f(w)|=1$ whenever $|w|=1$, show that $f(\Omega)$ contains the open unit disk.
-/

theorem ma_proofbench_l2_08
  (Ω : Set ℂ)
  (hΩ_open : IsOpen Ω)
  (hDisk : {z : ℂ | ‖z‖ ≤ 1} ⊆ Ω)
  (f : ℂ → ℂ)
  (hf_holo : DifferentiableOn ℂ f Ω)
  (hf_nonconst : ¬ ∃ c : ℂ, ∀ z : ℂ, z ∈ Ω → f z = c)
  (hbdry : ∀ w : ℂ, ‖w‖ = 1 → ‖f w‖ = 1) :
  {z : ℂ | ‖z‖ < 1} ⊆ f '' Ω := by
  sorry
