import Mathlib

/--
Prove that there is a constant $C_2 > 0$ such that
\[
\int_{-\infty}^{\infty} u^6(t) \, dt \le C_2 \int_{-\infty}^{\infty} (u')^2(t) \, dt
\]
for all $u \in C_c^\infty(\mathbb{R})$ satisfying
\[
\int_{-\infty}^{\infty} u^2(t) \, dt = 1.
\]
-/

theorem ma_proofbench_l2_79 :
    ∃ C2 : ℝ, 0 < C2 ∧
      ∀ u : ℝ → ℝ,
        ContDiff ℝ (⊤ : ℕ∞) u →
        HasCompactSupport u →
        (∫ t, (u t) ^ 2) = 1 →
          ∫ t, (u t) ^ 6 ≤ C2 * ∫ t, (deriv u t) ^ 2 := by
  sorry
