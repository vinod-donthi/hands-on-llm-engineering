# Week 5 Progress Tracker

> Update after each [daily playbook](daily/) · Max **5h/day**, **28h/week**. [Roadmap](roadmap.md)

**Learning path:** `Learning/week-05/` (read) · **Work path:** `week-05-work/` in repo or `~/ai-learning/week-05-work/` (code)

## Week Summary

| Metric | Target | Actual |
|--------|--------|--------|
| Hours spent | ≤ 28h | |
| Days completed | 7 | /7 |
| Labs done | 5 required | /5 |
| Cloud spend | ≤ $15 | $ |

---

## Daily Log

| Day | Planned (h) | Actual (h) | Done | Notes |
|-----|-------------|------------|------|-------|
| [Day 1](daily/day-01.md) | 4 | | [ ] | |
| [Day 2](daily/day-02.md) | 4–5 | | [ ] | |
| [Day 3](daily/day-03.md) | 4 | | [ ] | |
| [Day 4](daily/day-04.md) | 4–5 | | [ ] | |
| [Day 5](daily/day-05.md) | 4–5 | | [ ] | |
| [Day 6](daily/day-06.md) | 4 | | [ ] | |
| [Day 7](daily/day-07.md) | 4–5 | | [ ] | |

---

## Labs

| Lab | Required | Done | Deliverable |
|-----|----------|------|-------------|
| [Lab 1](labs/lab-01-fastapi-production.md) | Yes | [ ] | `health_check_report.json` |
| [Lab 2](labs/lab-02-docker-compose.md) | Yes | [ ] | Compose stack healthy |
| [Lab 3](labs/lab-03-redis.md) | Yes | [ ] | `redis_cache_demo.json` |
| [Lab 4](labs/lab-04-semantic-cache.md) | Yes | [ ] | `cache_report.json` |
| [Lab 5](labs/lab-05-background-jobs.md) | Yes | [ ] | `job_run_trace.json` |
| [Lab 6](labs/lab-06-observability.md) | Optional | [ ] | Langfuse trace screenshot / export |

---

## Build — Production AI Stack

| Item | Done |
|------|------|
| Lifespan + middleware + `/health` + `/ready` | [ ] |
| Docker Compose: api + redis + worker | [ ] |
| Redis exact cache on RAG responses | [ ] |
| Rate limiting (429 under abuse) | [ ] |
| Semantic cache hit on paraphrase | [ ] |
| ARQ worker for async RAG / reindex | [ ] |
| OpenTelemetry spans exported | [ ] |
| Langfuse shows LLM + retrieval spans | [ ] |
| Cost cap middleware | [ ] |
| Backpressure / queue depth guard | [ ] |
| `deploy_checklist.md` completed | [ ] |
| [Acceptance criteria](project/acceptance-criteria.md) all checked | [ ] |

---

## Validation

| Item | Done |
|------|------|
| [Quiz](checkpoints/quiz.md) ≥ 80% | [ ] |
| [Interview checkpoint](checkpoints/progress-tracker.md) | [ ] |
| Load smoke test (`load_smoke_results.json`) | [ ] |

---

## Optional Skip Used?

- [ ] Skipped Lab 6 (observability — minimal OTEL only)
- [ ] Neither — completed all
