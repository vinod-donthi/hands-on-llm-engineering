# Week 6 — Daily Playbooks

> **Start here:** [Day 1](day-01.md) · [← Week README](../README.md) · [Progress](../progress.md)

**Prerequisite:** [Week 5 exit criteria](../../week-05/checkpoints/exit-criteria.md) passed. Week 3 golden dataset recommended.

Each day is a **numbered playbook**. Follow steps in order — do not read all theory upfront.

**Work dir:** `Learning/week-06-work/` or `~/ai-learning/week-06-work/`

---

## Week at a glance

| Day | Playbook | Theory (in order) | Lab / build | Deliverable(s) |
|-----|----------|-------------------|-------------|----------------|
| **1** | [day-01.md](day-01.md) | why-eval-matters | [Lab 1](../labs/lab-01-ragas-baseline.md) | `ragas_baseline_report.json` |
| **2** | [day-02.md](day-02.md) | ragas-metrics → deepeval-pytest | [Lab 2](../labs/lab-02-deepeval-tests.md) | `tests/test_llm_eval.py` green |
| **3** | [day-03.md](day-03.md) | promptfoo-regression → layered-eval-pipeline | [Lab 3](../labs/lab-03-promptfoo-regression.md) | `promptfoo_results.json` |
| **4** | [day-04.md](day-04.md) | llm-as-judge-calibration → golden-datasets-trace-regression | [Lab 4](../labs/lab-04-llm-judge-calibration.md) | `judge_calibration_report.json` |
| **5** | [day-05.md](day-05.md) | ci-cd-eval-gates → observability-eval-dashboards | [Lab 5](../labs/lab-05-ci-eval-gate.md) | `.github/workflows/eval-gate.yml` |
| **6** | [day-06.md](day-06.md) | red-teaming-security-eval → agent-trajectory-eval · project specs | Build Eval Pipeline Studio core | Red team + agent reports |
| **7** | [day-07.md](day-07.md) | eval-pipeline-spec | Capstone + validation | Dashboard + full CI green |

---

## How to use each day

1. Open **only** that day's playbook (`day-XX.md`).
2. Complete steps **1 → N** in order.
3. Stop when **Done when** checkboxes are satisfied.
4. Update [progress.md](../progress.md).
5. Open the **Tomorrow** link.

**Catch-up mode:** lab/build steps + deliverables only; skim theory Concepts + takeaway.

---

## Where else to look

| Resource | Use when |
|----------|----------|
| [theory/README.md](../theory/README.md) | Map by day — not a reading list |
| [roadmap.md](../roadmap.md) | Eval stack, time budget, outcomes |
| [resources/glossary.md](../resources/glossary.md) | Unknown term |
| [Week 3 RAGAS](../../week-03/theory/rag-evaluation-ragas.md) | RAG eval refresher |
| [Week 5 observability](../../week-05/theory/observability.md) | OTel + Langfuse primer |
