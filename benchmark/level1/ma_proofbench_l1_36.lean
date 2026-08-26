import Mathlib

variable {X : Type*} [MetricSpace X]

/--
Suppose that $X$ is a metric space, with metric $d$, and that $f:X\to[0,\infty]$ is lower semicontinuous, $f(p)<\infty$ for at least one $p\in X$. For $n=1,2,3,\ldots$, $x\in X$, define

\[
g_n(x)=\inf\{f(p)+nd(x,p):p\in X\}
\]
and prove that $|g_n(x)-g_n(y)|\le nd(x,y)$.
-/
noncomputable def g (f : X → ENNReal) (n : ℕ) (x : X) : ENNReal :=
  sInf (Set.range fun p : X => f p + n * ENNReal.ofReal (dist x p))

theorem ma_proofbench_l1_36 (f : X → ENNReal) (hf : LowerSemicontinuous f)
    (hp : ∃ p : X, f p < ⊤)
    (n : ℕ) (x y : X) :
    |(g f n x).toReal - (g f n y).toReal| ≤ n * dist x y := by
  sorry
