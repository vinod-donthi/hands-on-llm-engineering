# Phase 3 — Product (Days 5–6)

> [← Phase 2](phase-2-intelligence.md) · [Phase 4 →](phase-4-production.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/`

**Goal:** A usable product surface — Next.js dashboard for feed/trends/query, Redis semantic cache for cost control, and a scheduled daily email digest.

---

## Day 5 Deliverables

| Artifact | Description |
|----------|-------------|
| Next.js app | Feed list, trend tags, query panel |
| Redis semantic cache | Integrated on `/api/v1/radar/query` |
| `cache_hit_report.json` | Lab 5 — 2nd identical-ish query hits cache |
| Docker Redis | In compose stack |

### Day 5 tasks

1. Read [nextjs-dashboard-patterns.md](../../theory/nextjs-dashboard-patterns.md) + [pgvector-redis-caching.md](../../theory/pgvector-redis-caching.md) (Redis section)
2. Build dashboard pages per [frontend.md](../frontend.md)
3. Cache: embed query → Redis GET similar → on miss run agent → SET with TTL 3600s
4. Run [Lab 5](../../labs/lab-05-redis-semantic-cache.md)

---

## Day 6 Deliverables

| Artifact | Description |
|----------|-------------|
| Digest job | `run_digest.py` — cluster + summarize + email |
| `digest_preview.html` | Lab 6 — rendered digest (send optional) |
| Celery Beat / APScheduler | `DIGEST_CRON` from `.env` |
| Trend detection | Simple: top TF-IDF tags or embedding cluster count |

### Day 6 tasks

1. Skim [ingestion-scheduling.md](../../theory/ingestion-scheduling.md) (digest section)
2. Digest pipeline: last 24h docs → LangGraph summarize node → HTML email
3. Wire Resend or SMTP per `.env`
4. Run [Lab 6](../../labs/lab-06-email-digest-scheduler.md)

---

## Digest content spec

| Section | Source |
|---------|--------|
| Headline summary | Agent synthesis over top 10 items |
| New models & tools | Filter `category=model` or tag |
| GitHub highlights | Items from GitHub ingestion |
| Papers & benchmarks | arXiv / benchmark tags |
| Trend of the day | Highest cluster growth vs 7-day baseline |

---

## Phase 3 Acceptance

- [ ] Dashboard loads feed from `GET /api/v1/feed`
- [ ] Query panel shows streaming or loading state + citations
- [ ] Semantic cache: paraphrased query hits cache (similarity ≥ threshold)
- [ ] Digest preview renders locally
- [ ] ≥ 1 digest email sent (or `digest_preview.html` if SMTP blocked)

---

## UX symptom → cause

| Symptom | Likely cause |
|---------|--------------|
| Dashboard empty | Ingestion job not run / wrong API URL |
| Cache never hits | Threshold too high (0.98) — try 0.90–0.92 |
| Digest duplicates | Missing url dedup in digest item selection |

---

## Next

**→ [Phase 4 — Production](phase-4-production.md)** · [Day 7 playbook](../../daily/day-07.md)
