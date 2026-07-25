# Week 6 Portfolio — Showcase

> Week 6 · [Resume Bullets](resume-bullets.md) · [LinkedIn Notes](linkedin-notes.md)

Use this template for GitHub README, portfolio site, or interview walkthrough.

---

## Eval Pipeline Studio

**One-liner:** Layered LLM evaluation pipeline (RAGAS + DeepEval + Promptfoo) with GitHub Actions CI gate blocking >5% faithfulness regression and Langfuse dashboard for latency, cost, and drift.

### Problem

RAG chatbot from Weeks 3–5 had no automated quality gate — prompt changes could ship silent hallucinations.

### Solution

Built **Eval Pipeline Studio**:

- **L1:** DeepEval pytest on 10 golden samples every PR (~90s)
- **L2:** Promptfoo regression on prompt diffs
- **L3:** Full RAGAS on 32-sample golden set on merge to main
- **CI gate:** Blocks when faithfulness < baseline − 5%
- **Observability:** Langfuse traces + faithfulness scores; 2% online sample
- **Security:** Promptfoo red team (12 attack scenarios weekly)

### Architecture diagram

Link to your repo diagram or use [project/architecture.md](../project/architecture.md) Mermaid export.

### Results (fill with your numbers)

| Metric | Before | After |
|--------|--------|-------|
| Faithfulness (golden) | — | 0.79 |
| CI eval time (PR) | — | 2.5 min |
| Regressions caught pre-merge | 0 | 2 (document in notes) |
| Red team pass rate | — | 10/12 |

### Demo script (3 min)

1. Show Langfuse dashboard — faithfulness trend
2. Open PR that breaks prompt → CI fails with artifact link
3. Revert → CI green
4. Show `full_eval_report.json` layers

### Artifacts to link

- GitHub repo (work path)
- Screenshot: Langfuse eval trace
- Screenshot: failed CI gate (intentional demo)
- `reports/full_eval_report.json` (sanitized)

### Skills demonstrated

- RAGAS, DeepEval, Promptfoo
- LLM-as-judge calibration
- GitHub Actions CI/CD
- OpenTelemetry + Langfuse
- Red teaming / security eval
- Agent trajectory evaluation

---

**Optional:** Record 2-min Loom walking through dashboard + CI fail demo.
