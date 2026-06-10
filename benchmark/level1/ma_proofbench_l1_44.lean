import Mathlib

/--
For $f\in C([\alpha,\beta],E)$, show

\[
\int_{\alpha}^{s}\left(\int_{\alpha}^{t} f(\tau)\,d\tau\right)\,dt=\int_{\alpha}^{s} (s-t)f(t)\,dt \qquad \text{for } s\in[\alpha,\beta].
\]
-/

theorem ma_proofbench_l1_44 {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {α β : ℝ} (hαβ : α ≤ β) (f : ℝ → E) (hf : ContinuousOn f (Set.Icc α β)) :
    ∀ s ∈ Set.Icc α β,
      (∫ t in α..s, (∫ τ in α..t, f τ))
        = (∫ t in α..s, (s - t) • f t) := by
  sorry
