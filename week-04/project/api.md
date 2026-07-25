# Research Agent Studio — API

> Week 4 Project · [← Backend](backend.md)

Base URL: `http://localhost:8001`

## Endpoints

### `POST /api/v1/research`

Start or continue a research run.

**Request:**

```json
{
  "question": "Compare EU AI Act GPAI rules with our AI policy doc.",
  "thread_id": null,
  "doc_collection": "default"
}
```

**Response (in progress):**

```json
{
  "thread_id": "research-a1b2",
  "status": "running",
  "message": "Research started"
}
```

**Response (HITL waiting):**

```json
{
  "thread_id": "research-a1b2",
  "status": "awaiting_approval",
  "interrupt_id": "int-9f2a",
  "tool": "fetch_url",
  "args": {"url": "https://example.com/doc"},
  "risk": "Fetches external content"
}
```

### `POST /api/v1/research/{thread_id}/approve`

Resume after HITL.

**Request:**

```json
{
  "interrupt_id": "int-9f2a",
  "action": "approve",
  "comment": "Public URL OK"
}
```

Or `"action": "reject"`.

### `GET /api/v1/research/{thread_id}`

Poll status and fetch report when complete.

**Response (complete):**

```json
{
  "thread_id": "research-a1b2",
  "status": "complete",
  "report": {
    "question": "...",
    "summary": "...",
    "citations": [
      {"kind": "web", "title": "EUR-Lex", "locator": "https://...", "excerpt": "..."},
      {"kind": "doc", "title": "AI Policy", "locator": "doc:sample_policy#chunk-3", "excerpt": "..."}
    ],
    "coverage_score": 0.88,
    "tool_rounds": 5,
    "cost_usd": 0.042
  }
}
```

### `GET /api/v1/research/{thread_id}/trace`

Returns path to trace or JSONL content (dev mode).

### `GET /health`

```json
{"status": "ok", "checkpoint_db": "connected"}
```

---

## Error codes

| HTTP | Meaning |
|------|---------|
| 400 | Invalid question or unknown thread_id |
| 408 | HITL approval timeout |
| 429 | Daily budget exceeded |
| 500 | Graph execution error (check trace) |

---

## CLI equivalent

```bash
python -m app.cli research "Your question" --thread-id demo-1
python -m app.cli approve demo-1 int-9f2a approve
```
