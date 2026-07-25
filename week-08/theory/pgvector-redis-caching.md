# pgvector + Redis Semantic Cache

> Week 8 Theory · Day 2 & 5 · [← ingestion-scheduling](ingestion-scheduling.md) · Next: [langgraph-orchestration](langgraph-orchestration.md)

Two storage systems serve different jobs: **pgvector** remembers your corpus for retrieval; **Redis** remembers recent answers so you do not re-run the expensive agent for similar questions.

---

## What problem are we solving?

Keyword search misses paraphrases ("new GPT model" vs "latest OpenAI release"). Pure vector search misses exact product names. **Hybrid retrieval** combines both. Separately, dashboard users ask similar questions — **semantic cache** cuts cost and latency.

### Worked scenario

Document chunk: *"OpenAI released GPT-4.1 Mini on July 24."* User asks *"What did OpenAI launch this week?"* Vector search retrieves the chunk; BM25 alone might miss if "launch" is not in text.

Second user asks *"OpenAI releases this week?"* — embedding similarity to cached query is 0.94 → return cached answer in 180ms instead of 4s agent run.

---

## Concepts

### pgvector in Postgres

Store embedding as `vector(1536)` on `chunks` table (text-embedding-3-small).

**Hybrid query pattern:**

1. Vector: top 20 by cosine distance
2. Keyword: `ts_rank` or BM25 on title/body
3. Reciprocal rank fusion (RRF) merge → top 8 to agent

### Redis semantic cache

| Step | Action |
|------|--------|
| 1 | Embed user query |
| 2 | Scan cached entries (or Redis vector module) for cosine ≥ 0.92 |
| 3 | Hit → return stored JSON response |
| 4 | Miss → run agent → store `{embedding, response}` TTL 3600s |

**Not** exact string match — "benchmark results" ≈ "latest AI benchmarks."

### When to cache

| Cache? | Reason |
|--------|--------|
| Yes | Dashboard repeat queries, digest section previews |
| No | User asks for "last 5 minutes" breaking news |
| Bypass flag | `?no_cache=true` for debugging |

---

## Tradeoffs

| Store | Strength | Weakness |
|-------|----------|----------|
| pgvector | Durable corpus, SQL filters | Slower than dedicated vector DB at huge scale |
| Redis | Sub-ms reads | Ephemeral — OK for answers not source of truth |

---

## Best practices

- Index: `CREATE INDEX ON chunks USING ivfflat (embedding vector_cosine_ops)`
- Cache key includes `model_version` — invalidate on prompt change
- Log `cache_hit` for cost dashboards

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Threshold 0.99 — never hits | Start 0.90–0.92, tune with Lab 5 |
| Cache stale breaking news | Short TTL or skip cache for time-sensitive queries |
| Storing corpus only in Redis | Postgres is source of truth |

---

## Checkpoint

1. Why hybrid retrieval vs vector-only?
2. What similarity threshold means practically?
3. Where do chunks vs full documents live?
4. How does cache reduce cost? (See [cost-estimates](../project/cost-estimates.md))
5. What invalidates semantic cache entries?

---

## Go deeper

| Resource | Why |
|----------|-----|
| [pgvector GitHub](https://github.com/pgvector/pgvector) | Index tuning |
| [Week 3 RAG patterns](../../week-03/) | Retrieval foundation |
| [Lab 2](../labs/lab-02-pgvector-retrieval.md) | Hands-on |

---

## Next

[langgraph-orchestration.md](langgraph-orchestration.md) → [Day 3 playbook](../daily/day-03.md)
