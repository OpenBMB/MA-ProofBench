import Mathlib

/--
Suppose $a>0$ and $f\in C([-a,a],E)$. Prove that

if $f$ is odd, then $\int_{-a}^{a} f(x)\,dx=0$;
-/

theorem ma_proofbench_l1_21 {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {a : ℝ} (ha : 0 < a) {f : ℝ → E}
    (hf : ContinuousOn f (Set.Icc (-a) a))
    (hodd : Function.Odd f) :
    (∫ x in (-a)..a, f x) = 0 := by
  sorry
