# API

> Week 2 Project · [Backend](backend.md)

Base URL: `http://localhost:8000/api/v1`

## `GET /models`

List registry entries (no API keys).

```json
{
  "models": [
    {
      "id": "gpt-4o-mini",
      "display_name": "GPT-4o Mini",
      "provider": "openai",
      "capabilities": ["chat", "json_schema", "tools", "stream"]
    }
  ]
}
```

## `POST /compare`

Week 1 contract preserved — multi-model parallel compare with observability envelope.

## `POST /stream`

SSE stream. Request body:

```json
{
  "model_id": "gpt-4o-mini",
  "prompt": "Hello",
  "system_prompt": null,
  "temperature": 0.7,
  "max_tokens": 1024
}
```

Events: `meta`, `token`, `done`, `error`.

## `POST /chat/tools`

```json
{
  "model_id": "gpt-4o-mini",
  "message": "What is 15 * 23? Use calculate."
}
```

Response:

```json
{
  "request_id": "...",
  "text": "345",
  "tool_trace": [{ "name": "calculate", "arguments": {}, "result": "345" }],
  "latency_ms": 900,
  "cost_usd": 0.001
}
```

## `POST /extract`

JSON extraction with ladder — same `parse_status` contract as Week 1.

## `GET /runs?limit=20`

```json
{
  "runs": [
    {
      "request_id": "...",
      "model_id": "gpt-4o-mini",
      "cost_usd": 0.002,
      "latency_ms": 450,
      "ttft_ms": 120,
      "created_at": "2026-06-18T10:00:00Z"
    }
  ]
}
```

## Error shape

```json
{
  "error": "guardrail_blocked",
  "detail": "Empty prompt",
  "request_id": "..."
}
```

| Status | Meaning |
|--------|---------|
| 422 | Validation / guardrail |
| 429 | Rate limit or daily budget |
| 400 | Context budget exceeded |
