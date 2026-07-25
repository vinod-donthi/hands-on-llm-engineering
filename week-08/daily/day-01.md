# Day 1 — Phase 1: Architecture & Ingestion Scaffold

> **You are here:** Day 1 of 7 · Phase 1 of 4 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Start Here](../START-HERE.md) (setup once) |
| **Today's outcome** | AI Radar scaffold + RSS/GitHub smoke fetch |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-08-work/` or `~/ai-learning/week-08-work/` |
| **Stop when** | `ingestion_smoke.json` exists |

**Catch-up:** skip to Step 5 (lab); skim theory Concepts only.

---

## Steps

### Step 1 — Theory: Capstone architecture (~30 min)

Read [capstone-architecture-overview.md](../theory/capstone-architecture-overview.md) — Concepts, diagram, checkpoint.

### Step 2 — Theory: Ingestion & scheduling (~25 min)

Read [ingestion-scheduling.md](../theory/ingestion-scheduling.md) — RSS + GitHub sections (scheduler depth on Day 6).

### Step 3 — Project spec (~20 min)

Skim [phase-1-foundation.md](../project/phases/phase-1-foundation.md) + [architecture.md](../project/architecture.md) folder tree.

### Step 4 — Scaffold (~45 min)

```bash
cd ~/ai-learning/week-08-work
source .venv/bin/activate
mkdir -p ai-radar/backend/app/{api,ingestion,db,rag,jobs}
mkdir -p ai-radar/config ai-radar/artifacts
# Minimal FastAPI main.py + health route — see project/backend.md
```

Start Postgres:

```bash
cd ai-radar
docker compose up -d postgres   # add compose file from project/docker.md
```

### Step 5 — Lab: ingestion smoke (~90 min)

Follow [Lab 1](../labs/lab-01-ingestion-smoke.md) — RSS + GitHub fetch to JSON.

### Step 6 — Config (~30 min)

Create `config/sources.yaml` with ≥ 5 RSS feeds + ≥ 2 GitHub queries.

### Step 7 — Deliverable

- [ ] `ingestion_smoke.json` — fetched items with title, url, source
- [ ] `GET /api/v1/health` returns OK (DB can be `pending` today)
- [ ] `config/sources.yaml` committed to work repo

### Step 8 — Close out (~15 min)

- [ ] Self-test checkpoint questions in theory files
- [ ] Mark Day 1 in [progress.md](../progress.md)

---

## Done when

- [ ] `ingestion_smoke.json` in work dir
- [ ] Project scaffold exists under `ai-radar/`
- [ ] Day 1 row checked in `progress.md`

---

## Tomorrow

**→ [Day 2 — pgvector Corpus](day-02.md)** — start with [pgvector-redis-caching.md](../theory/pgvector-redis-caching.md)
