import Mathlib

/--
Let $H$ and $K$ be two Hilbert spaces. A set $Q$ of bounded linear transformations $H \to K$ is weakly bounded if for every $f\in H$ and $g\in K$, there exists a scalar $\alpha$ such that
\[
|\langle Af, g\rangle| \le \alpha \quad \text{for all } A\in Q.
\]
Prove that every weakly bounded set of bounded linear transformations between Hilbert spaces is bounded.
-/

theorem ma_proofbench_l2_60 (𝕜 : Type*) [RCLike 𝕜]
    (H K : Type*) [NormedAddCommGroup H] [NormedAddCommGroup K]
    [InnerProductSpace 𝕜 H] [InnerProductSpace 𝕜 K]
    [CompleteSpace H] [CompleteSpace K]
    (Q : Set (H →L[𝕜] K))
    (hQ : ∀ f : H, ∀ g : K, ∃ α : ℝ, ∀ A : H →L[𝕜] K, A ∈ Q → ‖inner 𝕜 (A f) g‖ ≤ α) :
    ∃ M : ℝ, ∀ A : H →L[𝕜] K, A ∈ Q → ‖A‖ ≤ M := by
  sorry
