# Advanced AI Studio — Overview

> Week 7 Project · [← README](../README.md) · [Architecture](architecture.md)

> **Work dir:** `~/ai-learning/week-07-work/advanced-ai-studio/`

Week 7 capstone per [prompt.md](../../prompt.md): an **end-to-end advanced system** with a documented **Architecture Decision Record (ADR)**. Pick **one track** for the week.

## Tracks

| Track | Name | Build | ADR focus |
|-------|------|-------|-----------|
| **A** | Fine-tuned assistant | LoRA/PEFT model routed in production API | Why fine-tune beat RAG for your domain |
| **B** | Agentic RAG module | LangGraph retrieve-grade-rewrite + MCP | Why agentic loop beat classic RAG |

Both tracks share: baseline eval from Day 1, MCP production patterns (Day 6), capstone eval on Day 7.

## Week 3–6 → Week 7

| Prior work | Advanced AI Studio reuse |
|------------|--------------------------|
| Doc Q&A Studio (Week 3) | Retrieval index, hybrid search |
| Research Agent (Week 4) | LangGraph graph, MCP tools |
| Production stack (Week 5) | Redis rate limit, Docker, observability |
| Eval pipeline (Week 6) | Golden set CI comparison |

## Project Docs

| Doc | Content |
|-----|---------|
| [architecture.md](architecture.md) | Diagram, folder structure |
| [track-a-finetuned-assistant.md](track-a-finetuned-assistant.md) | Track A spec |
| [track-b-agentic-rag.md](track-b-agentic-rag.md) | Track B spec |
| [backend.md](backend.md) | Services, routing, tests |
| [api.md](api.md) | REST endpoints |
| [adr-template.md](adr-template.md) | ADR copy template |
| [docker.md](docker.md) | Compose stack |
| [acceptance-criteria.md](acceptance-criteria.md) | Ship checklist |

## Capstone deliverables

- Running Advanced AI Studio (local or Docker)
- `docs/adr/0001-advanced-ai-studio.md` — completed ADR
- `capstone_eval_report.json` — vs Day 1 baseline
- Labs 1–5 artifacts in work dir

## Local Run

```bash
cd ~/ai-learning/week-07-work/advanced-ai-studio
docker compose up -d
cd backend && uvicorn app.main:app --reload --port 8000
```

Track A test:

```bash
curl -X POST localhost:8000/api/v1/chat -d '{"message":"Classify: billing issue"}'
```

Track B test:

```bash
curl -X POST localhost:8000/api/v1/agent/query -d '{"question":"EU vs US retention policy?"}'
```
