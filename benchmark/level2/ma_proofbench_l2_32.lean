import Mathlib

/--
Suppose $f:[0,1]\to[0,\infty]$ has the property that if $f(y)\ne\infty$, then
\[
\liminf_{x\to y} f(x) > f(y).
\]
Prove that $\{y\in[0,1]: f(y)<\infty\}$ is (at most) countable.
-/

theorem ma_proofbench_l2_32
    (f : Set.Icc (0 : ℝ) 1 → ENNReal)
    (hgap : ∀ y : Set.Icc (0 : ℝ) 1,
      f y ≠ (⊤ : ENNReal) →
        Filter.liminf f (nhdsWithin y ({y}ᶜ)) > f y) :
    Set.Countable {y : Set.Icc (0 : ℝ) 1 | f y < (⊤ : ENNReal)} := by
  sorry
