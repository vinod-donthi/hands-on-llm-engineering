# Week 5 Quiz

> [← README](../README.md) · [Exit Criteria](exit-criteria.md)

**Passing score:** 12/15 (80%)

Answer from [theory/](../theory/) and labs — no peeking during first attempt.

---

## Section A — FastAPI & Docker (5 questions)

**1.** What is the purpose of a FastAPI lifespan context manager?

<details>
<summary>Answer</summary>
Manage startup/shutdown resources (connection pools) cleanly — create on startup, close on shutdown.
</details>

**2.** Why should `/ready` check Redis but `/health` typically should not?

<details>
<summary>Answer</summary>
`/health` is liveness (process alive); `/ready` is readiness (can serve traffic). Redis blips should drain traffic, not kill the pod.
</details>

**3.** Inside Docker Compose, what hostname does the API use to reach Redis?

<details>
<summary>Answer</summary>
The service name `redis`, not `localhost`.
</details>

**4.** What does `depends_on: condition: service_healthy` prevent?

<details>
<summary>Answer</summary>
API starting before Redis accepts connections — avoids race on first requests.
</details>

**5.** Name two items that belong in structured JSON logs for a RAG request.

<details>
<summary>Answer</summary>
Any two: `request_id`, `latency_ms`, `cache_hit`, `cost_usd`, `user_id`, `event`.
</details>

---

## Section B — Redis & Caching (5 questions)

**6.** Exact cache miss — user asks the same question with different capitalization. Hit or miss?

<details>
<summary>Answer</summary>
Hit if normalized (lowercase/strip) before hashing; miss if raw string hashed.
</details>

**7.** Typical cosine similarity range for FAQ paraphrases?

<details>
<summary>Answer</summary>
Often 0.90–0.97; threshold commonly 0.92.
</details>

**8.** Why set TTL on cache entries?

<details>
<summary>Answer</summary>
Prevent stale answers after docs/policy change; control Redis memory.
</details>

**9.** HTTP status for rate limit exceeded?

<details>
<summary>Answer</summary>
429 Too Many Requests with Retry-After header.
</details>

**10.** Cache lookup order in Week 5?

<details>
<summary>Answer</summary>
Semantic → exact → full RAG pipeline.
</details>

---

## Section C — Queues & Observability (5 questions)

**11.** Why return 202 instead of blocking on long RAG?

<details>
<summary>Answer</summary>
HTTP timeouts; decouple acceptance from processing; client polls job status.
</details>

**12.** What makes a background job idempotent?

<details>
<summary>Answer</summary>
Checking if result already exists before re-running LLM; same job_id produces same outcome without double cost.
</details>

**13.** Name three spans in a RAG Langfuse trace.

<details>
<summary>Answer</summary>
Any three: rag_answer, embed_query, qdrant_search, llm_generate, cache_lookup.
</details>

**14.** What is backpressure?

<details>
<summary>Answer</summary>
Reject or delay new work when system saturated (queue depth, rate limits) instead of unbounded backlog.
</details>

**15.** ARQ uses which broker in Week 5?

<details>
<summary>Answer</summary>
Redis.
</details>

---

## Score

| Correct | Result |
|---------|--------|
| 12–15 | Pass — proceed |
| 9–11 | Review weak sections, retake |
| ≤ 8 | Re-read theory + redo labs |

Record score in [progress.md](../progress.md).
