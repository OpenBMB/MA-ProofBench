import Mathlib

/--
Define

\[
f(x)=\int_x^{x+1}\sin(t^2)\,dt.
\]
Prove that $|f(x)|<1/x$ if $x>0$.
-/

theorem ma_proofbench_l1_29 (f : ℝ → ℝ)
    (hf : f = fun x : ℝ => ∫ t in x..(x + 1), Real.sin (t ^ 2))
    (x : ℝ) (hx : 0 < x) :
    |f x| < 1 / x := by
  sorry
