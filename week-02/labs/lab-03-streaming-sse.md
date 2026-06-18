# Lab 3: SSE Streaming

> Week 2 Labs · [← README](README.md) · [Streaming Theory](../theory/streaming.md)

> **Work dir:** `~/ai-learning/week-02-work/model-benchmark-studio/`

**Estimated cost:** $0.20–0.50

**Goal:** `POST /api/v1/stream` streams tokens via SSE; capture TTFT per model.

---

## Backend

Add to `app/providers/base.py`:

```python
@abstractmethod
async def stream(self, request: CompletionRequest, model_id: str) -> AsyncIterator[StreamChunk]:
    ...
```

`StreamChunk` = `{ "text": str, "finish_reason": str | None }`

### Route

```python
from sse_starlette.sse import EventSourceResponse

@router.post("/api/v1/stream")
async def stream_completion(body: StreamRequest):
    return EventSourceResponse(event_generator(body))
```

Events:

| event | data |
|-------|------|
| `meta` | `{ "request_id": "..." }` |
| `token` | `{ "text": "..." }` |
| `done` | `{ "ttft_ms", "latency_ms", "output_tokens", "cost_usd" }` |

---

## Frontend

Use `fetch` + `ReadableStream` or `EventSource` (if GET proxy). Append tokens to UI; update metrics on `done`.

---

## `lab03_stream_benchmark.py`

Stream the prompt `"Count from 1 to 10 slowly."` for each model; write `stream_metrics.json`:

```json
[
  {
    "model_id": "gpt-4o-mini",
    "ttft_ms": 320.5,
    "total_latency_ms": 2100.0,
    "tps": 45.2,
    "output_tokens": 28
  }
]
```

---

## Acceptance

- [ ] UI shows incremental tokens for ≥ 2 providers
- [ ] `ttft_ms` recorded separately from total latency
- [ ] Client disconnect cancels upstream (no zombie tasks)

---

## Next

[Day 4 playbook](../daily/day-04.md)
