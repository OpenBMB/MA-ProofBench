import Mathlib

/--
Suppose $X$ is an open convex subset of a Banach space $E$ and $f\in C^2(X,\mathbb R)$. Show these statements are equivalent:

$f$ is convex;
$f(x)\ge f(a)+\partial f(a)(x-a)$, for $a,x\in X$;
-/

theorem ma_proofbench_l1_95 {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {X : Set E} (hXopen : IsOpen X) (hXconv : Convex ℝ X)
    {f : E → ℝ} (hf : ContDiffOn ℝ 2 f X) :
    ConvexOn ℝ X f ↔
      ∀ ⦃a⦄, a ∈ X → ∀ ⦃x⦄, x ∈ X →
        f x ≥ f a + (fderivWithin ℝ f X a) (x - a) := by
  sorry
