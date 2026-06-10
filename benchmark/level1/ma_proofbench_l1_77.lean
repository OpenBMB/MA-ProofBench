import Mathlib

/--
Show that

\[
\mathbb R^m\to\mathbb R,\qquad x\mapsto
\begin{cases}
\exp(1/(|x|^2-1)), & |x|<1,\\
0, & |x|\ge1,
\end{cases}
\]
is smooth.
-/

theorem ma_proofbench_l1_77 {m : ℕ} (hm : 0 < m) :
    ContDiff ℝ (⊤ : ℕ∞)
      (fun x : EuclideanSpace ℝ (Fin m) =>
        if ‖x‖ < 1 then
          Real.exp (1 / (‖x‖ ^ 2 - 1))
        else
          0) := by
  sorry
