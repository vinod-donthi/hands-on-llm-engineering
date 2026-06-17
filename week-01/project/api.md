# API Specification

> Week 1 Project · [Backend](backend.md) · [Observability](observability.md)

> **Work dir:** All implementation code lives in `~/ai-learning/week-01-work/prompt-playground-lite/`

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/api/v1/models` | List required + optional models |
| POST | `/api/v1/complete` | Single model completion |
| POST | `/api/v1/compare` | Parallel fan-out |
| POST | `/api/v1/extract` | JSON extraction with reliability ladder |

---

## Compare Response

```json
{
  "parent_request_id": "550e8400-e29b-41d4-a716-446655440000",
  "results": [
    {
      "request_id": "550e8400-...:openai/gpt-4o-mini",
      "model_id": "openai/gpt-4o-mini",
      "text": "...",
      "parsed_json": null,
      "parse_status": null,
      "json_validation_error": null,
      "input_tokens": 45,
      "output_tokens": 120,
      "latency_ms": 842.3,
      "cost_usd": 0.0001,
      "error": null
    },
    {
      "request_id": "550e8400-...:ollama/llama3.1:8b",
      "model_id": "ollama/llama3.1:8b",
      "text": "",
      "parsed_json": null,
      "parse_status": null,
      "json_validation_error": null,
      "input_tokens": 0,
      "output_tokens": 0,
      "latency_ms": 30000.0,
      "cost_usd": 0.0,
      "error": "timeout after 30s"
    }
  ],
  "total_cost_usd": 0.0001
}
```

---

## Extract Request / Response

**Request:**

```json
{
  "text": "Jane Doe, CTO at Acme AI",
  "schema": { "name": "string", "role": "string", "company": "string" }
}
```

**Response:**

```json
{
  "request_id": "uuid",
  "parsed_json": { "name": "Jane Doe", "role": "CTO", "company": "Acme AI" },
  "parse_status": "success",
  "json_validation_error": null,
  "text": "{...}",
  "input_tokens": 80,
  "output_tokens": 40,
  "latency_ms": 620,
  "cost_usd": 0.00002,
  "error": null
}
```

On failure: `parse_status: "parse_failure"`, `parsed_json: null`, `json_validation_error` populated.

---

## Error Isolation Rules

- One model timeout/error must not raise HTTP 500 for the batch.
- Always return `parent_request_id` and per-model `request_id`.
- `total_cost_usd` sums only successful billed calls.
