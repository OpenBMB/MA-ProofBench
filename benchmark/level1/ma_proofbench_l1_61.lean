import Mathlib

/--
Assume that $\varphi$ is a continuous real function on $(a,b)$ such that

\[
\varphi\!\left(\frac{x+y}{2}\right)\le \frac12\varphi(x)+\frac12\varphi(y)
\]
for all $x$ and $y\in(a,b)$. Prove that $\varphi$ is convex.
-/

theorem ma_proofbench_l1_61 {a b : ℝ} (hab : a < b) (φ : ℝ → ℝ)
    (hcont : ContinuousOn φ (Set.Ioo a b))
    (hmiddle :
      ∀ ⦃x⦄, x ∈ Set.Ioo a b → ∀ ⦃y⦄, y ∈ Set.Ioo a b →
        φ ((x + y) / 2) ≤ (φ x + φ y) / 2) :
    ConvexOn ℝ (Set.Ioo a b) φ := by
  sorry
