# Eval Pipeline Studio — Overview

> Week 6 Project · [← README](../README.md) · [Architecture](architecture.md)

> **Work dir:** `~/ai-learning/week-06-work/eval-pipeline-studio/`

Week 6 capstone per [prompt.md](../../prompt.md): an **evaluation pipeline wired into CI** with dashboard — the production readiness layer for your RAG or agent service from Weeks 3–5.

## Prior weeks → Week 6

| Feature | Week 3–5 | Week 6 (Eval Pipeline Studio) |
|---------|----------|-------------------------------|
| Core job | Answer questions / serve traffic | Measure and gate quality |
| Quality check | Manual / one-off RAGAS | Layered automated pipeline |
| CI | Unit tests only | Eval gate blocks >5% regression |
| Observability | Traces for debug | Traces + faithfulness scores + dashboard |
| Security | Guardrails | Promptfoo red team suite |
| Agents | Tool calling | Trajectory eval |

## What you build

A service + tooling that:

1. Runs **RAGAS** on golden dataset (30+ pairs)
2. Runs **DeepEval** pytest on every PR
3. Runs **Promptfoo** on prompt/model changes
4. **Gates** merge via GitHub Actions when faithfulness drops > 5%
5. Shows **dashboard**: latency p95, cost/query, faithfulness trend
6. Produces **red team** and **agent trajectory** reports

## Project docs

| Doc | Content |
|-----|---------|
| [architecture.md](architecture.md) | Mermaid diagram, folder structure |
| [backend.md](backend.md) | Eval runner, gate logic, API |
| [frontend.md](frontend.md) | Minimal eval dashboard UI |
| [api.md](api.md) | REST endpoints |
| [eval-pipeline-spec.md](eval-pipeline-spec.md) | Layer orchestration, report schemas |
| [ci-spec.md](ci-spec.md) | GitHub Actions workflows |
| [acceptance-criteria.md](acceptance-criteria.md) | Ship checklist |

## Capstone deliverables

- `eval-pipeline-studio/` running locally (port 8006)
- `.github/workflows/eval-gate.yml` green
- `reports/full_eval_report.json` — all layers
- Langfuse dashboard or `dashboard_snapshot.json`
- `reports/redteam_report.json`

## Local run

```bash
cd ~/ai-learning/week-06-work/eval-pipeline-studio
source ../.venv/bin/activate
cd backend && uvicorn app.main:app --reload --port 8006
```

Trigger eval:

```bash
curl -X POST http://localhost:8006/api/v1/eval/run \
  -H "Content-Type: application/json" \
  -d '{"suite": "fast"}'
```

Full pipeline:

```bash
python scripts/run_full_eval.py --suite full --out ../reports/full_eval_report.json
```

## Portfolio

[week-06-showcase.md](../portfolio/week-06-showcase.md) · [resume-bullets.md](../portfolio/resume-bullets.md)
