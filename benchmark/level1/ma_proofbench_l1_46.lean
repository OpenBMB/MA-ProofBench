import Mathlib

open Filter Topology

/--
Let $(\alpha,\beta)\in \R^{2}$. For $k\in\N$, set

\[
x_k :=
\begin{cases}
(\alpha,\beta), & k \text{ even},\\
(\beta,\alpha), & k \text{ odd},
\end{cases}
\]
and
\[
s_n := \sum_{k=1}^{n} k^{-2} x_k,\qquad n\in\N^\ast.
\]
Show that $(s_n)$ converges.
-/

theorem ma_proofbench_l1_46
    (α β : ℝ) (x s : ℕ → (ℝ × ℝ))
    (hx : ∀ k : ℕ, x k = if Even k then (α, β) else (β, α))
    (hs : ∀ n : ℕ, s n = ∑ k ∈ Finset.Icc (1 : ℕ) n,
        (1 / ((k : ℝ) ^ 2)) • x k) :
    ∃ L : (ℝ × ℝ), Tendsto s atTop (𝓝 L) := by
  sorry
