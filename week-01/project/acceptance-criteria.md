# Acceptance Criteria

> Week 1 Project · [Overview](overview.md) · [Failure Recovery](failure-recovery.md)
> **Work dir:** All implementation code lives in `~/ai-learning/week-01-work/prompt-playground-lite/`

## Functional

- [ ] Send one prompt to **GPT-4o Mini + Llama 3.1 8B** simultaneously (Mistral optional)
- [ ] Every result includes: `request_id`, `input_tokens`, `output_tokens`, `latency_ms`, `cost_usd`, `error`
- [ ] Extraction endpoint returns `parse_status` and `json_validation_error` when applicable
- [ ] Evaluation sliders produce composite score per model
- [ ] Client-side JSON export includes scores + observability fields
- [ ] Ollama-only mode works without cloud API keys

## Resiliency — `test_compare_partial_failure()`

**Scenario:**

| Model | Behavior |
|-------|----------|
| Model A (gpt-4o-mini) | Success |
| Model B (llama3.1:8b) | Timeout (mock 30s) |
| Model C (mistral:7b or llama) | Success |

**Verify:**

- [ ] HTTP 200 with 3 results (not 500)
- [ ] Model B: `error` contains timeout message; `text` empty
- [ ] Models A & C: `error: null`, non-empty `text`
- [ ] All results have unique `request_id` sharing same `parent_request_id`
- [ ] `total_cost_usd` reflects A + C only (B unbilled or input-only per mock)
- [ ] Observability fields present on failed result

**Expected test skeleton:**

```python
# tests/test_compare_partial_failure.py
import pytest
from unittest.mock import AsyncMock, patch

@pytest.mark.asyncio
async def test_compare_partial_failure(client):
    with patch("app.services.comparison.run_one") as mock_run:
        mock_run.side_effect = [
            success_response("openai/gpt-4o-mini"),
            timeout_response("ollama/llama3.1:8b"),
            success_response("ollama/llama3.1:8b"),
        ]
        resp = await client.post("/api/v1/compare", json={...})
        data = resp.json()
        assert resp.status_code == 200
        assert len(data["results"]) == 3
        assert data["results"][1]["error"] is not None
        assert data["parent_request_id"]
```

## Repo Standards

- [ ] `.env.example`, `.gitignore`, `Makefile`, README with run instructions
- [ ] `make test` passes

## Capstone

- [ ] 5 benchmark prompts scored and exported
- [ ] `model_comparison_report.md` (1–2 pages)
