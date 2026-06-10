import Mathlib

/--
Let $f:\mathbb{R}\to\mathbb{R}$ be defined by

\[
f(x):=
\begin{cases}
e^{-1/x^{2}}, & x\neq 0,\\
0, & x=0.
\end{cases}
\]
Show that $f\in C^{\infty}(\mathbb{R})$.
-/

theorem ma_proofbench_l1_30 (f : ℝ → ℝ) (hf :
      (∀ x : ℝ, x ≠ 0 → f x = Real.exp (-(1 / (x ^ (2 : ℕ))))) ∧ f 0 = 0) :
    ContDiff ℝ (⊤ : ℕ∞) f := by
  sorry
