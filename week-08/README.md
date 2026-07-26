# Week 8 — Capstone: AI Radar

**8-Week AI Engineering Curriculum · Part 8 of 8 · Final week**

> **Prerequisite:** Weeks 1–7 exit criteria passed · [Week 7 README](../week-07/README.md)  
> **New here?** [START-HERE.md](START-HERE.md) → [Day 1 playbook](daily/day-01.md)

---

## 1. Overview

Week 8 is the **capstone**. You ship **AI Radar** — a production-grade system that continuously tracks the AI ecosystem (new models, tools, GitHub launches, papers, benchmarks, funding, startups), summarizes changes, detects trends, and sends a daily email digest.

You integrate everything from the program: **LangGraph** agent orchestration, **agentic RAG** over an ingested corpus, **MCP** tools (search, RSS, GitHub), scheduled ingestion, **pgvector** + **Redis** semantic cache, a **Next.js** dashboard, **RAGAS** eval with a **CI gate**, and **Docker** deployment (optional **Azure**).

**Four implementation phases over seven days** — see [project/phases/](project/phases/).

---

## 2. Learning Path vs Work Path

| | Learning path | Work path |
|---|---|---|
| **Purpose** | Read curriculum, specs, ADRs | Write code, run labs, ship capstone |
| **Location** | This repo — `Learning/week-08/` | `Learning/week-08-work/` **or** `~/ai-learning/week-08-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, `ai-radar/`, `.env`, eval artifacts |
| **Git** | Curriculum (no secrets, no venv) | Your capstone repo (recommended public portfolio) |

### Study flow

```
1. Open today's playbook       → daily/day-XX.md     (numbered steps — your driver)
2. Read theory in step order   → only files linked from that day
3. Code in work directory      → week-08-work/ or ~/ai-learning/week-08-work/
4. Confirm deliverable         → Done when checkboxes on daily page
5. Update progress.md          → tick the day + phase
6. Follow Tomorrow link        → next daily/day-XX.md
```

**Week map:** [daily/README.md](daily/README.md) · **When short on time:** catch-up mode on each daily page (lab + deliverable first). See [roadmap.md](roadmap.md).

---

## 3. Weekly Outcomes

- [ ] **Phase 1:** RSS/crawl ingestion → PostgreSQL + pgvector corpus
- [ ] **Phase 2:** LangGraph agent with MCP tools + agentic RAG answers
- [ ] **Phase 3:** Next.js dashboard, Redis semantic cache, daily email digest
- [ ] **Phase 4:** RAGAS eval pipeline, CI gate, Docker Compose (optional Azure)
- [ ] Complete Labs 1–6 (Lab 7 optional if behind)
- [ ] All [acceptance criteria](project/acceptance-criteria.md) checked
- [ ] Public GitHub README per [github-readme-spec](project/github-readme-spec.md)
- [ ] Quiz ≥ 80% · Capstone defense ≥ 4/5 hire-ready

Full checklist: [checkpoints/exit-criteria.md](checkpoints/exit-criteria.md)

---

## 4. Folder Map

| Folder | Purpose |
|--------|---------|
| [START-HERE.md](START-HERE.md) | One-time orientation → Day 1 |
| [assets/images/](assets/images/) | SVG figures for theory, labs, project |
| [daily/](daily/) | **Numbered playbooks** — one file per day, mapped to 4 phases |
| [theory/](theory/) | Capstone architecture decisions — one topic per file |
| [labs/](labs/) | Integration-focused labs (lighter than Weeks 1–6) |
| [project/](project/) | **Extensive** AI Radar spec — phases, testing, cost, README |
| [interview/](interview/) | Capstone defense questions + cheat sheet |
| [checkpoints/](checkpoints/) | Quiz, exit criteria, progress |
| [resources/](resources/) | Reading, glossary, references |
| [portfolio/](portfolio/) | Resume bullets, LinkedIn, showcase |
| [requirements.txt](requirements.txt) | Python deps (copied to work path) |
| [scripts/setup-work.sh](scripts/setup-work.sh) | Bootstrap work directory |

---

## 5. Setup

### One-time: bootstrap work directory

```bash
cd week-08
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Creates `~/ai-learning/week-08-work/`, copies `requirements.txt` and `.env.example`, creates `.venv`, installs deps.

Custom work location:

```bash
./scripts/setup-work.sh ~/projects/my-week-08
# or
WORK_DIR=~/projects/my-week-08 ./scripts/setup-work.sh
```

### Migrate from prior weeks (recommended)

Reuse patterns from Weeks 3–7 in your work dir — pgvector RAG (Week 3), LangGraph + MCP (Week 4), Redis cache (Week 5), RAGAS CI (Week 6), agentic RAG (Week 7). See [project/overview.md](project/overview.md#week-1-7--ai-radar).

### Every session

```bash
cd ~/ai-learning/week-08-work
source .venv/bin/activate
```

### API keys (`.env`)

| Key | Required | Use |
|-----|----------|-----|
| `OPENAI_API_KEY` | Yes | Embeddings, agent, summarization |
| `GITHUB_TOKEN` | Yes | GitHub MCP / API rate limits |
| `TAVILY_API_KEY` or `BRAVE_SEARCH_API_KEY` | One of | Web search MCP |
| `SMTP_*` or `RESEND_API_KEY` | Yes (Day 6+) | Email digest |
| `DATABASE_URL` | Yes | PostgreSQL + pgvector |
| `REDIS_URL` | Yes (Day 5+) | Semantic cache |

**Estimated cloud spend:** $15–35 for the full week. See [project/cost-estimates.md](project/cost-estimates.md).

### Docker (Day 7)

```bash
docker compose -f ai-radar/docker-compose.yml up -d
```

---

## 6. Implementation Phases

| Phase | Days | Focus | Spec |
|-------|------|-------|------|
| **1 — Foundation** | 1–2 | Ingestion, pgvector corpus, scheduler skeleton | [phase-1-foundation.md](project/phases/phase-1-foundation.md) |
| **2 — Intelligence** | 3–4 | LangGraph agent, MCP tools, agentic RAG | [phase-2-intelligence.md](project/phases/phase-2-intelligence.md) |
| **3 — Product** | 5–6 | Dashboard, Redis cache, email digest | [phase-3-product.md](project/phases/phase-3-product.md) |
| **4 — Production** | 7 | RAGAS eval, CI gate, Docker, ship | [phase-4-production.md](project/phases/phase-4-production.md) |

---

## 7. Navigation

### Theory

Full index: [theory/README.md](theory/README.md)

[Capstone Architecture](theory/capstone-architecture-overview.md) · [Ingestion & Scheduling](theory/ingestion-scheduling.md) · [pgvector + Redis](theory/pgvector-redis-caching.md) · [LangGraph](theory/langgraph-orchestration.md) · [Agentic RAG](theory/agentic-rag-patterns.md) · [MCP Tools](theory/mcp-tool-integration.md) · [Next.js Dashboard](theory/nextjs-dashboard-patterns.md) · [Eval CI Gates](theory/eval-ci-gates.md) · [Docker + Azure](theory/docker-azure-deployment.md)

### Labs

[Overview](labs/README.md) · [Lab 1 Ingestion](labs/lab-01-ingestion-smoke.md) · [Lab 2 pgvector](labs/lab-02-pgvector-retrieval.md) · [Lab 3 LangGraph + MCP](labs/lab-03-langgraph-mcp.md) · [Lab 4 Agentic RAG](labs/lab-04-agentic-rag-query.md) · [Lab 5 Redis cache](labs/lab-05-redis-semantic-cache.md) · [Lab 6 Email digest](labs/lab-06-email-digest-scheduler.md) · [Lab 7 Eval CI](labs/lab-07-eval-ci-gate.md) *(optional)*

### Project

[Overview](project/overview.md) · [Architecture](project/architecture.md) · [Phases](project/phases/) · [Backend](project/backend.md) · [Frontend](project/frontend.md) · [API](project/api.md) · [Docker](project/docker.md) · [Azure](project/azure.md) · [Eval](project/eval.md) · [Testing](project/testing-strategy.md) · [Cost](project/cost-estimates.md) · [GitHub README Spec](project/github-readme-spec.md) · [Acceptance Criteria](project/acceptance-criteria.md)

### Interview & Validation

[Capstone Defense](interview/system-design.md) · [Concepts](interview/concepts.md) · [Coding](interview/coding.md) · [Cheat Sheet](interview/cheat-sheet.md) · [Quiz](checkpoints/quiz.md) · [Exit Criteria](checkpoints/exit-criteria.md)

---

## 8. Daily Checklist

| Day | Phase | Must Complete | Optional |
|-----|-------|---------------|----------|
| 1 | 1 | Lab 1, architecture + ingestion theory | Extra RSS sources |
| 2 | 1 | Lab 2, pgvector corpus populated | Crawl depth tuning |
| 3 | 2 | Lab 3, LangGraph + MCP smoke | Extra GitHub queries |
| 4 | 2 | Lab 4, agentic RAG query API | Trend heuristics |
| 5 | 3 | Lab 5, dashboard + Redis cache | Chart polish |
| 6 | 3 | Lab 6, scheduler + email digest | HTML email template |
| 7 | 4 | Eval CI, Docker ship, portfolio | Azure deploy |

Details: [daily/](daily/)

---

## 9. Progress Tracker

```bash
cp progress.md ~/ai-learning/week-08-work/
```

---

## 10. Week Completion Criteria

| Gate | Requirement |
|------|-------------|
| **Knowledge** | Quiz ≥ 12/15 |
| **Build** | All [acceptance criteria](project/acceptance-criteria.md) checked |
| **Ingestion** | ≥ 50 documents in pgvector from RSS + GitHub |
| **Agent** | LangGraph agent answers with citations via agentic RAG |
| **Product** | Dashboard live + one email digest sent |
| **Eval** | RAGAS report + CI gate blocks > 5% regression |
| **Defense** | Capstone system-design ≥ 4/5 hire-ready |

**Congratulations** — completing Week 8 means you have a portfolio-ready capstone. See [portfolio/](portfolio/) and [job-readiness/](../job-readiness/) *(if present)*.
