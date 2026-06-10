import Mathlib

open Filter Topology

/--
Let $\{f_n\}$ be a sequence of continuous functions which converges uniformly to a function $f$ on a set $E$. Prove that

\[
\lim_{n\to\infty} f_n(x_n)=f(x)
\]
for every sequence of points $x_n\in E$ such that $x_n\to x$, and $x\in E$.
-/

theorem ma_proofbench_l1_55 {α : Type*} [MetricSpace α]
    (E : Set α) (fₙ : ℕ → α → ℝ) (f : α → ℝ)
    (hcont : ∀ n, ContinuousOn (fₙ n) E)
    (hunif : TendstoUniformlyOn fₙ f atTop E)
    (xₙ : ℕ → α) (x : α)
    (hxE : x ∈ E) (hxₙE : ∀ n : ℕ, xₙ n ∈ E)
    (hxₙ : Tendsto xₙ atTop (𝓝 x)) :
    Tendsto (fun n => fₙ n (xₙ n)) atTop (𝓝 (f x)) := by
  sorry
