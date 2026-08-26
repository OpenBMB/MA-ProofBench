import Mathlib

/--
Let $\phi:\mathbb{R}^2\to\mathbb{R}$ be a Schwartz function. Consider the Laplace's equation in half space as follows,
\[
\left\{
\begin{aligned}
\Delta_{x,y,z}u(x,y,z) &= 0, && (x,y,z)\in \mathbb{R}^3_-:=\mathbb{R}^2\times[0,-\infty)\\
u\big|_{z=0} &= \phi\\
\lim_{z\to -\infty}\sup_{x,y\in\mathbb{R}}|u(x,y,z)| &= 0
\end{aligned}
\right.
\]
Prove that, there exists an constant $C(\phi)$, which depends on $\phi$, such that the following estimate holds,
\[
\forall z\in[0,-\infty),\ \sup_{x,y\in\mathbb{R}}|u(x,y,z)|\le C(\phi)(1+|z|)^{-1}.
\]
-/

abbrev R2 : Type := EuclideanSpace ℝ (Fin 2)
abbrev R3 : Type := EuclideanSpace ℝ (Fin 3)

abbrev LowerHalfSpace : Set R3 := {p : R3 | p 2 ≤ 0}
abbrev OpenLowerHalfSpace : Set R3 := {p : R3 | p 2 < 0}

noncomputable def point3 (x : R2) (z : ℝ) : R3 :=
  EuclideanSpace.single (0 : Fin 3) (x 0) +
    EuclideanSpace.single (1 : Fin 3) (x 1) +
      EuclideanSpace.single (2 : Fin 3) z

theorem ma_proofbench_l2_72
  (φ : SchwartzMap R2 ℝ)
  (u : R3 → ℝ)
  (hu_harmonic : InnerProductSpace.HarmonicOnNhd u OpenLowerHalfSpace)
  (hu_cont : ContinuousOn u LowerHalfSpace)
  (hu_boundary : ∀ x : R2, u (point3 x 0) = φ x)
  (hu_decay :
    ∀ ε : ℝ, 0 < ε →
      ∀ᶠ z : ℝ in Filter.atBot, ∀ x : R2, |u (point3 x z)| < ε) :
  ∃ C : ℝ, 0 < C ∧
    ∀ z : ℝ, z ≤ 0 →
      ∀ x : R2, |u (point3 x z)| ≤ C * (1 + |z|)⁻¹ := by
  sorry
