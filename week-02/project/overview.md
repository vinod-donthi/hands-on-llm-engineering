# Model Benchmark Studio — Overview

> Week 2 Project · [← README](../README.md) · [Architecture](architecture.md)

> **Work dir:** `~/ai-learning/week-02-work/model-benchmark-studio/`

Evolution of Week 1 **Prompt Playground Lite** into a multi-provider **Model Benchmark Studio** — the week's capstone deliverable per [prompt.md](../../prompt.md).

## Week 1 → Week 2

| Feature | Week 1 (Lite) | Week 2 (Studio) |
|---------|---------------|-----------------|
| Providers | OpenAI + Ollama | + Anthropic |
| Model config | Hardcoded dict | YAML registry |
| Streaming | — | SSE `/api/v1/stream` |
| Function calling | — | Tool router |
| Context / cost | Basic tokens | Budget middleware + caps |
| Guardrails | Minimal | Input/output rules |
| History | — | PostgreSQL |
| Deployment | Local uvicorn | Docker Compose |
| Benchmark | Manual capstone | Automated CLI suite |

## Project Docs

| Doc | Content |
|-----|---------|
| [architecture.md](architecture.md) | Diagram, folder structure |
| [backend.md](backend.md) | Providers, services, tests |
| [frontend.md](frontend.md) | Stream UI, history panel |
| [api.md](api.md) | Endpoints |
| [docker.md](docker.md) | Compose, Postgres, env |
| [benchmarking-spec.md](benchmarking-spec.md) | Capstone benchmark format |
| [acceptance-criteria.md](acceptance-criteria.md) | Ship checklist |

## Capstone

5 benchmark prompts × ≥ 3 models → `benchmark_report.json` + `benchmark_summary.md` → [portfolio](../portfolio/week-02-showcase.md)

## Local Run

```bash
ollama serve && ollama pull llama3.1:8b
cd model-benchmark-studio
docker compose up -d          # Day 6+
cd backend && uvicorn app.main:app --reload --port 8000
cd frontend && npm run dev
```
