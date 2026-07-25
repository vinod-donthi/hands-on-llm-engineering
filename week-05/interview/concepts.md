# Week 5 Interview — Concepts

> [← README](../README.md) · [System Design](system-design.md) · [Cheat Sheet](cheat-sheet.md)

## Core concepts (be able to explain in 2 minutes each)

### 1. FastAPI production readiness

**Q:** What is the difference between `/health` and `/ready`?

**A:** `/health` means the process is alive — use for restart decisions. `/ready` means dependencies (Redis, vector DB) are reachable — use for load balancer traffic routing during deploys.

---

### 2. Docker Compose in AI stacks

**Q:** Why multi-container instead of one fat container?

**A:** Scale API and workers independently; Redis persists cache across API restarts; matches production topology (Container Apps / K8s) with one `docker compose up`.

---

### 3. Redis on the hot path

**Q:** Three uses of Redis in a RAG service?

**A:** (1) Exact response cache, (2) rate limiting counters, (3) ARQ job broker + job status. Optional fourth: semantic vector index at lab scale.

---

### 4. Semantic caching

**Q:** How do you prevent wrong answers from semantic cache?

**A:** High similarity threshold (0.92+), domain/category scoping, log near-misses for tuning, invalidate on document updates, never cache high-risk agent actions.

---

### 5. Background queues

**Q:** Why ARQ/Celery for AI workloads?

**A:** LLM + retrieval can exceed HTTP timeouts; queue decouples acceptance latency from processing duration; workers retry transient 503s with idempotency keys.

---

### 6. Observability

**Q:** What spans belong in a RAG trace?

**A:** Root `rag_answer`, children: `embed_query`, `cache_lookup`, `vector_search`, `llm_generate` — each with duration, token usage, and cost metadata.

---

### 7. Cost control

**Q:** Layers of LLM cost control?

**A:** Semantic + exact cache, model routing (cheap default), per-request estimate cap, per-user daily budget, backpressure when queue saturated.

---

### 8. Backpressure

**Q:** What happens when queue depth exceeds limit?

**A:** API returns 503 with `Retry-After` instead of accepting jobs that will timeout — protects Redis, workers, and OpenAI quota.

---

## Rapid fire

| Term | One-line definition |
|------|---------------------|
| **Liveness probe** | Is the container running? |
| **Readiness probe** | Can it serve traffic? |
| **Token bucket** | Rate limit allowing bursts |
| **Cosine similarity** | Angle between embedding vectors |
| **Idempotent job** | Safe to retry without duplicate side effects |
| **OTEL span** | One timed operation in a trace |
| **Langfuse** | LLM-native trace and eval UI |

## Self-assessment

Rate 1–5 (5 = hire-ready verbal explanation):

- [ ] FastAPI lifespan and probes
- [ ] Compose multi-service topology
- [ ] Redis cache vs semantic cache
- [ ] ARQ async pattern
- [ ] OTEL + Langfuse value prop

**Target:** ≥ 4/5 at level 4+

See [progress-tracker.md](../checkpoints/progress-tracker.md)
