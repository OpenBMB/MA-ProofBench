import Mathlib

/--
Let $E$ be an n.v.s. and let $C\subset E$ be convex. Deduce that $\overline{C}=\overline{\operatorname{Int}C}$ whenever $\operatorname{Int}C\ne\varnothing.$
-/

theorem ma_proofbench_l1_88 {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {C : Set E} (hC : Convex ℝ C) (hInt : (interior C).Nonempty) :
    closure (interior C) = closure C := by
  sorry
