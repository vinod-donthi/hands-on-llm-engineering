# Day 5 — Observability + Backend

> **You are here:** Day 5 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 4](day-04.md) — RLHF / hallucinations summary |
| **Today's outcome** | FastAPI backend with OpenAI + Ollama providers and observability envelope on every response |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-01-work/` (project grows under `lab04_backend/` or `prompt-playground-lite/`) |
| **Stop when** | `curl` smoke test returns observability fields |

---

## Steps

### Step 1 — Theory: Observability (~20 min)

Read [observability.md](../theory/observability.md)

### Step 2 — Theory: Prompt engineering (~10 min skim)

Read [prompt-engineering.md](../theory/prompt-engineering.md) — Concepts + takeaway only

### Step 3 — Lab spec (~10 min)

Read [Lab 4](../labs/lab-04-provider-abstraction.md) and [project observability](../project/observability.md)

### Step 4 — Build backend (~2–3h)

Implement per lab spec in work dir:

```bash
cd week-01-work
source .venv/bin/activate
uvicorn app.main:app --reload --port 8000
```

### Step 5 — Smoke test

- [ ] `POST /api/v1/complete` returns `request_id`, `latency_ms`, `cost_usd`, tokens
- [ ] JSON mode populates `parsed_json` or logs parse failure
- [ ] Log snippet saved (success + forced error)

### Step 6 — Repo standards (~30 min)

In work project: `.gitignore`, `Makefile` or scripts, README

### Step 7 — Close out

- [ ] Mark Day 5 + Lab 4 in [progress.md](../progress.md)

---

## Done when

- [ ] Backend runs on :8000 with observability envelope
- [ ] Day 5 row checked in `progress.md`

---

## Tomorrow

**→ [Day 6 — Compare, Benchmark, RSS](day-06.md)** — start with [rss-ingestion-primer.md](../theory/rss-ingestion-primer.md) (short)
