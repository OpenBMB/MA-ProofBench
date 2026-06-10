import Mathlib

/--
Let $(X,\|\cdot\|_X)$, $(Y,\|\cdot\|_Y)$, $(Z,\|\cdot\|_Z)$ be Banach spaces. Suppose $X\subset Y$ is compact and $Y\subset Z$ is continuous. Prove that for every $\varepsilon>0$, there exists $C_\varepsilon>0$ such that
 \[
 \|u\|_Y \le \varepsilon \|u\|_X + C_\varepsilon \|u\|_Z \qquad \forall\, u\in X.
 \]
-/

theorem ma_proofbench_l2_36
    {X Y Z : Type*}
    [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y] [CompleteSpace Y]
    [NormedAddCommGroup Z] [NormedSpace ℝ Z] [CompleteSpace Z]
    (iXY : X →L[ℝ] Y) (iYZ : Y →L[ℝ] Z)
    (hXY_compact : IsCompactOperator (iXY : X → Y))
    (hXY_inj : Function.Injective iXY)
    (hYZ_inj : Function.Injective iYZ) :
    ∀ ε > 0, ∃ Cε > 0, ∀ u : X,
      ‖iXY u‖ ≤ ε * ‖u‖ + Cε * ‖iYZ (iXY u)‖ := by
  sorry
