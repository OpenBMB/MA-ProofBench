import Mathlib

/--
Show that if $f:\mathbb{R}\to\mathbb{R}$ is absolutely continuous, then $f$ maps sets of measure zero to sets of measure zero.
-/

theorem ma_proofbench_l1_75 (f : ℝ → ℝ) (hf : ∀ a b : ℝ, AbsolutelyContinuousOnInterval f a b) :
    ∀ s : Set ℝ, MeasureTheory.volume s = 0 → MeasureTheory.volume (f '' s) = 0 := by
  sorry
