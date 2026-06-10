import Mathlib

open Filter Topology

/--
Let $X$ be a complete metric space and, for $f:X\to X$, let $f^n$ denote the $n^{\text{th}}$ iterate

of $f$, that is, $f^0 := \mathrm{id}_X$ and $f^n := f\circ f^{n-1}$, $n\in\mathbb{N}^*$. Suppose that, for each $n\in\mathbb{N}$, there
is some $q_n\ge 0$ such that
\[
d\bigl(f^n(x),f^n(y)\bigr)\le q_n d(x,y), \qquad x,y\in X.
\]
Show that, if $(q_n)$ is a null sequence, then $f$ has a fixed point in $X$.
-/

theorem ma_proofbench_l1_74 (X : Type*) [MetricSpace X] [CompleteSpace X] [Nonempty X] (f : X → X) (q : ℕ → ℝ)
    (hq_nonneg : ∀ n : ℕ, 0 ≤ q n)
    (hLip : ∀ n : ℕ+, ∀ x y : X, dist ((f^[n]) x) ((f^[n]) y) ≤ q n * dist x y)
    (hq_null : Tendsto q atTop (𝓝 (0 : ℝ))) :
    ∃ x : X, f x = x := by
  sorry
