# Week 5 Interview Progress Tracker

> [← Exit Criteria](exit-criteria.md) · [Concepts](../interview/concepts.md)

Rate each area **1–5** after Day 7. Target: **≥ 4** on at least **4 of 5**.

| # | Area | 1 | 2 | 3 | 4 | 5 | Notes |
|---|------|---|---|---|---|---|-------|
| 1 | FastAPI production (lifespan, probes, middleware) | | | | | | |
| 2 | Docker Compose multi-service topology | | | | | | |
| 3 | Redis + semantic caching tradeoffs | | | | | | |
| 4 | Background queues + idempotency | | | | | | |
| 5 | Observability + cost/backpressure | | | | | | |

## Hire-ready checklist

- [ ] Whiteboard Production AI Stack in 5 min without notes
- [ ] Explain semantic cache false-positive prevention
- [ ] Walk through incident: p95 latency spike (Langfuse spans)
- [ ] Code rate-limit or cache-key function on whiteboard
- [ ] Describe Compose → Azure Container Apps mapping

## Artifacts to show interviewer

| Artifact | Proves |
|----------|--------|
| `docker compose ps` screenshot | Ops readiness |
| Langfuse trace | LLM observability |
| `cache_report.json` | Cost optimization |
| `load_smoke_results.json` | Performance awareness |

## Week 5 complete when

Exit criteria + quiz + **≥ 4/5** rows at level **≥ 4**.
