# Week 6 — Evaluation + Monitoring

**8-Week AI Engineering Curriculum · Part 6 of 8**

> **Prerequisite:** Week 5 exit criteria passed · [Week 5 README](../week-05/README.md)  
> **New here?** [START-HERE.md](START-HERE.md) → [Day 1 playbook](daily/day-01.md)

---

## 1. Overview

Week 6 teaches **how to know your LLM system actually works** — not by gut feel, but with a **layered evaluation pipeline** wired into CI. You will combine **RAGAS** (RAG metrics), **DeepEval** (pytest-native LLM tests), and **Promptfoo** (prompt regression + red teaming), calibrate **LLM-as-judge**, build **golden datasets** with trace regression, gate deploys in **GitHub Actions**, and connect **Langfuse** (or LangSmith) + **OpenTelemetry** to an eval dashboard.

**Builds on:** Week 3 RAGAS + golden sets ([Week 3](../week-03/theory/rag-evaluation-ragas.md)), Week 4 agents ([Week 4](../week-04/README.md)), Week 5 observability ([Week 5](../week-05/theory/observability.md)).

**Capstone:** **Eval Pipeline Studio** — CI gate that blocks regressions > 5% on your golden set, plus a dashboard for latency, cost, and faithfulness drift.

---

## 2. Learning Path vs Work Path

| | Learning path | Work path |
|---|---|---|
| **Purpose** | Read curriculum | Write code, run labs, build project |
| **Location** | This repo — `Learning/week-06/` | `Learning/week-06-work/` **or** `~/ai-learning/week-06-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, lab scripts, `eval-pipeline-studio/`, `.env` |
| **Git** | Curriculum (no secrets, no venv) | Your code repo (optional) |

### Study flow

```
1. Open today's playbook       → daily/day-XX.md     (numbered steps — your driver)
2. Read theory in step order   → only files linked from that day
3. Code in work directory      → week-06-work/ or ~/ai-learning/week-06-work/
4. Confirm deliverable         → Done when checkboxes on daily page
5. Update progress.md          → tick the day
6. Follow Tomorrow link        → next daily/day-XX.md
```

**Week map:** [daily/README.md](daily/README.md) · **When short on time:** catch-up mode on each daily page (lab + deliverable first). See [roadmap.md](roadmap.md).

---

## 3. Weekly Outcomes

- [ ] Explain why eval is the #1 production readiness signal for LLM systems
- [ ] Run RAGAS baseline on a golden dataset (≥30 pairs Week 6 minimum)
- [ ] Write DeepEval pytest cases with pass/fail thresholds
- [ ] Configure Promptfoo for prompt regression and model comparison
- [ ] Calibrate LLM-as-judge (pointwise vs pairwise, bias checks)
- [ ] Implement trace regression testing against stored golden traces
- [ ] Wire eval pipeline into GitHub Actions CI gate (block > 5% regression)
- [ ] Export Langfuse traces + OTel spans for eval dashboard
- [ ] Run Promptfoo red-team suite for injection and PII leakage
- [ ] Evaluate agent trajectories (tool correctness, task completion)
- [ ] Complete Labs 1–5 (Lab 6 optional if behind)
- [ ] Ship **Eval Pipeline Studio** with dashboard + CI gate
- [ ] Quiz ≥ 80% · Coding assignment ≥ 70%

Full checklist: [checkpoints/exit-criteria.md](checkpoints/exit-criteria.md)

---

## 4. Folder Map

| Folder | Purpose |
|--------|---------|
| [START-HERE.md](START-HERE.md) | One-time orientation → Day 1 |
| [daily/](daily/) | **Numbered playbooks** — one file per day |
| [theory/](theory/) | Deep dives — one topic per file |
| [labs/](labs/) | Hands-on exercises |
| [project/](project/) | Eval Pipeline Studio spec |
| [interview/](interview/) | Questions + cheat sheet |
| [checkpoints/](checkpoints/) | Quiz, exit criteria, progress |
| [resources/](resources/) | Reading, glossary, references |
| [appendix/](../appendix/) | **Optional** deep dives — never blocks week progress |
| [portfolio/](portfolio/) | Resume, LinkedIn, showcase |
| [requirements.txt](requirements.txt) | Python deps (copied to work path) |
| [scripts/setup-work.sh](scripts/setup-work.sh) | Bootstrap work directory |

---

## 5. Setup

### One-time: bootstrap work directory

```bash
cd week-06
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Creates `~/ai-learning/week-06-work/`, copies `requirements.txt` and `.env.example`, creates `.venv`, installs deps.

Custom work location:

```bash
./scripts/setup-work.sh ~/projects/my-week-06
# or
WORK_DIR=~/projects/my-week-06 ./scripts/setup-work.sh
```

### Migrate from Week 3/5 (recommended)

Reuse your RAG service and golden dataset from Doc Q&A Studio or Week 5 hardened service:

```bash
cp -r ~/ai-learning/week-03-work/doc-qa-studio/eval/golden_dataset.json \
      ~/ai-learning/week-06-work/eval/ 2>/dev/null || true
cp -r ~/ai-learning/week-05-work/rag-service/backend/app \
      ~/ai-learning/week-06-work/eval-pipeline-studio/backend/app/ 2>/dev/null || true
```

### Every session

```bash
cd ~/ai-learning/week-06-work
source .venv/bin/activate
```

### API keys (`.env`)

| Key | Required | Use |
|-----|----------|-----|
| `OPENAI_API_KEY` | Yes | RAGAS, DeepEval, judge LLM, Promptfoo |
| `LANGFUSE_PUBLIC_KEY` / `LANGFUSE_SECRET_KEY` | Yes | Trace export + eval dashboard |
| `LANGFUSE_HOST` | Optional | Self-hosted Langfuse URL |
| `GITHUB_TOKEN` | Optional | CI workflow dry-run locally with act |

**Estimated cloud spend:** $8–15 for the full week (judge calls + red team runs).

### Node (Promptfoo)

```bash
npm install -g promptfoo@latest   # or npx promptfoo
```

---

## 6. Navigation

### Theory

Full index: [theory/README.md](theory/README.md)

[Why Eval Matters](theory/why-eval-matters.md) · [RAGAS Metrics](theory/ragas-metrics.md) · [DeepEval + pytest](theory/deepeval-pytest.md) · [Promptfoo Regression](theory/promptfoo-regression.md) · [Layered Eval Pipeline](theory/layered-eval-pipeline.md) · [LLM-as-Judge](theory/llm-as-judge-calibration.md) · [Golden Datasets & Trace Regression](theory/golden-datasets-trace-regression.md) · [CI/CD Eval Gates](theory/ci-cd-eval-gates.md) · [Observability Dashboards](theory/observability-eval-dashboards.md) · [Red Teaming](theory/red-teaming-security-eval.md) · [Agent Trajectory Eval](theory/agent-trajectory-eval.md)

### Labs

[Overview](labs/README.md) · [Lab 1](labs/lab-01-ragas-baseline.md) · [Lab 2](labs/lab-02-deepeval-tests.md) · [Lab 3](labs/lab-03-promptfoo-regression.md) · [Lab 4](labs/lab-04-llm-judge-calibration.md) · [Lab 5](labs/lab-05-ci-eval-gate.md) · [Lab 6](labs/lab-06-observability-traces.md) *(optional)*

### Project

[Overview](project/overview.md) · [Architecture](project/architecture.md) · [Backend](project/backend.md) · [Frontend](project/frontend.md) · [API](project/api.md) · [Eval Pipeline Spec](project/eval-pipeline-spec.md) · [CI Spec](project/ci-spec.md) · [Acceptance Criteria](project/acceptance-criteria.md)

### Interview & Validation

[Concepts](interview/concepts.md) · [System Design](interview/system-design.md) · [Coding](interview/coding.md) · [Cheat Sheet](interview/cheat-sheet.md) · [Quiz](checkpoints/quiz.md) · [Exit Criteria](checkpoints/exit-criteria.md)

---

## 7. Daily Checklist

| Day | Must Complete | Optional |
|-----|---------------|----------|
| 1 | Lab 1, why eval + offline/online theory | Extra RAGAS metric reading |
| 2 | Lab 2, DeepEval pytest suite | Custom metric plugins |
| 3 | Lab 3, Promptfoo config + regression | Model comparison matrix |
| 4 | Lab 4, judge calibration report | Pairwise tournament |
| 5 | Lab 5, GitHub Actions eval gate | act local CI dry-run |
| 6 | Red team + agent trajectory, project core | Lab 6 LangSmith swap |
| 7 | Capstone dashboard + validation | Portfolio docs |

Details: [daily/](daily/)

---

## 8. Progress Tracker

```bash
cp progress.md ~/ai-learning/week-06-work/
```

---

## 9. Week Completion Criteria

| Gate | Requirement |
|------|-------------|
| **Knowledge** | Quiz ≥ 12/15 |
| **Build** | All [acceptance criteria](project/acceptance-criteria.md) checked |
| **Layered eval** | RAGAS + DeepEval + Promptfoo all run in one pipeline |
| **CI gate** | GitHub Actions fails when faithfulness drops > 5% vs baseline |
| **Dashboard** | Eval dashboard shows latency, cost, faithfulness trend |
| **Security** | Promptfoo red-team report with ≥10 attack scenarios |
| **Checkpoint** | ≥ 4/5 interview self-assessment parts at hire-ready |

Proceed to Week 7 (Advanced Topics) only when all gates pass. See [checkpoints/progress-tracker.md](checkpoints/progress-tracker.md).
