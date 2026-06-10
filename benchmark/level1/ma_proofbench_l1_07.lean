import Mathlib

open Filter Topology

/--
Let $(f_n)$ be a sequence of monotone functions on a compact interval $I$ which converges pointwise to a continuous function $f$. Show that $f$ is monotone and that $(f_n)$ converges uniformly to $f$.
-/

theorem ma_proofbench_l1_07 (a b : ℝ) (hab : a < b) (f : ℕ → (Set.Icc a b) → ℝ) (g : (Set.Icc a b) → ℝ)
    (hmono : ∀ n : ℕ, Monotone (f n))
    (hpt : ∀ x : Set.Icc a b, Tendsto (fun n => f n x) atTop (𝓝 (g x)))
    (hgcont : Continuous g) :
    Monotone g ∧
      TendstoUniformly (fun n x => f n x) g atTop := by
  sorry
