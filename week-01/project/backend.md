# Backend

> Week 1 Project · [Architecture](architecture.md) · [API](api.md) · [Build guide](BUILD-GUIDE.md)

> **Your code today:** `week-01-work/lab04_backend/` — Labs 4–5 implemented most of this. Day 7 adds extraction.  
> **Work path:** `Learning/week-01-work/` or `~/ai-learning/week-01-work/`.

---

## What problem are we solving?

The backend is the **engine** of Prompt Playground Lite: one API that talks to OpenAI and Ollama the same way, attaches telemetry to every response, and never lets one model failure crash a compare batch.

If you finished Lab 5, you already have ~70% of this file implemented.

---

## What you should have by Day

| Day | Backend capability | Module |
|-----|-------------------|--------|
| 5 | `/complete`, `/models`, providers, observability | `providers/`, `observability.py` |
| 6 | `/compare`, partial failure | `services/comparison.py` |
| 7 | `/extract`, extraction tests | `services/extraction.py` |

---

## Required models (Week 1)

```python
# app/config.py — you already have this in lab04_backend
MODELS = {
    "openai/gpt-4o-mini": {
        "display_name": "GPT-4o Mini (cloud)",
        "provider": "openai",
        "input_price_per_m": 0.15,
        "output_price_per_m": 0.60,
        "supports_structured_output": True,
        "supports_json_mode": True,
    },
    "ollama/llama3.1:8b": {
        "display_name": "Llama 3.1 8B (local)",
        "provider": "ollama",
        "input_price_per_m": 0,
        "output_price_per_m": 0,
        "supports_structured_output": False,
        "supports_json_mode": False,
    },
}
```

Optional: `ollama/mistral:7b` — second local comparator.

---

## Provider interface (no streaming in Week 1)

```python
class BaseLLMProvider(ABC):
    provider_id: str

    @abstractmethod
    async def complete(
        self, request: CompletionRequest, model_id: str, request_id: str
    ) -> LLMResponse: ...

    @abstractmethod
    def estimate_cost(
        self, input_tokens: int, output_tokens: int, model_id: str
    ) -> float: ...
```

**Example:** Lab 4 `OpenAIProvider.complete()` returns `LLMResponse` with `latency_ms`, `cost_usd`, and optional `parse_status` when `response_format="json"`.

---

## JSON extraction service (Day 7)

Implement `extract_with_ladder()` per [structured-output.md](../theory/structured-output.md):

1. Structured output API (GPT-4o Mini only)
2. JSON mode
3. Pydantic validate
4. Prompt repair + single retry
5. `parse_failure` with `json_validation_error`

Wire as `POST /api/v1/extract` in `main.py`.

**Smoke test:**

```bash
curl -s -X POST http://localhost:8000/api/v1/extract \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Jane Doe, CTO at Acme AI",
    "schema": {"name": "string", "role": "string", "company": "string"},
    "model_id": "openai/gpt-4o-mini"
  }'
```

You may reuse `app/services/json_ladder.py` from Lab 4 for parse/repair steps.

---

## Module layout

```
backend/app/
├── main.py                 # routes: /models, /complete, /compare, /extract
├── config.py
├── observability.py
├── schemas.py
├── providers/
│   ├── base.py
│   ├── openai_provider.py
│   └── ollama.py
└── services/
    ├── comparison.py       # Lab 5 ✓
    └── extraction.py       # Day 7
```

---

## Tests (required)

| Test | File | Status after Lab 5 |
|------|------|-------------------|
| Observability envelope | `tests/test_observability.py` or `test_lab04.py` | Partial |
| Partial compare failure | `tests/test_compare_partial_failure.py` | ✓ |
| JSON ladder parse_failure | `tests/test_extraction_ladder.py` | Day 7 |

```bash
cd lab04_backend && pytest -q
```

---

## AI engineer takeaway

Provider abstraction + observability on **every** path (success, timeout, parse failure) is the Week 1 backend lesson. UI is optional; this layer is not.

---

## Next

[api.md](api.md) · [CAPSTONE-PROMPTS.md](CAPSTONE-PROMPTS.md)
