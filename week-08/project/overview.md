# AI Radar — Overview

> Week 8 Capstone · [← README](../README.md) · [Architecture](architecture.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/`

**AI Radar** is your portfolio capstone: a system that watches the AI ecosystem, stores what it finds, answers questions with an agent that knows when to search vs retrieve, shows trends on a dashboard, and emails you a daily digest — with evaluation gates before you call it production-ready.

Per [prompt.md](../../prompt.md) Week 8 requirements.

---

## What problem are we solving?

Staying current in AI is a full-time job. AI Radar automates the **collect → store → reason → summarize → notify** loop so you (or a team) get signal without manually checking 20 RSS feeds and GitHub trending repos.

### Worked scenario

At **7:00 AM**, the digest job runs. It pulls yesterday's ingested items (new `gpt-4.1` release blog, three arXiv papers, two YC AI startups), clusters similar headlines, asks the LangGraph agent to write a 200-word summary with links, and sends email. At **9:00 AM**, you open the dashboard, filter by "benchmarks," and ask: *"What eval frameworks shipped this week?"* — the agent uses MCP GitHub search, then agentic RAG over your corpus, returns cited bullets.

---

## Week 1–7 → AI Radar

| Prior week | What you reuse in AI Radar |
|------------|----------------------------|
| Week 1–2 | FastAPI patterns, OpenAI client, cost guards, Docker basics |
| Week 3 | pgvector RAG, chunking, hybrid retrieval, RAGAS intro |
| Week 4 | LangGraph graphs, MCP tool servers, HITL patterns |
| Week 5 | Redis cache, Celery/APScheduler, observability, production middleware |
| Week 6 | RAGAS + CI gate, golden dataset, regression thresholds |
| Week 7 | Agentic RAG, MCP production patterns, ADR writing |

You are **integrating**, not re-learning. Labs this week are shorter — they verify wiring between subsystems.

---

## Project Docs

| Doc | Content |
|-----|---------|
| [architecture.md](architecture.md) | Diagram, folder structure, data flow |
| [phases/](phases/) | 4 implementation phases (7 days) |
| [backend.md](backend.md) | Services, agents, ingestion, tests |
| [frontend.md](frontend.md) | Next.js dashboard |
| [api.md](api.md) | REST endpoints |
| [docker.md](docker.md) | Compose stack |
| [azure.md](azure.md) | Optional Azure Container Apps |
| [eval.md](eval.md) | RAGAS pipeline + CI |
| [testing-strategy.md](testing-strategy.md) | Unit, integration, eval layers |
| [cost-estimates.md](cost-estimates.md) | Token and infra math |
| [github-readme-spec.md](github-readme-spec.md) | Public repo README template |
| [acceptance-criteria.md](acceptance-criteria.md) | Ship checklist |

---

## Implementation Phases

| Phase | Days | Outcome |
|-------|------|---------|
| [1 Foundation](phases/phase-1-foundation.md) | 1–2 | Ingestion + pgvector corpus |
| [2 Intelligence](phases/phase-2-intelligence.md) | 3–4 | LangGraph + MCP + agentic RAG |
| [3 Product](phases/phase-3-product.md) | 5–6 | Dashboard + cache + email |
| [4 Production](phases/phase-4-production.md) | 7 | Eval CI + Docker + ship |

---

## Local Run (end state)

```bash
cd ~/ai-learning/week-08-work/ai-radar
docker compose up -d                    # postgres, redis, backend, worker
cd backend && uvicorn app.main:app --reload --port 8000
cd frontend && npm run dev              # :3000
python -m app.jobs.run_ingestion        # manual ingest
python -m app.jobs.run_digest           # manual digest preview
pytest && python -m app.eval.run_ragas  # tests + eval
```

---

## Capstone Artifacts (portfolio)

| Artifact | Path (work dir) |
|----------|-----------------|
| Architecture diagram | `docs/architecture.png` or Mermaid in README |
| Eval report | `artifacts/rag_eval_report.json` |
| Sample digest | `artifacts/digest_preview.html` |
| Agent trace | `artifacts/agent_query_trace.json` |
| CI badge | GitHub Actions README badge |

See [portfolio/](../portfolio/week-08-showcase.md).
