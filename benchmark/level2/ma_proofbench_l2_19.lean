import Mathlib

/--
Prove that there is a constant $C_1 > 0$ such that
\[
\int_0^1 w^2(t) \, dt \le C_1 \int_0^1 (w')^2(t) \, dt
\]
for all $w \in C^\infty([0, 1])$ satisfying $w(0) = 0 = w(1)$.
-/

theorem ma_proofbench_l2_19 :
    ∃ C1 : ℝ, 0 < C1 ∧
      ∀ w : ℝ → ℝ, ContDiff ℝ (⊤ : ℕ∞) w →
        w 0 = 0 → w 1 = 0 →
          ∫ t in Set.Icc (0 : ℝ) 1, (w t) ^ 2
            ≤ C1 * ∫ t in Set.Icc (0 : ℝ) 1, (deriv w t) ^ 2 := by
  sorry
