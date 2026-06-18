# Day 6 — PostgreSQL History & Docker Compose

> **You are here:** Day 6 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 5](day-05.md) |
| **Today's outcome** | Full stack in Docker; runs persisted to Postgres |
| **Time** | 4–5h |
| **Work dir** | `week-02-work/` |
| **Stop when** | `docker compose up` healthy; run history visible |

**Catch-up:** Lab 6 is skippable — use in-memory run store and note in `progress.md`.

---

## Steps

### Step 1 — Docker spec (~20 min)

Read [project/docker.md](../project/docker.md)

### Step 2 — Lab spec (~10 min)

Read [Lab 6](../labs/lab-06-run-history.md)

### Step 3 — Database models (~60 min)

SQLAlchemy `Run` table: request_id, model_id, prompt hash, tokens, cost, latency, created_at.

### Step 4 — Docker Compose (~60 min)

```bash
cd model-benchmark-studio
docker compose up -d
docker compose ps   # postgres + backend healthy
```

### Step 5 — Persist runs (~90 min)

Hook comparison/stream endpoints to save runs; add `GET /api/v1/runs?limit=20`.

### Step 6 — Deliverable

- [ ] `docker compose up` succeeds
- [ ] At least 3 runs visible via API or SQL
- [ ] *(Optional skip)* document in-memory fallback if Postgres skipped

### Step 7 — Close out

- [ ] Mark Day 6 in [progress.md](../progress.md)

---

## Done when

- [ ] Stack runs in Docker **or** Lab 6 skip documented
- [ ] Day 6 checked in `progress.md`

---

## Tomorrow

**→ [Day 7 — Benchmark Capstone](day-07.md)** — [benchmarking-spec.md](../project/benchmarking-spec.md)
