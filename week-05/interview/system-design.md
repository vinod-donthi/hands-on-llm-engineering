# Week 5 Interview — System Design

> [← Concepts](concepts.md) · [Coding](coding.md)

## Prompt 1: Design a production RAG API

**Interviewer:** "Design a RAG service handling 100 req/s with cost controls."

### Strong answer outline

1. **Requirements clarify:** sync vs async, SLA (p95 latency), budget, multi-tenant?
2. **API layer:** Stateless FastAPI behind load balancer; `/health` + `/ready`
3. **Cache layer:** Redis semantic + exact cache; report hit rate
4. **RAG path:** Embed → vector DB → rerank → LLM; Langfuse trace each step
5. **Async path:** Long queries → ARQ worker + poll/webhook
6. **Rate limits:** Token bucket per API key in Redis
7. **Cost:** Per-request cap middleware; daily budget per tenant
8. **Scale:** Horizontal API replicas; separate worker pool; managed Redis
9. **Failure:** Backpressure 503; circuit breaker on OpenAI 429; degrade to cache-only mode optional

### Diagram to draw

```
Client → LB → API (N) → Redis → Qdrant
                ↓ enqueue
              Worker (M) → OpenAI
                ↓
            Langfuse
```

---

## Prompt 2: Semantic cache deep dive

**Q:** "40% of queries are FAQ paraphrases. How do you cut cost?"

**A:**

- Embed queries with small embedding model
- Store (vector, answer, doc_version) in Redis vector index
- Threshold 0.92; monitor false positive rate in Langfuse scores
- Invalidate cache on doc publish event
- Break-even: if embed cost + hit savings > pure LLM, ship it

---

## Prompt 3: Incident — latency spike

**Symptoms:** p95 went from 800ms to 12s after launch.

**Debug path:**

1. Langfuse: which span grew? (often retrieval or cold vector index)
2. Redis: memory/eviction killing cache?
3. Worker queue depth: backlog causing sync fallback?
4. OpenAI rate limits: 429 retries without backoff?

---

## Prompt 4: Deploy without downtime

**A:** Rolling deploy with readiness probes; new pods pass `/ready` before receiving traffic; lifespan drain on SIGTERM; feature flag for semantic cache threshold changes.

---

## Tradeoff questions

| Question | Key tradeoff |
|----------|--------------|
| Sync vs async RAG? | UX simplicity vs timeout risk |
| Container Apps vs AKS? | Ops speed vs control |
| Exact vs semantic first? | Embed cost vs paraphrase hits |
| Scale API vs worker? | HTTP concurrency vs job throughput |

## Practice exercise

Whiteboard **Production AI Stack** from [architecture.md](../project/architecture.md) in 5 minutes — label cache, queue, and observability paths.
