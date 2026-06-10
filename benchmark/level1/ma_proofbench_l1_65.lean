import Mathlib

/--
Let $(X,d)$ be a metric space and define

\[
\delta(x,y):=\frac{d(x,y)}{1+d(x,y)}, \qquad x,y\in X.
\]
Prove that $d$ and $\delta$ are equivalent metrics on $X$.
-/

theorem ma_proofbench_l1_65 {X : Type*} [MetricSpace X]
    (δ : X → X → ℝ) (hδ : ∀ x y : X, δ x y = dist x y / (1 + dist x y)) :
    (∀ x : X, ∀ ε > 0, ∃ η > 0, Metric.ball x η ⊆ {y : X | δ x y < ε}) ∧
    (∀ x : X, ∀ ε > 0, ∃ η > 0, {y : X | δ x y < η} ⊆ Metric.ball x ε) := by
  sorry
