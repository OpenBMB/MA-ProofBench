import Mathlib

open MeasureTheory

/--
Assume that $n\ge 2$, $p\in(1,2)$, and $q\in[p,+\infty]$.

Show that there exists a constant $C$ (may depend on $p,q,n$) such that for all radial function $f\in C_c^\infty(\mathbb{R}^n\setminus B)$, there holds:
\[
\|f\|_{L^q(\mathbb{R}^n)}\le C\|f\|_{W^{1,p}(\mathbb{R}^n)}.
\]
Here $B$ is the closed unit ball in $\mathbb{R}^n$.
-/

abbrev Rn (n : ℕ) : Type := EuclideanSpace ℝ (Fin n)

def ClosedUnitBall (n : ℕ) : Set (Rn n) := {x : Rn n | ‖x‖ ≤ 1}

def IsRadial {n : ℕ} (f : Rn n → ℝ) : Prop :=
  ∀ x y : Rn n, ‖x‖ = ‖y‖ → f x = f y

theorem ma_proofbench_l2_80
  (n : ℕ)
  (hn : 2 ≤ n)
  (p q : ENNReal)
  (hp1 : 1 < p)
  (hp2 : p < 2)
  (hpq : p ≤ q) :
  ∃ C : ℝ, 0 < C ∧
    ∀ f : Rn n → ℝ,
      ContDiffOn ℝ ⊤ f ((ClosedUnitBall n)ᶜ) →
      HasCompactSupport f →
      tsupport f ⊆ (ClosedUnitBall n)ᶜ →
      IsRadial f →
      eLpNorm f q volume ≤
        ENNReal.ofReal C *
          (eLpNorm f p volume +
            eLpNorm (fun x : Rn n => ‖fderiv ℝ f x‖) p volume) := by
  sorry
