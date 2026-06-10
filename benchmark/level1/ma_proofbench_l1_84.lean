import Mathlib

/--
Suppose that $f$ is bounded and holomorphic on $\C\setminus\{0\}$. Prove that $f$ is constant.
-/

theorem ma_proofbench_l1_84 (f : ℂ → ℂ) (hHol : DifferentiableOn ℂ f ({0}ᶜ))
    (hBdd : ∃ C : ℝ, ∀ z : ℂ, z ≠ 0 → ‖f z‖ ≤ C) :
    ∃ c : ℂ, Set.EqOn f (fun _ => c) ({0}ᶜ) := by
  sorry
