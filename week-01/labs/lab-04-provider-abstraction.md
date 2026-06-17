# Lab 4: Provider Abstraction + Observability

> Week 1 Labs · [← README](../README.md) · [Project](../project/overview.md)

> **Learning path:** This file (`Learning/week-01/labs/`) — specs and snippets only.  
> **Work dir:** `~/ai-learning/week-01-work/` — all code and deliverables.

## Setup

```bash
cd ~/ai-learning/week-01-work
source .venv/bin/activate
mkdir -p lab04_backend/app/providers
```

Ensure Ollama is running (`ollama serve`) and `.env` has `OPENAI_API_KEY` (see [labs README](README.md#prerequisites)).

**Estimated cost:** $0–0.15 — Ollama calls are free; budget 2–3 GPT-4o Mini smoke-test calls.

**Goal:** Implement a minimal `BaseLLMProvider` with **OpenAI (GPT-4o Mini)** and **Ollama** — non-streaming only (streaming deferred to Week 2). Every response must include the observability envelope.

**Directory:**

```
lab04_backend/
├── app/
│   ├── main.py
│   ├── providers/
│   │   ├── base.py
│   │   ├── openai_provider.py
│   │   └── ollama.py
│   ├── schemas.py
│   └── observability.py
└── requirements.txt
```

**`app/observability.py`:**

```python
import uuid
import time
from contextlib import asynccontextmanager

def new_request_id() -> str:
    return str(uuid.uuid4())

@asynccontextmanager
async def track_request():
    start = time.perf_counter()
    rid = new_request_id()
    envelope = {"request_id": rid, "error": None}
    try:
        yield envelope
    except Exception as e:
        envelope["error"] = str(e)
        raise
    finally:
        envelope["latency_ms"] = round((time.perf_counter() - start) * 1000, 2)
```

**`app/schemas.py`:**

```python
from pydantic import BaseModel, Field
from typing import Optional, Any

class CompletionRequest(BaseModel):
    prompt: str
    system_prompt: Optional[str] = None
    temperature: float = Field(default=0.7, ge=0.0, le=2.0)
    top_p: float = Field(default=1.0, ge=0.0, le=1.0)
    max_tokens: int = Field(default=1024, ge=1, le=8192)
    response_format: Optional[str] = None  # "json" or "text"

class LLMResponse(BaseModel):
    request_id: str
    text: str
    model_id: str
    provider_id: str
    input_tokens: int
    output_tokens: int
    latency_ms: float
    cost_usd: float
    error: Optional[str] = None
    parsed_json: Optional[Any] = None  # populated when response_format=json
```

**`app/providers/base.py`:**

```python
from abc import ABC, abstractmethod
from app.schemas import CompletionRequest, LLMResponse

class BaseLLMProvider(ABC):
    provider_id: str

    @abstractmethod
    async def complete(self, request: CompletionRequest, model_id: str) -> LLMResponse: ...

    @abstractmethod
    def estimate_cost(self, input_tokens: int, output_tokens: int) -> float: ...
```

**Endpoints (Week 1 only):**

- `POST /api/v1/complete` — single model completion
- `GET /api/v1/models` — hardcoded list of 3–4 models (no YAML registry yet)

**Tasks:**

1. Implement OpenAI + Ollama providers.
2. Attach `request_id`, `latency_ms`, `cost_usd`, `error` to every response.
3. Add JSON mode: when `response_format="json"`, use OpenAI structured output / JSON mode; populate `parsed_json`; log parse failures without crashing.

**Smoke test:**

```bash
uvicorn app.main:app --reload --port 8000

curl -X POST http://localhost:8000/api/v1/complete \
  -H "Content-Type: application/json" \
  -d '{"model_id": "ollama/llama3.1:8b", "request": {"prompt": "Return JSON: {\"greeting\": \"hello\"}", "temperature": 0, "response_format": "json"}}'
```

**Deliverable:** Log showing observability fields on success and on forced error (invalid model_id).

---
