# Week 5 Roadmap

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

By end of Week 5 you will:

1. Run FastAPI with lifespan hooks, middleware, structured logs, and liveness/readiness probes
2. Boot a multi-service stack with Docker Compose (API, Redis, worker, optional vector DB)
3. Implement Redis exact cache, rate limiting, and session storage
4. Add semantic caching with embedding similarity for paraphrased RAG queries
5. Offload long work to ARQ background workers with retries and dead-letter patterns
6. Export OpenTelemetry traces and correlate LLM calls in Langfuse
7. Apply scaling, cost caps, and backpressure under concurrent load
8. Ship **Production AI Stack** — deployable RAG/agent with observability

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

## Stack Scope (Week 5)

### Required services (Docker Compose)

| Service | Role |
|---------|------|
| **api** | FastAPI — RAG/agent HTTP surface |
| **redis** | Cache, rate limits, ARQ broker |
| **worker** | ARQ consumer — indexing, async RAG |
| **qdrant** *(optional)* | Carry forward Week 3 vector store |

### Required patterns

| Pattern | Where |
|---------|-------|
| `/health` + `/ready` | API lifespan + dependency checks |
| Token bucket rate limit | Redis per API key / user |
| Semantic cache | Redis + embedding cosine similarity |
| Job queue | ARQ with `@cron` index refresh |
| Tracing | OpenTelemetry → Langfuse |
| Cost cap | Middleware rejects over-budget requests |

### Optional depth

| Topic | When |
|-------|------|
| Azure Container Apps | Day 7 deploy path |
| Kubernetes HPA | [azure-deployment.md](theory/azure-deployment.md) — not exit criteria |
| Celery instead of ARQ | Document tradeoff only |

---

## Core Knowledge Objectives

| # | Objective | Theory |
|---|-----------|--------|
| 1 | FastAPI production patterns | [fastapi-production.md](theory/fastapi-production.md) |
| 2 | Multi-service Docker Compose | [docker-compose.md](theory/docker-compose.md) |
| 3 | Redis caching, rate limits, sessions | [redis-patterns.md](theory/redis-patterns.md) |
| 4 | Semantic caching with embeddings | [semantic-caching.md](theory/semantic-caching.md) |
| 5 | Background queues (ARQ) | [background-queues.md](theory/background-queues.md) |
| 6 | OpenTelemetry + Langfuse | [observability.md](theory/observability.md) |
| 7 | Scaling, cost, backpressure | [scaling-cost-backpressure.md](theory/scaling-cost-backpressure.md) |
| 8 | Azure Container Apps path | [azure-deployment.md](theory/azure-deployment.md) |

---

## Build Objective

Harden Week 3/4 RAG or agent into [Production AI Stack](project/overview.md): Compose stack, Redis layers, semantic cache, workers, traces, and deploy checklist.

---

## Daily Index

| Day | Focus | Hours (max) |
|-----|-------|-------------|
| [Day 1](daily/day-01.md) | FastAPI production patterns | 4h |
| [Day 2](daily/day-02.md) | Docker Compose multi-service | 4–5h |
| [Day 3](daily/day-03.md) | Redis cache, rate limits, sessions | 4h |
| [Day 4](daily/day-04.md) | Semantic caching | 4–5h |
| [Day 5](daily/day-05.md) | Background queues (ARQ) | 4–5h |
| [Day 6](daily/day-06.md) | OpenTelemetry + Langfuse | 4h |
| [Day 7](daily/day-07.md) | Scaling, deploy capstone | 4–5h |

---

## Cost Budget

| Category | Spend |
|----------|-------|
| OpenAI (embeddings + RAG smoke tests) | $3–8 |
| Langfuse | $0 (free tier) |
| Docker / Redis (local) | $0 |
| Azure Container Apps *(optional)* | $0–5 if you tear down same day |
| **Total** | **$5–15** |
