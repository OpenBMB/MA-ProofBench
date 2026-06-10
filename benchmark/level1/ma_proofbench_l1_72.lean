import Mathlib

open MeasureTheory

/--
Show that if $f$ and $g$ are integrable on $\mathbb{R}^{d}$, then $f(x-y)g(y)$ is integrable on $\mathbb{R}^{2d}$.
-/

theorem ma_proofbench_l1_72 {d : ℕ} {f g : (Fin d → ℝ) → ℝ}
    (hf : Integrable f) (hg : Integrable g) :
    Integrable (fun p : Fin (d + d) → ℝ =>
        f (fun i : Fin d => p (Fin.castAdd d i) - p (Fin.natAdd d i)) *
        g (fun i : Fin d => p (Fin.natAdd d i))) := by
  sorry
