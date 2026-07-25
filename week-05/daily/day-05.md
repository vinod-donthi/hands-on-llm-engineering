# Day 5 — Background Queues (ARQ)

> **You are here:** Day 5 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 4 — Semantic Cache](day-04.md) |
| **Today's outcome** | Long RAG jobs run in ARQ worker; API returns job ID immediately |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-05-work/` or `~/ai-learning/week-05-work/` |
| **Stop when** | `job_run_trace.json` shows enqueue → worker → completed |

**Catch-up:** one job type (`run_rag_async`) only; skip cron reindex.

---

## Steps

### Step 1 — Theory: Background queues (~30 min)

Read [background-queues.md](../theory/background-queues.md) — ARQ vs Celery, retries, idempotency.

### Step 2 — Lab spec (~10 min)

Read [Lab 5](../labs/lab-05-background-jobs.md).

### Step 3 — Worker service in Compose (~30 min)

Add `worker` service to `docker-compose.yml` running `arq app.worker.WorkerSettings`.

### Step 4 — Job definitions (~90 min)

- `run_rag_async(job_id, query)` — full RAG pipeline, store result in Redis `job:{id}`
- `POST /api/v1/jobs/rag` → `{ "job_id": "..." }`
- `GET /api/v1/jobs/{job_id}` → status + result

### Step 5 — Demo script (~45 min)

```bash
python lab05_job_trace_demo.py
```

### Step 6 — Deliverable

- [ ] `job_run_trace.json` — timestamps: enqueued, started, finished, duration_ms

### Step 7 — Close out (~15 min)

- [ ] Mark Day 5 in [progress.md](../progress.md)

---

## Done when

- [ ] Async job completes via worker container
- [ ] Day 5 row checked in `progress.md`

---

## Tomorrow

**→ [Day 6 — Observability](day-06.md)** — start with [observability.md](../theory/observability.md)
