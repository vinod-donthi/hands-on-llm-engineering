# Prompt Playground Lite — Overview

> Week 1 Project · [← README](../README.md) · **[Build guide](BUILD-GUIDE.md)** · [Where am I?](../WHERE-AM-I.md)

> **Your code today:** `week-01-work/lab04_backend/` (Labs 4–6). Final layout: `prompt-playground-lite/` — see [BUILD-GUIDE.md](BUILD-GUIDE.md).  
> **Work path:** `Learning/week-01-work/` or `~/ai-learning/week-01-work/` (same idea, two valid locations).

---

## What problem are we solving?

Week 1 labs teach you to call LLMs with **production-style telemetry**. The project turns that into a **small product**: send one prompt, compare cloud vs local models side by side, score the answers, export JSON for your portfolio.

You are not expected to have this entire app on Day 5 — labs build the backend first; Day 7 finishes the rest.

---

## What it is (plain English)

A reduced-scope multi-model comparison tool:

- Compare **GPT-4o Mini** (cloud) and **Llama 3.1 8B** (local)
- Every response includes an **observability envelope** (tokens, cost, latency, errors)
- **JSON extraction** with a reliability ladder (`parse_status`)
- **Manual evaluation scores** (four dimensions → composite)
- **Partial failure** — one model down does not kill the batch

---

## What you have after each day

| Day | Project-related state |
|-----|------------------------|
| 5 | `lab04_backend/` — `/complete`, `/models`, observability |
| 6 | + `/compare`, `compare_sample_output.json`, optional benchmark |
| 7 | + `/extract`, capstone JSON + report, optional UI |

Details: [BUILD-GUIDE.md](BUILD-GUIDE.md) · [WHERE-AM-I.md](../WHERE-AM-I.md)

---

## Week 1 vs Week 2

| Feature | Week 1 (Lite) | Week 2 (Full) |
|---------|---------------|---------------|
| PostgreSQL / history | — | ✓ |
| SSE streaming | — | ✓ |
| Docker Compose | — | ✓ |
| YAML model registry | Hardcoded | ✓ |
| Multi-model compare | ✓ | ✓ |
| Observability envelope | ✓ | ✓ |
| JSON reliability ladder | ✓ | ✓ + JSON Schema |
| Eval scoring UI | ✓ manual | ✓ automated |
| Client export | ✓ | ✓ server export |

---

## Project docs (read in this order on Day 7)

| Order | Doc | When |
|-------|-----|------|
| 1 | [BUILD-GUIDE.md](BUILD-GUIDE.md) | First — what to do today |
| 2 | [CAPSTONE-PROMPTS.md](CAPSTONE-PROMPTS.md) | Running the 5 benchmark prompts |
| 3 | [minimum-viable-week1.md](minimum-viable-week1.md) | If time is tight |
| 4 | [acceptance-criteria.md](acceptance-criteria.md) | Full ship checklist |
| 5 | [architecture.md](architecture.md) | Folder layout + migration |
| 6 | [backend.md](backend.md) · [api.md](api.md) | Implementation detail |
| 7 | [frontend.md](frontend.md) | Path A UI only |

---

## Capstone

5 fixed prompts → scored export → [CAPSTONE-PROMPTS.md](CAPSTONE-PROMPTS.md) · [portfolio/week-01-showcase.md](../portfolio/week-01-showcase.md)

---

## Local run

**Backend only (what you have after Day 6):**

```bash
cd week-01-work/lab04_backend
source ../.venv/bin/activate
uvicorn app.main:app --reload --port 8000
```

**Full stack (after scaffold — [scripts/scaffold-playground-lite.sh](../scripts/scaffold-playground-lite.sh)):**

```bash
ollama serve && ollama pull llama3.1:8b
cd prompt-playground-lite/backend && uvicorn app.main:app --reload --port 8000
cd prompt-playground-lite/frontend && npm run dev
```
