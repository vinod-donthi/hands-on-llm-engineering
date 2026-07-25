# Ingestion & Scheduling

> Week 8 Theory · Day 1 & 6 · [← capstone-architecture](capstone-architecture-overview.md) · Next: [pgvector-redis-caching](pgvector-redis-caching.md)

AI Radar stays useful only if the corpus stays fresh. **Ingestion** fetches external content; **scheduling** runs fetch and digest jobs on a clock without you clicking "sync."

---

## What problem are we solving?

LLM releases and GitHub repos appear daily. Manual bookmark checking does not scale. You need reliable fetch → normalize → store pipelines on a schedule.

### Worked scenario

Every **6 hours**, Celery Beat triggers `run_ingestion`. RSS fetcher pulls 12 new items; GitHub sync finds 3 trending repos; deduper skips 2 URLs already in Postgres; embedder adds 10 new documents. At **7 AM**, `run_digest` clusters yesterday's tags and emails a summary.

---

## Concepts

### Ingestion sources

| Source | Tool | Best for |
|--------|------|----------|
| RSS/Atom | feedparser | Official blogs, arXiv aggregators |
| GitHub Search API | PyGithub | New repos, releases |
| Light crawl | httpx + BeautifulSoup | Pages without RSS (cap depth at 1) |

Configure in `config/sources.yaml` — never hardcode URLs in Python.

### Normalization pipeline

```
raw item → extract title, url, published_at, body text → category tag → chunk → embed → store
```

**Sample normalized document:**

```json
{
  "url": "https://github.com/org/agent-kit",
  "title": "agent-kit: lightweight orchestration",
  "source": "github_search",
  "category": "tool",
  "published_at": "2026-07-24T09:00:00Z"
}
```

### Scheduling options

| Option | When to use |
|--------|-------------|
| **Celery Beat** | Production pattern (Week 5) — retries, visibility |
| **APScheduler** | Lighter capstone dev — OK for Phase 1 skeleton |
| OS cron | Avoid — no retry, hard to test |

Cron examples from `.env`:

```
INGESTION_CRON=0 */6 * * *    # every 6 hours
DIGEST_CRON=0 7 * * *         # 7 AM daily
```

### Digest job (Day 6)

1. Query documents where `published_at > now - 24h`
2. Cluster by embedding or tag overlap
3. LangGraph summarize node → markdown sections
4. Render HTML → Resend/SMTP

---

## Tradeoffs

| Approach | Pro | Con |
|----------|-----|-----|
| RSS-first | Stable, polite | Not all sites have feeds |
| Aggressive crawl | Coverage | Legal/robots + ops burden |
| Sync ingest in API request | Simple | Timeouts — use background jobs |

---

## Best practices

- Respect `robots.txt` and rate limits (GitHub: authenticated token)
- Log every run to `ingestion_runs` — surface failures on dashboard
- Idempotent ingestion: URL hash as unique key

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Re-embedding duplicates | Check URL exists before embed |
| Digest includes 200 items | Top-N by score + cluster representatives |
| Scheduler in API process | Separate worker container |

---

## Checkpoint

1. Why store sources in YAML?
2. What table tracks job success/failure?
3. Difference between ingestion cron and digest cron?
4. Name two RSS categories you'd track for AI Radar.
5. Why is digest a separate job from ingestion?

---

## Go deeper

| Resource | Why |
|----------|-----|
| [feedparser docs](https://feedparser.readthedocs.io/) | RSS edge cases |
| [GitHub REST rate limits](https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api) | Token planning |
| [phase-1-foundation.md](../project/phases/phase-1-foundation.md) | Day 1–2 tasks |

---

## Next

Day 1: [Lab 1](../labs/lab-01-ingestion-smoke.md) → [Day 2](../daily/day-02.md) · Day 6: [Lab 6](../labs/lab-06-email-digest-scheduler.md)
