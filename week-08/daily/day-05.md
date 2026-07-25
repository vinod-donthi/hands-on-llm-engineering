# Day 5 — Phase 3: Dashboard + Semantic Cache

> **You are here:** Day 5 of 7 · Phase 3 of 4 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 4](day-04.md) |
| **Today's outcome** | Next.js dashboard live; Redis cache hits on similar queries |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-08-work/` or `~/ai-learning/week-08-work/` |
| **Stop when** | `cache_hit_report.json` exists |

**Catch-up:** Lab 5 + minimal feed page; skip trend chart.

---

## Steps

### Step 1 — Theory: Dashboard (~25 min)

Read [nextjs-dashboard-patterns.md](../theory/nextjs-dashboard-patterns.md).

### Step 2 — Theory: Redis cache (~25 min)

Read [pgvector-redis-caching.md](../theory/pgvector-redis-caching.md) — Redis semantic cache section.

### Step 3 — Frontend scaffold (~90 min)

```bash
cd ai-radar/frontend
npx create-next-app@latest . --typescript --tailwind --app --no-src-dir
```

Build feed + query pages per [frontend.md](../project/frontend.md).

### Step 4 — Redis (~45 min)

Add Redis to `docker compose`; implement `app/cache/semantic.py`.

### Step 5 — Lab 5 (~60 min)

Follow [Lab 5](../labs/lab-05-redis-semantic-cache.md).

### Step 6 — Deliverable

- [ ] Dashboard at `:3000` shows feed
- [ ] Query panel returns answer + citations
- [ ] `cache_hit_report.json` — 2nd paraphrased query hits cache

### Step 7 — Close out

- [ ] Mark Day 5 in [progress.md](../progress.md)

---

## Done when

- [ ] End-to-end UI → API → agent → UI works
- [ ] Cache hit demonstrated with metrics

---

## Tomorrow

**→ [Day 6 — Digest + Email](day-06.md)** — skim [ingestion-scheduling.md](../theory/ingestion-scheduling.md) digest section
