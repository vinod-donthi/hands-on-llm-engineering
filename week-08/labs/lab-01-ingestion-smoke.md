# Lab 1: Ingestion Smoke Test

> Week 8 Labs · Day 1 · [← README](README.md) · [Ingestion theory](../theory/ingestion-scheduling.md)

> **Learning path:** This file — specs only.  
> **Work dir:** `~/ai-learning/week-08-work/`

## Setup

```bash
cd ~/ai-learning/week-08-work
source .venv/bin/activate
```

**Estimated cost:** $0 (RSS + GitHub free tier)

**Goal:** When this lab passes, you have proof your fetchers pull real AI news items before you embed anything.

---

## Task

Create `lab01_ingestion_smoke.py` that:

1. Loads `ai-radar/config/sources.yaml`
2. Fetches ≥ 5 RSS feeds and ≥ 2 GitHub queries
3. Normalizes to common schema
4. Writes `artifacts/ingestion_smoke.json`

### Expected output shape

```json
{
  "fetched_at": "2026-07-25T10:00:00Z",
  "items": [
    {
      "title": "Example model release",
      "url": "https://example.com/post",
      "source": "openai_rss",
      "category": "model",
      "published_at": "2026-07-24T12:00:00Z",
      "body_preview": "First 200 chars..."
    }
  ],
  "counts": {
    "rss": 18,
    "github": 6,
    "errors": 1
  }
}
```

---

## Implementation hints

- RSS: `feedparser.parse(url)` — handle bozo feeds gracefully
- GitHub: `PyGithub` search with `GITHUB_TOKEN` from `.env`
- Dedupe by URL within this run
- Log errors in `counts.errors` — do not fail entire job on one bad feed

---

## Acceptance

- [ ] ≥ 15 total items in JSON
- [ ] Each item has `title`, `url`, `source`
- [ ] At least one error documented OR zero errors noted
- [ ] No API keys in output file

---

## Next

[Day 2 playbook](../daily/day-02.md) → [Lab 2](lab-02-pgvector-retrieval.md)
