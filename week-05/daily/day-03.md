# Day 3 — Redis: Cache, Rate Limits, Sessions

> **You are here:** Day 3 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 2 — Docker Compose](day-02.md) |
| **Today's outcome** | Exact cache + token-bucket rate limit on RAG endpoint |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-05-work/` or `~/ai-learning/week-05-work/` |
| **Stop when** | `redis_cache_demo.json` shows cache hit + 429 under abuse |

**Catch-up:** lab Steps 3–5 only; skim redis-patterns Concepts.

---

## Steps

### Step 1 — Theory: Redis patterns (~30 min)

Read [redis-patterns.md](../theory/redis-patterns.md) — key naming, TTL, token bucket, session keys.

### Step 2 — Lab spec (~10 min)

Read [Lab 3](../labs/lab-03-redis.md).

### Step 3 — Redis client in lifespan (~30 min)

Add `app/core/redis.py` — async pool from `REDIS_URL`, close on shutdown.

### Step 4 — Cache + rate limit middleware (~90 min)

- Exact cache: `cache:rag:{hash(query)}` → JSON response, TTL 300s
- Rate limit: `ratelimit:{client_id}` sliding window or token bucket

### Step 5 — Demo script (~45 min)

```bash
python lab03_redis_cache_demo.py
```

Same query twice → second call `"cache_hit": true`. Burst 70 requests → some return 429.

### Step 6 — Deliverable

- [ ] `redis_cache_demo.json` with cache hit row and rate-limit row

### Step 7 — Close out (~15 min)

- [ ] Mark Day 3 in [progress.md](../progress.md)

---

## Done when

- [ ] Cache and rate limit demonstrated in JSON report
- [ ] Day 3 row checked in `progress.md`

---

## Tomorrow

**→ [Day 4 — Semantic Caching](day-04.md)** — start with [semantic-caching.md](../theory/semantic-caching.md)
