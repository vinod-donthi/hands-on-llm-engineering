# API Specification

> Week 1 Project · [Backend](backend.md) · [Observability](observability.md) · [Build guide](BUILD-GUIDE.md)

> **Your code today:** `lab04_backend/app/main.py` — `/models`, `/complete`, `/compare` live; `/extract` on Day 7.  
> **Work path:** `Learning/week-01-work/` or `~/ai-learning/week-01-work/`.

---

## What problem are we solving?

This page is the **contract** between your frontend (or curl) and backend — what to send, what comes back, and what must never happen (e.g. HTTP 500 when one model times out).

---

## Endpoints

| Method | Path | Day | Description |
|--------|------|-----|-------------|
| GET | `/api/v1/models` | 5 | List required + optional models |
| POST | `/api/v1/complete` | 5 | Single model completion |
| POST | `/api/v1/compare` | 6 | Parallel fan-out |
| POST | `/api/v1/extract` | 7 | JSON extraction with reliability ladder |

---

## Compare response

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

**Worked example:** User compares 3 models; Llama times out → still HTTP **200**, three `results` objects, failed slot has `error` set.

---

## Extract request / response

**Request:**

```json
{
  "text": "Jane Doe, CTO at Acme AI",
  "schema": { "name": "string", "role": "string", "company": "string" },
  "model_id": "openai/gpt-4o-mini"
}
```

**Response (success):**

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

## Error isolation rules

- One model timeout/error must **not** raise HTTP 500 for the batch.
- Always return `parent_request_id` and per-model `request_id`.
- `total_cost_usd` sums `cost_usd` from all results (failed slots typically $0).

Implementation: [services/comparison.py](../../week-01-work/lab04_backend/app/services/comparison.py) in your work dir.

---

## Next

[backend.md](backend.md) · [CAPSTONE-PROMPTS.md](CAPSTONE-PROMPTS.md)
