import Mathlib

open MeasureTheory Filter

/--
Let $X$ be a Banach space and $T : X \to X$ be a bounded linear operator.
Suppose $T^{n}=I$ for some $n\in \mathbb{Z}_{\ge 2}$. Prove that $\lambda \in \sigma(T)\implies \lambda^{n}=1$.
-/

theorem ma_proofbench_l2_89 {X : Type*} [NormedAddCommGroup X] [NormedSpace ℂ X] [CompleteSpace X] (T : X →L[ℂ] X)
    {n : ℕ} (hn : 2 ≤ n) (hT : T ^ n = (1 : X →L[ℂ] X)) :
    ∀ μ : ℂ, μ ∈ spectrum ℂ T → μ ^ n = (1 : ℂ) := by
  sorry
