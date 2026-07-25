# Phase 1 — Foundation (Days 1–2)

> [← Overview](../overview.md) · [Phase 2 →](phase-2-intelligence.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/`

**Goal:** A running FastAPI skeleton, Docker Postgres with pgvector, and an ingestion pipeline that fills your corpus from RSS feeds and GitHub — ready for the agent on Day 3.

---

## Day 1 Deliverables

| Artifact | Description |
|----------|-------------|
| `ai-radar/` scaffold | Backend `app/main.py`, health route, config loader |
| `config/sources.yaml` | ≥ 5 RSS feeds + ≥ 2 GitHub search queries |
| `ingestion_smoke.json` | Lab 1 output — fetched items without DB |
| Docker Postgres | `docker compose up postgres` healthy |

### Day 1 tasks

1. Read [capstone-architecture-overview.md](../../theory/capstone-architecture-overview.md) + [ingestion-scheduling.md](../../theory/ingestion-scheduling.md)
2. Scaffold project per [architecture.md](../architecture.md) folder tree (minimal subset)
3. Implement RSS fetcher + GitHub trending fetch (no embeddings yet)
4. Run [Lab 1](../../labs/lab-01-ingestion-smoke.md)

---

## Day 2 Deliverables

| Artifact | Description |
|----------|-------------|
| pgvector schema | `documents`, `chunks`, `ingestion_runs` migrated |
| ≥ 50 documents | Embedded and searchable |
| `ingestion_report.json` | Counts, errors, duration from full pipeline run |
| `retrieval_eval_smoke.json` | Lab 2 — top-k retrieval sanity check |
| Scheduler skeleton | APScheduler or Celery task registered (manual trigger OK) |

### Day 2 tasks

1. Read [pgvector-redis-caching.md](../../theory/pgvector-redis-caching.md) (pgvector sections)
2. Chunk + embed pipeline → pgvector
3. Hybrid retriever (vector + keyword) — reuse Week 3 patterns
4. Run [Lab 2](../../labs/lab-02-pgvector-retrieval.md)
5. Wire `python -m app.jobs.run_ingestion` end-to-end

---

## Phase 1 Acceptance

- [ ] `GET /api/v1/health` returns `{"status":"ok","db":"ok"}`
- [ ] `GET /api/v1/feed?limit=20` returns recent ingested items
- [ ] ≥ 50 rows in `documents` with embeddings in `chunks`
- [ ] `ingestion_report.json` shows `< 10%` fetch failures (document rest)
- [ ] Scheduler module exists (cron config in `.env` — execution can be manual)

---

## Suggested RSS sources (edit freely)

| Feed | Category |
|------|----------|
| OpenAI blog RSS | Model releases |
| Hugging Face blog | Tools / models |
| arXiv cs.AI (via API or aggregator) | Papers |
| TechCrunch AI | Funding / startups |
| GitHub blog | Platform launches |

Store canonical list in `config/sources.yaml` — not hardcoded in Python.

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Embedding before dedup | Hash `url` — skip duplicate documents |
| Huge crawl depth | Cap at 1 hop from seed URLs for capstone |
| No ingestion run log | Write `ingestion_runs` row every job — needed for dashboard |

---

## Next

**→ [Phase 2 — Intelligence](phase-2-intelligence.md)** · [Day 3 playbook](../../daily/day-03.md)
