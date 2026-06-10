import Mathlib

/--
Suppose $f$ is a real, continuously differentiable function on $[a,b]$, $f(a)=f(b)=0$, and

\[
\int_a^b f^2(x)\,dx=1.
\]
Prove that
\[
\int_a^b x f(x)f'(x)\,dx=-\frac12
\]
-/

theorem ma_proofbench_l1_16 {a b : ℝ} (hab : a < b) {f : ℝ → ℝ}
    (hf : ContDiffOn ℝ 1 f (Set.Icc a b))
    (hfa : f a = 0) (hfb : f b = 0)
    (hnorm : (∫ x in a..b, (f x) ^ 2) = 1) :
    (∫ x in a..b, x * f x * deriv f x) = (-(1 / 2 : ℝ)) := by
  sorry
