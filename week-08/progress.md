# Week 8 Progress Tracker — AI Radar Capstone

> Update after each [daily playbook](daily/) · Max **5h/day**, **~30h/week**. [Roadmap](roadmap.md)

**Learning path:** `Learning/week-08/` (read) · **Work path:** `week-08-work/` in repo or `~/ai-learning/week-08-work/` (code)

## Week Summary

| Metric | Target | Actual |
|--------|--------|--------|
| Hours spent | ≤ 30h | |
| Days completed | 7 | /7 |
| Phases complete | 4 | /4 |
| Labs done | 6 required | /6 |
| Cloud spend | ≤ $35 | $ |

---

## Phase Milestones

| Phase | Done | Deliverable |
|-------|------|-------------|
| [1 Foundation](project/phases/phase-1-foundation.md) | [ ] | `ingestion_report.json`, ≥ 50 docs in pgvector |
| [2 Intelligence](project/phases/phase-2-intelligence.md) | [ ] | `agent_query_trace.json` with citations |
| [3 Product](project/phases/phase-3-product.md) | [ ] | Dashboard live + `digest_preview.html` + cache hit log |
| [4 Production](project/phases/phase-4-production.md) | [ ] | `rag_eval_report.json`, CI green, Docker up |

---

## Daily Log

| Day | Phase | Planned (h) | Actual (h) | Done | Notes |
|-----|-------|-------------|------------|------|-------|
| [Day 1](daily/day-01.md) | 1 | 4–5 | | [ ] | |
| [Day 2](daily/day-02.md) | 1 | 4–5 | | [ ] | |
| [Day 3](daily/day-03.md) | 2 | 4–5 | | [ ] | |
| [Day 4](daily/day-04.md) | 2 | 4–5 | | [ ] | |
| [Day 5](daily/day-05.md) | 3 | 4–5 | | [ ] | |
| [Day 6](daily/day-06.md) | 3 | 4 | | [ ] | |
| [Day 7](daily/day-07.md) | 4 | 5 | | [ ] | |

---

## Labs

| Lab | Required | Done | Deliverable |
|-----|----------|------|-------------|
| [Lab 1](labs/lab-01-ingestion-smoke.md) | Yes | [ ] | `ingestion_smoke.json` |
| [Lab 2](labs/lab-02-pgvector-retrieval.md) | Yes | [ ] | `retrieval_eval_smoke.json` |
| [Lab 3](labs/lab-03-langgraph-mcp.md) | Yes | [ ] | `mcp_tool_trace.json` |
| [Lab 4](labs/lab-04-agentic-rag-query.md) | Yes | [ ] | `agent_query_trace.json` |
| [Lab 5](labs/lab-05-redis-semantic-cache.md) | Yes | [ ] | `cache_hit_report.json` |
| [Lab 6](labs/lab-06-email-digest-scheduler.md) | Yes | [ ] | `digest_preview.html` |
| [Lab 7](labs/lab-07-eval-ci-gate.md) | Optional | [ ] | CI workflow green |

---

## Build — AI Radar

| Item | Done |
|------|------|
| FastAPI backend scaffold | [ ] |
| RSS + GitHub ingestion | [ ] |
| pgvector embeddings + hybrid search | [ ] |
| LangGraph agent graph | [ ] |
| MCP: search, RSS, GitHub | [ ] |
| Agentic RAG `/api/v1/radar/query` | [ ] |
| Next.js dashboard | [ ] |
| Redis semantic cache | [ ] |
| Celery/APScheduler digest job | [ ] |
| Email digest sent | [ ] |
| RAGAS eval + CI gate | [ ] |
| Docker Compose stack | [ ] |
| [Acceptance criteria](project/acceptance-criteria.md) all checked | [ ] |
| Public GitHub README | [ ] |

---

## Validation

| Item | Done |
|------|------|
| [Quiz](checkpoints/quiz.md) ≥ 80% | [ ] |
| [Capstone defense](interview/system-design.md) ≥ 4/5 | [ ] |
| [Exit criteria](checkpoints/exit-criteria.md) complete | [ ] |
| Portfolio artifacts in [portfolio/](portfolio/) | [ ] |

---

## Optional Skip Used?

- [ ] Skipped Lab 7 extended eval tuning (CI gate still required Day 7)
- [ ] Skipped Azure deploy (Docker only)
- [ ] Neither — completed all
