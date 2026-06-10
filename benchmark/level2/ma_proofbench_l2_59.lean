import Mathlib

open scoped Topology

/--
Let $H$ be a Hilbert space.
Let $\{T_n\}_{n=1}^\infty \subset L(H)$. Prove that $T_n \to T$ in the strong operator topology if and only if $T_n \to T$ in the weak operator topology and $T_n^* T_n \to T^* T$ in the weak operator topology.
-/

theorem ma_proofbench_l2_59
    {𝕜 H : Type*}
    [RCLike 𝕜]
    [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]
    (Tn : ℕ → H →L[𝕜] H)
    (T : H →L[𝕜] H) :
    (∀ x : H, Filter.Tendsto (fun n => Tn n x) Filter.atTop (𝓝 (T x))) ↔
      (∀ x y : H, Filter.Tendsto (fun n => inner 𝕜 y (Tn n x)) Filter.atTop (𝓝 (inner 𝕜 y (T x)))) ∧
        (∀ x y : H, Filter.Tendsto (fun n => inner 𝕜 y (((Tn n).adjoint.comp (Tn n)) x))
            Filter.atTop (𝓝 (inner 𝕜 y ((T.adjoint.comp T) x)))) := by
  sorry
