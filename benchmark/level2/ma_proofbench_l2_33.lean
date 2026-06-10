import Mathlib

/--
Let $H$ be a separable Hilbert space. We say that a bounded linear operator $T : H \to H$ is a shift if there exists an orthonormal basis $\{e_n\}_{n=1}^{\infty}$ of $H$ such that $T(e_n) = e_{n+1}$ for every $n \in \mathbb{Z}_{\ge 1}$.
Prove that a linear operator $T : H \to H$ is a shift if and only if $T$ is a Hilbert space isomorphism (i.e., $\langle T x, T y\rangle = \langle x, y\rangle$ for all $x, y \in H$) satisfying $\bigcap_{n=1}^{\infty} \mathrm{Ran}(T^n) = \{0\}$ and $\dim(\mathrm{Ran}(T))^\perp = 1$.
-/

def IsShift
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) : Prop :=
  ∃ b : HilbertBasis ℕ ℂ H, ∀ n : ℕ, T (b n) = b (n + 1)

theorem ma_proofbench_l2_33
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [TopologicalSpace.SeparableSpace H]
    (T : H →L[ℂ] H) :
    IsShift T ↔
      (∀ x y : H, inner ℂ (T x) (T y) = inner ℂ x y) ∧
        (⨅ n : ℕ, LinearMap.range (T.toLinearMap ^ (n + 1))) = ⊥ ∧
        Module.rank ℂ (T.rangeᗮ) = 1 := by
  sorry
