import Mathlib

/--
Prove that for every $\varepsilon>0$, there exists $C_\varepsilon>0$ such that the following holds for all $f\in C^{1}([0,1])$:
 \[
 \max_{[0,1]} |f| \le \varepsilon \max_{[0,1]} |f'| + C_\varepsilon \int_{0}^{1} |f|.
 \]
-/

theorem ma_proofbench_l2_49 :
    ∀ ε > 0, ∃ Cε > 0, ∀ f : ℝ → ℝ,
      ContDiffOn ℝ 1 f (Set.Icc (0 : ℝ) 1) →
      sSup (Set.image (fun x => ‖f x‖) (Set.Icc (0 : ℝ) 1))
        ≤ ε * sSup (Set.image (fun x => ‖deriv f x‖) (Set.Icc (0 : ℝ) 1))
            + Cε * ∫ x in (0 : ℝ)..1, ‖f x‖ := by
  sorry
