# Production AI Stack — API

> Week 5 Project · [← Backend](backend.md) · [Docker](docker.md)

Base URL: `http://localhost:8000` (local Compose)

## Health

### `GET /health`

Liveness — process alive.

**Response 200:**

```json
{"status": "ok", "version": "1.0.0"}
```

### `GET /ready`

Readiness — dependencies OK.

**Response 200:**

```json
{
  "ready": true,
  "checks": {
    "redis": "ok",
    "qdrant": "ok"
  }
}
```

**Response 503** when Redis unreachable:

```json
{
  "ready": false,
  "checks": {"redis": "connection refused"}
}
```

---

## RAG (sync)

### `POST /api/v1/rag/query`

**Request:**

```json
{
  "query": "What is our refund policy?",
  "session_id": "sess_optional",
  "user_id": "user_123"
}
```

**Response 200:**

```json
{
  "answer": "Annual plans may be refunded within 30 days...",
  "citations": [{"doc_id": "policy-v2", "chunk_id": "c_42"}],
  "cache_hit": false,
  "cache_type": null,
  "latency_ms": 842,
  "cost_usd": 0.0031,
  "request_id": "a1b2c3d4"
}
```

**Semantic cache hit:**

```json
{
  "answer": "...",
  "cache_hit": true,
  "cache_type": "semantic",
  "similarity_score": 0.945,
  "llm_called": false,
  "cost_usd": 0.00002
}
```

**Response 429** — rate limited:

```json
{"detail": "Rate limit exceeded"}
```

Headers: `Retry-After: 60`, `X-Request-ID: ...`

**Response 402** — cost cap:

```json
{"detail": "Request exceeds cost cap"}
```

---

## Jobs (async)

### `POST /api/v1/jobs/rag`

**Request:** same body as sync query

**Response 202:**

```json
{
  "job_id": "job_a1b2c3d4",
  "status": "queued",
  "poll_url": "/api/v1/jobs/job_a1b2c3d4"
}
```

**Response 503** — queue depth exceeded (backpressure):

```json
{"detail": "System busy", "retry_after_seconds": 30}
```

### `GET /api/v1/jobs/{job_id}`

**Response 200 (running):**

```json
{
  "job_id": "job_a1b2c3d4",
  "status": "running",
  "result": null
}
```

**Response 200 (completed):**

```json
{
  "job_id": "job_a1b2c3d4",
  "status": "completed",
  "result": {
    "answer": "...",
    "citations": [],
    "cost_usd": 0.004
  }
}
```

---

## Headers

| Header | Direction | Purpose |
|--------|-----------|---------|
| `X-Request-ID` | Response (optional request) | Trace correlation |
| `X-API-Key` | Request | Rate limit key |
| `Retry-After` | Response on 429/503 | Client backoff |

## Next

[Docker Compose](docker.md) · [Acceptance criteria](acceptance-criteria.md)
