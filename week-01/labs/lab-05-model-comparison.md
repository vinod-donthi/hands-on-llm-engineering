# Lab 5: Multi-Model Compare + Evaluation Scores

> Week 1 Labs · [← README](../README.md) · [Project](../project/overview.md)

> **Learning path:** This file (`Learning/week-01/labs/`) — specs and snippets only.  
> **Work dir:** `~/ai-learning/week-01-work/lab04_backend/` — extend Lab 4 backend here.

## Setup

```bash
cd ~/ai-learning/week-01-work/lab04_backend
source ../.venv/bin/activate
```

Requires Lab 4 providers and Ollama models pulled (`llama3.1:8b`, `mistral:7b` or second local model).

**Estimated cost:** $0.10–0.50 — parallel compare; cap at 3 models × 2 prompts.

**Goal:** Fan out one prompt to 3 models concurrently; return observability envelope per model; attach manual evaluation scores.

**File:** `app/services/comparison.py`

```python
import asyncio
import time
import uuid
from app.providers import get_provider  # simple dict lookup — not YAML registry
from app.schemas import CompletionRequest, LLMResponse

async def compare_models(model_ids: list[str], request: CompletionRequest) -> dict:
    parent_id = str(uuid.uuid4())

    async def run_one(model_id: str) -> LLMResponse:
        try:
            provider = get_provider(model_id)
            start = time.perf_counter()
            resp = await asyncio.wait_for(
                provider.complete(request, model_id),
                timeout=30.0,
            )
            resp.latency_ms = round((time.perf_counter() - start) * 1000, 2)
            resp.request_id = f"{parent_id}:{model_id}"
            return resp
        except Exception as e:
            return LLMResponse(
                request_id=f"{parent_id}:{model_id}",
                text="", model_id=model_id, provider_id="unknown",
                input_tokens=0, output_tokens=0, latency_ms=0,
                cost_usd=0.0, error=str(e),
            )

    results = await asyncio.gather(*[run_one(m) for m in model_ids])
    return {
        "parent_request_id": parent_id,
        "results": sorted(results, key=lambda r: r.latency_ms),
        "total_cost_usd": sum(r.cost_usd for r in results),
    }
```

**Endpoint:** `POST /api/v1/compare`

**Tasks:**

1. Error isolation — one model failure does not block others.
2. After receiving results, manually score each using the Evaluation Scoring Framework (4 dimensions).
3. Export one row per model to `compare_sample_output.json`.

**Deliverable:** `compare_sample_output.json` with observability fields + scores.

---

## Resiliency Test — `test_compare_partial_failure()`

**File:** `tests/test_compare_partial_failure.py`

### Scenario

| Model | Simulated Behavior |
|-------|-------------------|
| Model A — `openai/gpt-4o-mini` | Success |
| Model B — `ollama/llama3.1:8b` | Timeout after 30s |
| Model C — `ollama/mistral:7b` (or second llama) | Success |

### Expected Output

```json
{
  "parent_request_id": "abc-123",
  "results": [
    { "model_id": "openai/gpt-4o-mini", "error": null, "text": "...", "request_id": "abc-123:openai/gpt-4o-mini" },
    { "model_id": "ollama/llama3.1:8b", "error": "timeout after 30s", "text": "", "request_id": "abc-123:ollama/llama3.1:8b" },
    { "model_id": "ollama/mistral:7b", "error": null, "text": "...", "request_id": "abc-123:ollama/mistral:7b" }
  ],
  "total_cost_usd": 0.00015
}
```

### Acceptance Criteria

- [ ] HTTP 200 (not 500) when one model fails
- [ ] Partial results returned for all 3 models
- [ ] `request_id` preserved on every result
- [ ] Observability fields intact on failed model (`latency_ms`, `error`)
- [ ] `total_cost_usd` excludes failed model output cost
- [ ] Failures isolated — A and C unaffected

See [acceptance-criteria.md](../project/acceptance-criteria.md).

---
