# Acceptance Criteria

> Week 1 Project · [Overview](overview.md) · [Minimum viable Week 1](minimum-viable-week1.md) · [Build guide](BUILD-GUIDE.md)

> **Your code today:** `week-01-work/lab04_backend/` — same checks apply after migration to `prompt-playground-lite/backend/`.  
> **Work path:** `Learning/week-01-work/` or `~/ai-learning/week-01-work/`.

---

## What problem are we solving?

This is the **ship checklist** — each item maps to a file or test so you know when Week 1 is actually done (vs "I read the theory").

**Short on time?** Use [minimum-viable-week1.md](minimum-viable-week1.md) for the Week 2 gate; return here for portfolio-perfect.

---

## Functional

| Criterion | How to verify | Your file / test |
|-----------|---------------|------------------|
| Send one prompt to **GPT-4o Mini + Llama 3.1 8B** simultaneously | curl or UI compare | `POST /api/v1/compare` in `app/main.py` |
| Every result includes observability fields | Inspect JSON response | `LLMResponse` in `app/schemas.py` |
| Extraction returns `parse_status` + `json_validation_error` | curl `/extract` with bad JSON | `app/services/extraction.py` (Day 7) |
| Evaluation sliders → composite score | UI or manual in capstone JSON | `ScorePanel.tsx` or `capstone_comparison.json` |
| Client export includes scores + telemetry | Download JSON | `ExportButton.tsx` or export script |
| Ollama-only mode without cloud key | Compare with local models only | `ollama/*` in `MODELS` |

Checkboxes:

- [ ] Send one prompt to **GPT-4o Mini + Llama 3.1 8B** simultaneously (Mistral optional)
- [ ] Every result includes: `request_id`, `input_tokens`, `output_tokens`, `latency_ms`, `cost_usd`, `error`
- [ ] Extraction endpoint returns `parse_status` and `json_validation_error` when applicable
- [ ] Evaluation sliders produce composite score per model
- [ ] Client-side JSON export includes scores + observability fields
- [ ] Ollama-only mode works without cloud API keys

---

## Resiliency — `test_compare_partial_failure()`

**File:** `lab04_backend/tests/test_compare_partial_failure.py` (or `prompt-playground-lite/backend/tests/`)

**Scenario:**

| Model | Behavior |
|-------|----------|
| Model A (`openai/gpt-4o-mini`) | Success |
| Model B (`ollama/llama3.1:8b`) | Timeout after 30s |
| Model C (`ollama/mistral:7b` or second local) | Success |

**Verify:**

- [ ] HTTP 200 with 3 results (not 500)
- [ ] Model B: `error` contains timeout message; `text` empty
- [ ] Models A & C: `error: null`, non-empty `text`
- [ ] All results have unique `request_id` sharing same `parent_request_id`
- [ ] `total_cost_usd` reflects successful billed calls (failed slot typically $0)
- [ ] Observability fields present on failed result

**Run:**

```bash
cd lab04_backend && pytest tests/test_compare_partial_failure.py -q
```

**Test pattern (current code):** mocks `app.services.comparison.complete_one_model` — not `run_one`.

```python
from unittest.mock import AsyncMock, patch

def test_compare_partial_failure(client):
    with patch(
        "app.services.comparison.complete_one_model",
        AsyncMock(side_effect=...),
    ):
        resp = client.post("/api/v1/compare", json={...})
        assert resp.status_code == 200
```

---

## Repo standards

| Criterion | File |
|-----------|------|
| `.env.example` | work dir or `prompt-playground-lite/` |
| `.gitignore` | exclude `.venv`, `.env`, `node_modules` |
| `Makefile` | `make test` → `pytest` |
| README | run instructions |

- [ ] `.env.example`, `.gitignore`, `Makefile`, README with run instructions
- [ ] `make test` passes (or `pytest -q` documented equivalent)

---

## Capstone

| Criterion | File |
|-----------|------|
| 5 prompts run + scored | [CAPSTONE-PROMPTS.md](CAPSTONE-PROMPTS.md) |
| Export | `capstone_comparison.json` |
| Report | `model_comparison_report.md` |

- [ ] 5 benchmark prompts scored and exported
- [ ] `model_comparison_report.md` (1–2 pages)

---

## Next

[minimum-viable-week1.md](minimum-viable-week1.md) · [Day 7 playbook](../daily/day-07.md)
