import Mathlib

/--
For $E \subset \mathbb{R}^n$ and $f : E \to \mathbb{R}^n$, let
\[
F = \{x \in E : \text{there is } \{x_k\}_{k=1}^\infty \subset E \setminus \{x\} \text{ with } x_k \to x \text{ and } f(x_k) \to f(x)\}.
\]
Prove that $E \setminus F$ is at most countable.
-/

theorem ma_proofbench_l2_63
    {n : ℕ}
    (E F : Set (EuclideanSpace ℝ (Fin n)))
    (f : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n))
    (hF : ∀ x : EuclideanSpace ℝ (Fin n),
      x ∈ F ↔
        x ∈ E ∧
        ∃ xk : ℕ → EuclideanSpace ℝ (Fin n),
          (∀ k : ℕ, xk k ∈ E ∧ xk k ≠ x) ∧
          Filter.Tendsto xk Filter.atTop (nhds x) ∧
          Filter.Tendsto (fun k : ℕ => f (xk k)) Filter.atTop (nhds (f x))) :
    Set.Countable (E \ F) := by
  sorry
