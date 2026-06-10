import Mathlib

/--
If $f$ is continuous on $[0,1]$ and if

\[
\int_{0}^{1} f(x)x^{n}\,dx=0\qquad (n=0,1,2,\dots),
\]
prove that $f(x)=0$ on $[0,1]$.
-/

theorem ma_proofbench_l1_51 (f : ℝ → ℝ) (hf : ContinuousOn f (Set.Icc 0 1))
    (h : ∀ n : ℕ, (∫ x in 0..1, f x * x ^ n) = 0) :
    Set.EqOn f 0 (Set.Icc 0 1) := by
  sorry
