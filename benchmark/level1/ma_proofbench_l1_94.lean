import Mathlib

/--
Let $X$ and $Y$ be metric spaces. Prove that

\[
f:X\to Y \text{ is continuous } \iff f(\overline{A})\subseteq \overline{f(A)}
\quad\text{for all }A\subseteq X.
\]
-/

theorem ma_proofbench_l1_94 {X Y : Type*} [MetricSpace X] [MetricSpace Y] (f : X → Y) :
    Continuous f ↔ ∀ A : Set X, f '' (closure A) ⊆ closure (f '' A) := by
  sorry
