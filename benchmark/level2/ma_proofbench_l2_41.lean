import Mathlib

/--
Let $\Delta := \{z\in\mathbb{C}\mid |z|<1\}$ be the unit disc in the complex plane. Prove there is no proper holomorphic map $f:\Delta\to\mathbb{C}$. (Proper means that the preimage of a compact set is compact.)
-/

theorem ma_proofbench_l2_41 :
    ¬ ∃ f : ℂ → ℂ,
        DifferentiableOn ℂ f (Metric.ball (0 : ℂ) 1) ∧
          (∀ K : Set ℂ, IsCompact K →
            IsCompact ((fun z : Metric.ball (0 : ℂ) 1 => f z) ⁻¹' K)) := by
  sorry
