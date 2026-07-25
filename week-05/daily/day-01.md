# Day 1 — FastAPI Production Patterns

> **You are here:** Day 1 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Start Here](../START-HERE.md) (setup once) |
| **Today's outcome** | Production FastAPI skeleton with health probes and structured logging |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-05-work/` or `~/ai-learning/week-05-work/` |
| **Stop when** | `health_check_report.json` exists |

**Catch-up:** skip to Step 5 (lab) if needed; skim theory Concepts only.

---

## Steps

### Step 1 — Theory: FastAPI production (~30 min)

Read [fastapi-production.md](../theory/fastapi-production.md) — lifespan, middleware, `/health` vs `/ready`, structured logs.

### Step 2 — Lab spec (~10 min)

Read [Lab 1](../labs/lab-01-fastapi-production.md).

### Step 3 — Scaffold project (~30 min)

```bash
cd ~/ai-learning/week-05-work
source .venv/bin/activate
mkdir -p production-ai-stack/backend/app/{middleware,core,services}
touch production-ai-stack/backend/app/__init__.py
```

Copy Week 3/4 RAG or agent module into `app/rag/` or `app/agent/` if available.

### Step 4 — Code: production main.py (~90 min)

Implement:

- `@asynccontextmanager` lifespan (Redis pool stub OK today; wired Day 3)
- Request ID middleware
- Structlog JSON logging
- `GET /health` (process alive) and `GET /ready` (dependencies — stub `ready: true` until Day 2)

### Step 5 — Run health probe script (~45 min)

```bash
cd ~/ai-learning/week-05-work
python lab01_health_probe.py
```

### Step 6 — Deliverable

- [ ] `health_check_report.json` — status codes and latencies for `/health` and `/ready`
- [ ] Logs include `request_id` on each request

### Step 7 — Close out (~15 min)

- [ ] Self-test checkpoint questions in theory file
- [ ] Mark Day 1 in [progress.md](../progress.md)

---

## Done when

- [ ] `health_check_report.json` in work dir
- [ ] Day 1 row checked in `progress.md`

---

## Tomorrow

**→ [Day 2 — Docker Compose Multi-Service](day-02.md)** — start with [docker-compose.md](../theory/docker-compose.md)
