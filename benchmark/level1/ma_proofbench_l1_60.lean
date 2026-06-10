import Mathlib

open Filter Topology

/--
Suppose $\{f_n\}$ is an equicontinuous sequence of functions on a compact set $K$, and $\{f_n\}$ converges pointwise on $K$. Prove that $\{f_n\}$ converges uniformly on $K$.
-/

theorem ma_proofbench_l1_60 {α β : Type*} [MetricSpace α] [MetricSpace β]
    (K : Set α) (f : ℕ → α → β) (g : α → β)
    (hK : IsCompact K)
    (heq : EquicontinuousOn f K)
    (hpt : ∀ x ∈ K, Tendsto (fun n => f n x) atTop (𝓝 (g x))) :
    TendstoUniformlyOn f g atTop K := by
  sorry
