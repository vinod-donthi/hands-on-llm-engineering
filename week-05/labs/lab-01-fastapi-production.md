# Lab 1: FastAPI Production Health Probes

> Week 5 Labs · [← README](README.md) · [FastAPI Theory](../theory/fastapi-production.md)

> **Learning path:** This file — specs only.  
> **Work dir:** `~/ai-learning/week-05-work/`

## Setup

```bash
cd ~/ai-learning/week-05-work
source .venv/bin/activate
```

**Estimated cost:** $0 (no LLM calls)

**Goal:** When this lab works, `lab01_health_probe.py` returns JSON showing `/health` always 200 and `/ready` 200 only when dependencies are reachable.

---

## Task

Create `production-ai-stack/backend/app/main.py` with:

1. Lifespan context manager (Redis stub OK — wire Day 3)
2. `RequestIdMiddleware` — sets `X-Request-ID` header
3. Structlog JSON logging on each request
4. `GET /health` — always `{"status": "ok"}`
5. `GET /ready` — `{"ready": bool, "checks": {...}}`

Create `lab01_health_probe.py` that:

1. Starts uvicorn subprocess or assumes running on `:8000`
2. Hits `/health` and `/ready` five times each
3. Writes `health_check_report.json`

### Expected output shape

```json
{
  "base_url": "http://localhost:8000",
  "health": {
    "samples": 5,
    "all_status_200": true,
    "avg_latency_ms": 3.2
  },
  "ready": {
    "samples": 5,
    "all_status_200": true,
    "avg_latency_ms": 8.1,
    "last_body": {"ready": true, "checks": {"redis": "ok"}}
  },
  "logs_include_request_id": true
}
```

---

## Implementation hints

### Lifespan skeleton

```python
from contextlib import asynccontextmanager
from fastapi import FastAPI

@asynccontextmanager
async def lifespan(app: FastAPI):
    app.state.started = True
    yield
    app.state.started = False

app = FastAPI(lifespan=lifespan)
```

### Run locally

```bash
cd production-ai-stack/backend
uvicorn app.main:app --reload --port 8000
```

---

## Acceptance

- [ ] `/health` returns 200 in all five samples
- [ ] `/ready` returns 200 with `ready: true` *(stub checks OK on Day 1)*
- [ ] Response headers include `X-Request-ID`
- [ ] `health_check_report.json` written to work dir root

---

## Next

Mark [Day 1](../daily/day-01.md) done → [Day 2 playbook](../daily/day-02.md)
