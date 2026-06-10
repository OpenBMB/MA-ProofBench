import Mathlib

/--
Consider the function $f:\mathbb{R}^{2}\to\mathbb{R}$ defined by

\[
f(x,y):=
\begin{cases}
\dfrac{xy}{x^{2}+y^{2}}, & (x,y)\neq(0,0),\\
0, & (x,y)=(0,0).
\end{cases}
\]
Prove that $f$ is continuous on $\mathbb{R}^{2}\setminus\{(0,0)\}$ and discontinuous at $(0,0)$.
-/

theorem ma_proofbench_l1_93 (f : (ℝ × ℝ) → ℝ) (hf : (∀ p : (ℝ × ℝ), p ≠ (0, 0) → f p = (p.1 * p.2) / (p.1 ^ (2 : ℕ) + p.2 ^ (2 : ℕ))) ∧ (f (0, 0) = 0)) :
    ContinuousOn f ({(0, 0)}ᶜ) ∧ ¬ ContinuousAt f (0, 0) := by
  sorry
