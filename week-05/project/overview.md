# Production AI Stack — Overview

> Week 5 Project · [← README](../README.md) · [Architecture](architecture.md)

> **Work dir:** `~/ai-learning/week-05-work/production-ai-stack/`

Week 5 hardens your Week 3 **RAG pipeline** or Week 4 **research agent** into a deployable **Production AI Stack** — the capstone deliverable per [prompt.md](../../prompt.md).

## Week 3/4 → Week 5

| Feature | Week 3/4 (Dev) | Week 5 (Production) |
|---------|----------------|---------------------|
| API | Local uvicorn | Lifespan, middleware, health probes |
| Deployment | Manual | Docker Compose (+ optional Azure) |
| Caching | None | Exact + semantic Redis cache |
| Rate limits | None | Token bucket per client |
| Long jobs | Blocking HTTP | ARQ worker + job status API |
| Observability | Print logs | structlog + Langfuse traces |
| Cost | Uncapped | Per-request + daily budget middleware |
| Load | Untested | Locust smoke test |

## Project Docs

| Doc | Content |
|-----|---------|
| [architecture.md](architecture.md) | Service diagram, folder structure |
| [backend.md](backend.md) | Modules, middleware, services |
| [api.md](api.md) | REST endpoints |
| [docker.md](docker.md) | Compose topology |
| [azure.md](azure.md) | Container Apps deploy *(optional)* |
| [acceptance-criteria.md](acceptance-criteria.md) | Ship checklist |

## Capstone artifacts

| File | Purpose |
|------|---------|
| `cache_report.json` | Semantic cache proof |
| `trace_export.json` | Langfuse trace ID |
| `load_smoke_results.json` | p95 latency under load |
| `deploy_checklist.md` | Ops runbook for demo |

## Local Run

```bash
cd ~/ai-learning/week-05-work/production-ai-stack
docker compose up -d --build
curl -s http://localhost:8000/ready | jq .
curl -s -X POST http://localhost:8000/api/v1/rag/query \
  -H "Content-Type: application/json" \
  -d '{"query": "What is our SLA?"}' | jq .
```

## Portfolio

Document in [week-05-showcase.md](../portfolio/week-05-showcase.md) — architecture diagram, cache hit rate, Langfuse screenshot.
