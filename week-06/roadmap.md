# Week 6 Roadmap

> [← README](README.md) · [Progress Tracker](progress.md)

## Learning Path

**Default:** Follow [daily/day-XX.md](daily/) numbered steps in order (theory → lab → deliverable).

**Catch-up** (behind schedule): On each daily page, do lab/build steps + deliverables only; skim theory Concepts + takeaway.

```
Daily playbook (driver) → theory (linked steps) → lab/build → deliverable → progress.md → Tomorrow link
```

**Rule:** Good enough to continue > perfect completion.

---

## Weekly Outcomes

By end of Week 6 you will:

1. Articulate why eval is the top production readiness signal for LLM apps
2. Distinguish offline eval (golden set, CI) from online eval (production sampling)
3. Run **RAGAS** for RAG faithfulness, context precision/recall, answer relevancy
4. Write **DeepEval** pytest tests with thresholds in CI
5. Configure **Promptfoo** for prompt regression, model comparison, and red teaming
6. Design a **layered eval pipeline** (fast cheap checks → expensive judges)
7. Calibrate **LLM-as-judge** and avoid common judge biases
8. Maintain **golden datasets** and **trace regression** baselines
9. Gate deploys with **GitHub Actions** when metrics regress > 5%
10. Connect **Langfuse** + **OpenTelemetry** to an eval dashboard
11. Evaluate **agent trajectories** (tool correctness, task completion)
12. Ship **Eval Pipeline Studio** — full pipeline wired into CI

---

## Time Budget (Anti-Burnout)

| Constraint | Limit |
|------------|-------|
| Max per day | **5 hours** |
| Max per week | **28 hours** |
| Optional skip | **ONE** lab (recommend Lab 6 if behind) |

### Priority Order (catch-up only)

1. **Today's deliverable** from [daily/](daily/) playbook
2. **Labs / build** steps on that day
3. **Theory** — Concepts + AI engineer takeaway only
4. **Go Deeper** — skip unless interviewing

---

## Eval Stack (Week 6)

| Layer | Tool | When it runs | Typical cost |
|-------|------|--------------|--------------|
| RAG quality | **RAGAS** | Nightly / pre-merge on golden set | $2–5 per 50 samples |
| Unit-style LLM tests | **DeepEval** | Every PR (pytest) | $0.50–2 per run |
| Prompt regression | **Promptfoo** | Every PR (diff on prompts) | $1–3 per run |
| Security | **Promptfoo red team** | Weekly / pre-release | $2–5 per suite |
| Production sampling | **Langfuse scores** | Continuous (1–5% traffic) | Variable |
| Traces | **OpenTelemetry → Langfuse** | Every request in staging | Langfuse free tier |

---

## Core Knowledge Objectives

| # | Objective | Theory |
|---|-----------|--------|
| 1 | Why eval beats "vibes" for ship decisions | [why-eval-matters.md](theory/why-eval-matters.md) |
| 2 | RAGAS metrics deep dive | [ragas-metrics.md](theory/ragas-metrics.md) |
| 3 | DeepEval + pytest in CI | [deepeval-pytest.md](theory/deepeval-pytest.md) |
| 4 | Promptfoo regression + comparison | [promptfoo-regression.md](theory/promptfoo-regression.md) |
| 5 | Layered pipeline architecture | [layered-eval-pipeline.md](theory/layered-eval-pipeline.md) |
| 6 | LLM-as-judge calibration | [llm-as-judge-calibration.md](theory/llm-as-judge-calibration.md) |
| 7 | Golden datasets + trace regression | [golden-datasets-trace-regression.md](theory/golden-datasets-trace-regression.md) |
| 8 | CI/CD eval gates | [ci-cd-eval-gates.md](theory/ci-cd-eval-gates.md) |
| 9 | Langfuse + OTel dashboards | [observability-eval-dashboards.md](theory/observability-eval-dashboards.md) |
| 10 | Red teaming / security eval | [red-teaming-security-eval.md](theory/red-teaming-security-eval.md) |
| 11 | Agent trajectory eval | [agent-trajectory-eval.md](theory/agent-trajectory-eval.md) |

---

## Build Objective

Ship [Eval Pipeline Studio](project/overview.md): layered eval runner, GitHub Actions gate, Langfuse dashboard, red-team report, agent trajectory eval.

---

## Daily Index

| Day | Focus | Hours (max) |
|-----|-------|-------------|
| [Day 1](daily/day-01.md) | Why eval + RAGAS baseline | 4h |
| [Day 2](daily/day-02.md) | DeepEval pytest suite | 4h |
| [Day 3](daily/day-03.md) | Promptfoo + layered pipeline | 4–5h |
| [Day 4](daily/day-04.md) | LLM-as-judge + golden traces | 4–5h |
| [Day 5](daily/day-05.md) | CI/CD gates + observability | 4–5h |
| [Day 6](daily/day-06.md) | Red team + agent eval + build | 4–5h |
| [Day 7](daily/day-07.md) | Capstone dashboard + validation | 4–5h |

---

## Cost Budget

| Category | Spend |
|----------|-------|
| RAGAS + judge (Labs 1, 4) | $3–6 |
| DeepEval pytest runs | $1–3 |
| Promptfoo regression + red team | $2–5 |
| Langfuse | $0 (free tier) |
| **Total** | **$8–15** |
