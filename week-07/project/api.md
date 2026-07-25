# Advanced AI Studio — API

> Week 7 Project · [← Backend](backend.md) · [Acceptance Criteria](acceptance-criteria.md)

Base URL: `http://localhost:8000`

## Common

### `GET /health`

```json
{"status": "ok", "track": "B", "version": "0.1.0"}
```

### `GET /ready`

```json
{"status": "ready", "qdrant": "ok", "redis": "ok"}
```

---

## Track A — Fine-tuned assistant

### `POST /api/v1/chat`

**Request:**

```json
{
  "message": "Ticket: user charged twice for Pro plan",
  "task_type": "triage",
  "use_finetuned": true
}
```

**Response:**

```json
{
  "reply": "Category: billing. Draft: Hi — I see a duplicate charge...",
  "model": "ft:gpt-4o-mini-2024-07-18:org:advanced-studio-v1:abc",
  "fallback_used": false,
  "latency_ms": 940,
  "cost_usd": 0.0008
}
```

---

## Track B — Agentic RAG

### `POST /api/v1/agent/query`

**Request:**

```json
{
  "question": "Does EU retention match US SOC2 backup window?",
  "max_steps": 3
}
```

**Response:** See [track-b-agentic-rag.md](track-b-agentic-rag.md) sample.

### `POST /api/v1/rag/classic`

Single-shot RAG for A/B — same request shape, no agent loop.

---

## Errors

| Code | Meaning |
|------|---------|
| 429 | Rate limit / cost cap |
| 502 | Upstream model error |
| 503 | Qdrant or Redis unavailable |

[← Backend](backend.md)
