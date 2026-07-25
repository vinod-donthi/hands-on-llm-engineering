# Day 2 — Phase 1: pgvector Corpus

> **You are here:** Day 2 of 7 · Phase 1 of 4 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 1](day-01.md) |
| **Today's outcome** | ≥ 50 embedded documents; ingestion pipeline complete |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-08-work/` or `~/ai-learning/week-08-work/` |
| **Stop when** | Phase 1 milestone checked in progress.md |

**Catch-up:** Lab 2 + ingestion run; skim pgvector Concepts only.

---

## Steps

### Step 1 — Theory: pgvector (~30 min)

Read [pgvector-redis-caching.md](../theory/pgvector-redis-caching.md) — pgvector + hybrid retrieval sections.

### Step 2 — Database (~45 min)

- Enable pgvector extension
- Alembic migrations: `documents`, `chunks`, `ingestion_runs`
- See [backend.md](../project/backend.md) entity model

```bash
cd ai-radar/backend
alembic upgrade head
```

### Step 3 — Embed pipeline (~90 min)

Implement chunk → embed → store. Reuse Week 3 patterns if available.

```bash
python -m app.jobs.run_ingestion
```

### Step 4 — Lab 2 (~60 min)

Follow [Lab 2](../labs/lab-02-pgvector-retrieval.md) — retrieval smoke test.

### Step 5 — Feed API (~45 min)

Implement `GET /api/v1/feed` — verify with curl.

### Step 6 — Scheduler skeleton (~30 min)

Register ingestion task (APScheduler or Celery) — manual trigger OK for today.

### Step 7 — Deliverable

- [ ] ≥ **50 documents** in DB with embeddings
- [ ] `ingestion_report.json` — counts, errors, duration
- [ ] `retrieval_eval_smoke.json` from Lab 2
- [ ] Phase 1 boxes in [phase-1-foundation.md](../project/phases/phase-1-foundation.md)

### Step 8 — Close out

- [ ] Mark Day 2 + Phase 1 complete in [progress.md](../progress.md)

---

## Done when

- [ ] Corpus searchable via hybrid retriever
- [ ] Feed API returns real items
- [ ] Phase 1 milestone checked

---

## Tomorrow

**→ [Day 3 — LangGraph + MCP](day-03.md)** — start with [langgraph-orchestration.md](../theory/langgraph-orchestration.md)
