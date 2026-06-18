# Lab 2: YAML Model Registry

> Week 2 Labs · [← README](README.md) · [Model Selection](../theory/model-selection.md)

> **Work dir:** `~/ai-learning/week-02-work/model-benchmark-studio/backend/`

**Goal:** Load models from `config/models.yaml`; route `model_id` → provider class.

---

## `config/models.yaml`

```yaml
models:
  - id: gpt-4o-mini
    provider: openai
    display_name: GPT-4o Mini
    context_window: 128000
    cost_per_million_input: 0.15
    cost_per_million_output: 0.60
    capabilities: [chat, json_schema, tools, stream]

  - id: claude-3-5-haiku-20241022
    provider: anthropic
    display_name: Claude 3.5 Haiku
    context_window: 200000
    cost_per_million_input: 0.80
    cost_per_million_output: 4.00
    capabilities: [chat, tools, stream]

  - id: llama3.1:8b
    provider: ollama
    display_name: Llama 3.1 8B
    context_window: 128000
    cost_per_million_input: 0
    cost_per_million_output: 0
    capabilities: [chat, stream]
```

Verify pricing against provider docs before benchmarking.

---

## `app/registry.py`

```python
from pydantic import BaseModel
from pathlib import Path
import yaml

class ModelConfig(BaseModel):
    id: str
    provider: str
    display_name: str
    context_window: int
    cost_per_million_input: float
    cost_per_million_output: float
    capabilities: list[str]

def load_registry(path: Path = Path("config/models.yaml")) -> list[ModelConfig]:
    data = yaml.safe_load(path.read_text())
    return [ModelConfig(**m) for m in data["models"]]

def get_provider_for_model(model_id: str, registry: list[ModelConfig]) -> str:
    for m in registry:
        if m.id == model_id:
            return m.provider
    raise KeyError(f"Unknown model: {model_id}")
```

---

## Tests: `tests/test_model_registry.py`

- Loads YAML without error
- Unknown `model_id` raises `KeyError`
- `capabilities` includes `stream` for all Week 2 models
- Cost helper uses registry prices

---

## Acceptance

- [ ] `pytest tests/test_model_registry.py -v` passes
- [ ] `GET /api/v1/models` returns registry metadata (no secrets)
- [ ] `model_selection_notes.md` in work dir (5 bullets)

---

## Next

[Day 3 playbook](../daily/day-03.md)
