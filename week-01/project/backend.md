# Backend

> Week 1 Project · [Architecture](architecture.md) · [API](api.md)

> **Work dir:** All implementation code lives in `~/ai-learning/week-01-work/prompt-playground-lite/`

## Required Models (Week 1)

```python
# backend/app/config.py
MODELS = {
    "openai/gpt-4o-mini": {
        "display_name": "GPT-4o Mini (cloud)",
        "provider": "openai",           # or openrouter
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

# Optional — second local comparator
OPTIONAL_MODELS = {
    "ollama/mistral:7b": {
        "display_name": "Mistral 7B (local, optional)",
        "provider": "ollama",
        "input_price_per_m": 0,
        "output_price_per_m": 0,
        "supports_structured_output": False,
        "supports_json_mode": False,
    },
}
```

See [Model Selection Principles](../roadmap.md#model-selection-principles).

---

## Provider Interface (No Streaming — Week 1)

```python
from abc import ABC, abstractmethod
from app.schemas import CompletionRequest, LLMResponse

class BaseLLMProvider(ABC):
    provider_id: str

    @abstractmethod
    async def complete(self, request: CompletionRequest, model_id: str) -> LLMResponse: ...

    @abstractmethod
    def estimate_cost(self, input_tokens: int, output_tokens: int, model_id: str) -> float: ...
```

---

## JSON Extraction Service

Implement `extract_with_ladder()` per [structured-output.md](../theory/structured-output.md):

1. Structured output API (GPT-4o Mini only)
2. JSON mode
3. Pydantic validate
4. Prompt repair + single retry
5. `parse_failure` with `json_validation_error`

---

## Module Layout

```
backend/app/
├── main.py
├── config.py
├── observability.py
├── schemas.py
├── providers/
│   ├── base.py
│   ├── openai_provider.py
│   └── ollama.py
└── services/
    ├── comparison.py
    └── extraction.py
```

---

## Tests (required)

| Test | File |
|------|------|
| Observability envelope | `tests/test_observability.py` |
| Partial compare failure | `tests/test_compare_partial_failure.py` |
| JSON ladder parse_failure | `tests/test_extraction_ladder.py` |
