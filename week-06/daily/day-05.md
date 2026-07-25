# Day 5 — CI/CD Eval Gates + Observability Dashboard

> **You are here:** Day 5 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 4](day-04.md) — judge calibration |
| **Today's outcome** | GitHub Actions eval gate + Langfuse dashboard wired |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-06-work/` or `~/ai-learning/week-06-work/` |
| **Stop when** | CI workflow green locally or on GitHub |

**Catch-up:** skip to Step 5 (lab) if needed.

---

## Steps

### Step 1 — Theory: CI/CD eval gates (~40 min)

Read [ci-cd-eval-gates.md](../theory/ci-cd-eval-gates.md) — regression thresholds, baseline pinning, fail-fast vs nightly.

### Step 2 — Theory: observability dashboards (~35 min)

Read [observability-eval-dashboards.md](../theory/observability-eval-dashboards.md) — Langfuse scores, OTel spans, drift charts.

Refresher: [Week 5 observability](../../week-05/theory/observability.md).

### Step 3 — Lab spec (~15 min)

Read [Lab 5](../labs/lab-05-ci-eval-gate.md).

### Step 4 — Pin baseline (~20 min)

From Day 1 report, set in `.env`:

```
EVAL_FAITHFULNESS_BASELINE=0.78   # your actual score
EVAL_FAITHFULNESS_MIN=0.73        # baseline minus 5%
```

Golden dataset must be ≥ 30 pairs before CI gate.

### Step 5 — Code: CI workflow (~150 min)

Create `.github/workflows/eval-gate.yml`:

1. Checkout + setup Python
2. Run DeepEval pytest (fast layer)
3. Run RAGAS on golden subset (slow layer — optional on PR, required on main)
4. Compare faithfulness vs baseline — fail if drop > 5%
5. Upload reports as artifacts

Test locally:

```bash
pytest tests/test_llm_eval.py -v
python scripts/run_eval_gate.py --check-regression
```

Wire Langfuse `@observe` on eval runner; verify traces appear in dashboard.

### Step 6 — Deliverable

- [ ] `.github/workflows/eval-gate.yml` in eval-pipeline-studio repo
- [ ] `scripts/run_eval_gate.py` — regression check script
- [ ] Langfuse dashboard shows ≥1 eval run with faithfulness score
- [ ] Document what happens when gate fails (PR blocked message)

### Step 7 — Close out (~15 min)

- [ ] Mark Day 5 in [progress.md](../progress.md)

---

## Done when

- [ ] CI eval gate workflow exists and passes locally
- [ ] Langfuse dashboard configured
- [ ] Day 5 row checked in `progress.md`

---

## Tomorrow

**→ [Day 6 — Red Team + Agent Eval + Build](day-06.md)** — start with [red-teaming-security-eval.md](../theory/red-teaming-security-eval.md)
