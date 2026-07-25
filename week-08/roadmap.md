# Week 8 Roadmap — AI Radar Capstone

> [← README](README.md) · [Progress Tracker](progress.md)

## Learning Path

**Default:** Follow [daily/day-XX.md](daily/) numbered steps in order (theory → lab → build → deliverable).

**Catch-up** (behind schedule): On each daily page, do lab/build steps + deliverables only; skim theory Concepts + takeaway.

```
Daily playbook (driver) → theory (linked steps) → lab/integration → phase deliverable → progress.md → Tomorrow link
```

**Rule:** Ship the phase milestone > perfect polish. Good enough to continue > blocking on optional Azure.

---

## Capstone Goal

**AI Radar** continuously monitors the AI ecosystem, stores a searchable corpus, answers questions with agentic RAG, surfaces trends on a dashboard, and emails a daily digest — with eval gates before deploy.

---

## Four Phases × Seven Days

| Phase | Days | Milestone | Spec |
|-------|------|-----------|------|
| **1 Foundation** | 1–2 | Corpus in pgvector; ingestion job runs | [phase-1-foundation.md](project/phases/phase-1-foundation.md) |
| **2 Intelligence** | 3–4 | LangGraph agent + MCP; cited RAG answers | [phase-2-intelligence.md](project/phases/phase-2-intelligence.md) |
| **3 Product** | 5–6 | Dashboard + semantic cache + digest email | [phase-3-product.md](project/phases/phase-3-product.md) |
| **4 Production** | 7 | RAGAS CI gate; Docker; GitHub README | [phase-4-production.md](project/phases/phase-4-production.md) |

---

## Time Budget (Anti-Burnout)

| Constraint | Limit |
|------------|-------|
| Max per day | **5 hours** |
| Max per week | **30 hours** (capstone week — slightly higher OK if energized) |
| Optional skip | **ONE** lab (recommend Lab 7 eval deep-dive if behind — but CI gate is required on Day 7) |

### Priority Order (catch-up only)

1. **Today's phase deliverable** from [daily/](daily/) playbook
2. **Labs / build** steps on that day
3. **Theory** — Concepts + AI engineer takeaway only
4. **Go Deeper / Azure** — skip unless interviewing or deploying

---

## Core Knowledge Objectives

| # | Objective | Theory |
|---|-----------|--------|
| 1 | Capstone system boundaries | [capstone-architecture-overview.md](theory/capstone-architecture-overview.md) |
| 2 | RSS, crawl, scheduled jobs | [ingestion-scheduling.md](theory/ingestion-scheduling.md) |
| 3 | pgvector + Redis semantic cache | [pgvector-redis-caching.md](theory/pgvector-redis-caching.md) |
| 4 | LangGraph stateful orchestration | [langgraph-orchestration.md](theory/langgraph-orchestration.md) |
| 5 | Agentic RAG (when/how to retrieve) | [agentic-rag-patterns.md](theory/agentic-rag-patterns.md) |
| 6 | MCP tool servers | [mcp-tool-integration.md](theory/mcp-tool-integration.md) |
| 7 | Next.js dashboard patterns | [nextjs-dashboard-patterns.md](theory/nextjs-dashboard-patterns.md) |
| 8 | RAGAS + CI regression gate | [eval-ci-gates.md](theory/eval-ci-gates.md) |
| 9 | Docker + optional Azure | [docker-azure-deployment.md](theory/docker-azure-deployment.md) |

---

## Build Objective

Ship [AI Radar](project/overview.md): full stack per [architecture.md](project/architecture.md), tested per [testing-strategy.md](project/testing-strategy.md), documented per [github-readme-spec.md](project/github-readme-spec.md).

---

## Daily Index

| Day | Phase | Focus | Hours (max) |
|-----|-------|-------|-------------|
| [Day 1](daily/day-01.md) | 1 | Architecture + ingestion scaffold | 4–5h |
| [Day 2](daily/day-02.md) | 1 | pgvector corpus + scheduler skeleton | 4–5h |
| [Day 3](daily/day-03.md) | 2 | LangGraph agent + MCP tools | 4–5h |
| [Day 4](daily/day-04.md) | 2 | Agentic RAG query path | 4–5h |
| [Day 5](daily/day-05.md) | 3 | Next.js dashboard + Redis cache | 4–5h |
| [Day 6](daily/day-06.md) | 3 | Cron digest + email | 4h |
| [Day 7](daily/day-07.md) | 4 | RAGAS CI + Docker + ship | 5h |

---

## Cost Budget

| Category | Spend |
|----------|-------|
| OpenAI (embeddings + agent + summaries) | $8–20 |
| Search API (Tavily/Brave) | $2–5 |
| GitHub API | $0 (within free tier with token) |
| Email (Resend free tier) | $0–2 |
| Docker local | $0 |
| Azure (optional) | $5–15 if deployed |
| **Total** | **$15–35** |

Details: [project/cost-estimates.md](project/cost-estimates.md)
