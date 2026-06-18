# Lab 1: Multi-Provider API Smoke Test

> Week 2 Labs · [← README](README.md) · [Anthropic Theory](../theory/anthropic-api.md)

> **Learning path:** This file — specs only.  
> **Work dir:** `~/ai-learning/week-02-work/`

## Setup

```bash
cd ~/ai-learning/week-02-work
source .venv/bin/activate
```

**Estimated cost:** $0.10–0.30 (2 cloud calls per provider)

**Goal:** Verify OpenAI, Anthropic, and Ollama return completions through a shared interface.

---

## Task

Create `lab01_provider_smoke.py` that:

1. Loads API keys from `.env`
2. Calls each provider with the same prompt: `"Reply with exactly: OK"`
3. Writes `provider_smoke_results.json`

### Expected output shape

```json
[
  {
    "provider_id": "openai",
    "model_id": "gpt-4o-mini",
    "text": "OK",
    "input_tokens": 12,
    "output_tokens": 2,
    "latency_ms": 450.2,
    "cost_usd": 0.000003,
    "error": null
  }
]
```

---

## Implementation hints

### AnthropicProvider skeleton

```python
import anthropic
from app.schemas import CompletionRequest, LLMResponse

class AnthropicProvider(BaseLLMProvider):
    provider_id = "anthropic"

    async def complete(self, request: CompletionRequest, model_id: str) -> LLMResponse:
        client = anthropic.AsyncAnthropic()
        msg = await client.messages.create(
            model=model_id,
            max_tokens=request.max_tokens,
            system=request.system_prompt or "",
            messages=[{"role": "user", "content": request.prompt}],
        )
        text = msg.content[0].text
        # map usage → LLMResponse with observability fields
```

Reuse Week 1 `BaseLLMProvider`, `observability.py`, and cost helper.

---

## Acceptance

- [ ] Three rows in JSON (or row with `error` if key missing — document)
- [ ] `latency_ms` and token counts populated for successful calls
- [ ] `cost_usd` > 0 for cloud; `0` for Ollama

---

## Next

Mark Day 1 done → [Day 2 playbook](../daily/day-02.md)
