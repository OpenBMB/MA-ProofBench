import Mathlib

/--
Whenever $F$ and $G$ are absolutely continuous in $[a,b]$,

 \[
 \int_a^b F'(x)G(x)\,dx=-\int_a^b F(x)G'(x)\,dx+[F(x)G(x)]_a^b.
 \]
-/

theorem ma_proofbench_l1_80 {a b : ℝ} {F G : ℝ → ℝ} (hF : AbsolutelyContinuousOnInterval F a b)
    (hG : AbsolutelyContinuousOnInterval G a b) :
    (∫ x in a..b, (deriv F x) * (G x))
      = -(∫ x in a..b, (F x) * (deriv G x)) + (F b * G b - F a * G a) := by
  sorry
