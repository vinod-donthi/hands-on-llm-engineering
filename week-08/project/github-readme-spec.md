# AI Radar — GitHub README Spec

> Week 8 Capstone · [Overview](overview.md) · [Portfolio](../portfolio/week-08-showcase.md)

Your public repo README is a **hiring manager's first impression**. Follow this spec when publishing `~/ai-learning/week-08-work/ai-radar/README.md`.

---

## Required sections (in order)

### 1. Title + one-liner

```markdown
# AI Radar

Production-grade AI ecosystem monitor: ingests RSS & GitHub, agentic RAG with LangGraph + MCP, Next.js dashboard, daily email digest, RAGAS eval CI gate.
```

### 2. Demo

- Screenshot of dashboard **or** 30s GIF (feed + query + citations)
- Optional: link to live Azure demo

### 3. Architecture

Embed Mermaid from [architecture.md](architecture.md) or `docs/architecture.png`.

### 4. Features checklist

- [ ] Scheduled RSS + GitHub ingestion → pgvector
- [ ] LangGraph agent with MCP tools (search, RSS, GitHub)
- [ ] Agentic RAG with cited answers
- [ ] Redis semantic cache
- [ ] Next.js dashboard
- [ ] Daily email digest
- [ ] RAGAS eval + CI regression gate
- [ ] Docker Compose one-command boot

### 5. Quick start

```bash
git clone https://github.com/YOU/ai-radar.git
cd ai-radar
cp .env.example .env   # add keys
docker compose up -d --build
docker compose exec backend alembic upgrade head
docker compose exec backend python -m app.jobs.run_ingestion
open http://localhost:3000
```

**Expected:** Health OK at `:8000/api/v1/health`, feed populated.

### 6. Tech stack table

| Layer | Technology |
|-------|------------|
| Backend | FastAPI, LangGraph, MCP |
| Frontend | Next.js, Tailwind |
| Data | PostgreSQL + pgvector, Redis |
| Jobs | Celery Beat |
| Eval | RAGAS, GitHub Actions |
| Deploy | Docker Compose (+ optional Azure) |

### 7. API examples

One `curl` for feed, one for query — copy from [api.md](api.md).

### 8. Eval / CI badge

```markdown
![Eval Gate](https://github.com/YOU/ai-radar/actions/workflows/eval-gate.yml/badge.svg)
```

Include sample metrics from `artifacts/rag_eval_report.json`:

> Faithfulness: 0.82 · Context precision: 0.76 · Answer relevance: 0.79

### 9. Cost & ops

Link to your notes or inline: *"~$15–25/week dev usage with semantic caching."*

### 10. Project structure

Collapsed tree — top 2 levels only (see [architecture.md](architecture.md)).

### 11. ADR / design decisions

Link `docs/adr/001-agentic-rag-vs-static.md` — shows senior-engineer thinking.

### 12. License

MIT recommended for portfolio repos.

### 13. Author

LinkedIn + *"Built as capstone for 8-Week AI Engineering curriculum"* (optional).

---

## README anti-patterns

| Avoid | Do instead |
|-------|------------|
| "WIP" with no setup steps | Working Quick Start or "Demo mode" with seed data |
| Secrets in examples | `sk-...` placeholders only |
| No architecture | Mermaid diagram above fold |
| Generic "AI project" | Specific domains: LLM releases, papers, GitHub |

---

## Optional badges

- Python version
- Docker
- RAGAS score shield (custom)

---

## AI engineer takeaway

A strong README lets staff engineer + EM evaluate you in **5 minutes**. Architecture + eval numbers + one-command run = interview callback material.

---

## Next

[Acceptance criteria](acceptance-criteria.md) · [Resume bullets](../portfolio/resume-bullets.md)
