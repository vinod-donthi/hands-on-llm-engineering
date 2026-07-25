# AI Radar — API Reference

> Week 8 Capstone · [Backend](backend.md) · [Architecture](architecture.md)

Base URL: `http://localhost:8000` (local) · Prefix: `/api/v1`

---

## Health

### `GET /api/v1/health`

**Response 200:**

```json
{
  "status": "ok",
  "db": "ok",
  "redis": "ok",
  "version": "1.0.0"
}
```

---

## Feed

### `GET /api/v1/feed`

| Query param | Type | Default | Description |
|-------------|------|---------|-------------|
| `limit` | int | 20 | Max items |
| `category` | string | — | Filter: `model`, `tool`, `paper`, `funding`, `github` |
| `since` | ISO date | — | Items after date |

**Response 200:**

```json
{
  "items": [
    {
      "id": "doc_01HQ...",
      "title": "GPT-4.1 Mini announced",
      "url": "https://openai.com/...",
      "source": "openai_rss",
      "category": "model",
      "published_at": "2026-07-24T14:00:00Z",
      "summary": "OpenAI released..."
    }
  ],
  "total": 142
}
```

---

## Trends

### `GET /api/v1/trends`

**Response 200:**

```json
{
  "period": "7d",
  "tags": [
    {"name": "rag", "count": 28, "delta_pct": 12.5},
    {"name": "mcp", "count": 19, "delta_pct": 40.0}
  ]
}
```

---

## Agent query

### `POST /api/v1/radar/query`

**Request:**

```json
{
  "query": "What AI benchmarks were published this week?",
  "mode": "agentic"
}
```

| Field | Values | Description |
|-------|--------|-------------|
| `mode` | `agentic` (default), `rag_only` | Skip MCP tools if `rag_only` |

**Response 200:**

```json
{
  "answer": "Three benchmarks stood out: ...",
  "citations": [
    {"title": "MMLU-Pro results", "url": "https://...", "chunk_id": "chk_abc"}
  ],
  "tool_trace": [
    {"tool": "agentic_rag", "latency_ms": 890},
    {"tool": "github_search", "latency_ms": 310}
  ],
  "latency_ms": 4200,
  "cost_usd": 0.024,
  "cache_hit": false
}
```

**Errors:**

| Code | When |
|------|------|
| 422 | Empty query |
| 429 | Daily budget exceeded |
| 503 | Agent graph failure (partial trace in body) |

---

## Digest

### `GET /api/v1/digest/latest`

**Response 200:**

```json
{
  "digest_date": "2026-07-25",
  "subject": "AI Radar Daily — 12 new items",
  "html": "<html>...</html>",
  "markdown": "# AI Radar Daily\n...",
  "item_count": 12
}
```

### `POST /api/v1/digest/run` *(dev only)*

Trigger digest generation manually. Protect with `DEBUG=true` or admin key in production.

---

## Ingestion (dev)

### `POST /api/v1/ingestion/run`

Triggers background ingestion job. Returns `202` with `run_id`.

---

## OpenAPI

FastAPI auto-docs: `http://localhost:8000/docs`

Export for README:

```bash
curl localhost:8000/openapi.json > docs/openapi.json
```

---

## Next

[Docker](docker.md) · [Testing strategy](testing-strategy.md)
