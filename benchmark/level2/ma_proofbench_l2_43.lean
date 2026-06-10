import Mathlib

/--
Let $f_n : \mathbb{R} \to \mathbb{R}$, $n \in \mathbb{N}$ be a sequence of Lebesgue measurable function on $\mathbb{R}$
such that
\begin{itemize}
\item $f_n \to f$ almost everywhere, where $f : \mathbb{R} \to \mathbb{R}$;
\item there exists a Lebesgue integrable function $g : \mathbb{R} \to [0, \infty)$ such that for any
$x \in \mathbb{R}$ and $n \in \mathbb{N}$, $|f_n(x)| \le g(x)$.
\end{itemize}

Show that for any $\varepsilon > 0$, there exists a subset $E \subset \mathbb{R}$ with Lebesgue measure
$m(E) < \varepsilon$ such that $f_n$ converges uniformly to $f$ on $\mathbb{R} \setminus E$.
-/

theorem ma_proofbench_l2_43
  (f : ℝ → ℝ) (fn : ℕ → ℝ → ℝ) (g : ℝ → ℝ) (hfn_meas : ∀ n : ℕ, Measurable (fn n))
  (hae : ∀ᵐ x ∂MeasureTheory.volume, Filter.Tendsto (fun n : ℕ => fn n x) Filter.atTop (nhds (f x)))
  (hg : MeasureTheory.Integrable g)
  (hdom : ∀ n : ℕ, ∀ x : ℝ, |fn n x| ≤ g x) :
  ∀ ε : ℝ, ε > 0 → ∃ E : Set ℝ,
    MeasurableSet E ∧ MeasureTheory.volume E < ENNReal.ofReal ε ∧
      TendstoUniformlyOn fn f Filter.atTop Eᶜ := by
  sorry
