import Mathlib

open Topology Filter

/--
Let $E$ and $F$ be two Banach spaces and let $(T_n)$ be a sequence in $\mathcal{L}(E,F)$.

Assume that for every $x\in E$, $T_nx$ converges as $n\to\infty$ to a limit denoted by $Tx$.
Show that if $x_n\to x$ in $E$, then $T_nx_n\to Tx$ in $F$.
-/

theorem ma_proofbench_l1_68 {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [CompleteSpace F]
    (Tn : ℕ → E →L[ℝ] F) (T : E → F)
    (hT : ∀ x : E, Tendsto (fun n => Tn n x) atTop (𝓝 (T x))) :
    ∀ (xseq : ℕ → E) (x : E), Tendsto xseq atTop (𝓝 x) →
      Tendsto (fun n => Tn n (xseq n)) atTop (𝓝 (T x)) := by
  sorry
