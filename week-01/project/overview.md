# Prompt Playground Lite — Overview

> Week 1 Project · [← README](../README.md) · [Architecture](architecture.md)

> **Work dir:** All implementation code lives in `~/ai-learning/week-01-work/prompt-playground-lite/`

A reduced-scope multi-model comparison tool. Compare **GPT-4o Mini** (cloud) and **Llama 3.1 8B** (local) with observability, JSON extraction ladder, evaluation scores, and partial-failure resiliency.

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

## Project Docs

| Doc | Content |
|-----|---------|
| [architecture.md](architecture.md) | System diagram, folder structure |
| [backend.md](backend.md) | Models, providers, tests |
| [frontend.md](frontend.md) | UI components |
| [api.md](api.md) | Endpoints, response shapes |
| [observability.md](observability.md) | Logging, metrics bar |
| [evaluation-rubric.md](evaluation-rubric.md) | Scoring framework |
| [failure-recovery.md](failure-recovery.md) | Error handling playbook |
| [acceptance-criteria.md](acceptance-criteria.md) | Ship checklist + resiliency test |

## Capstone

5 benchmark prompts → scored export → [portfolio/week-01-showcase.md](../portfolio/week-01-showcase.md)

## Local Run

```bash
ollama serve && ollama pull llama3.1:8b
cd backend && uvicorn app.main:app --reload --port 8000
cd frontend && npm run dev
```
