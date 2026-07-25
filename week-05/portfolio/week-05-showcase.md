# Week 5 Portfolio — Production AI Stack Showcase

> [← README](../README.md) · [Resume Bullets](resume-bullets.md)

Use this template for GitHub README, portfolio site, or interview walkthrough.

---

## Project title

**Production AI Stack** — Production-grade RAG deployment with Redis caching, ARQ workers, and Langfuse observability.

## One-liner

Hardened a RAG service into a multi-container stack with semantic caching (35%+ hit rate on FAQ traffic), sub-second cached responses, and full LLM trace visibility.

## Architecture (include diagram)

Paste Mermaid from [project/architecture.md](../project/architecture.md) or export from `docker compose` + draw.io.

## Key metrics (fill from your lab artifacts)

| Metric | Your value |
|--------|------------|
| Semantic cache hit rate | e.g. 38% on test suite |
| Exact cache hit rate | e.g. 12% |
| p95 latency (uncached) | e.g. 1.8s |
| p95 latency (cached) | e.g. 8ms |
| Cost per 1k requests | e.g. $2.40 → $1.55 with cache |
| Load test (20 users, 60s) | From `load_smoke_results.json` |

## Technical highlights

1. **FastAPI production patterns** — lifespan pools, `/health` + `/ready`, request ID middleware
2. **Two-tier cache** — semantic (embedding similarity ≥ 0.92) + exact Redis
3. **ARQ workers** — async RAG for long queries; cron reindex
4. **Langfuse** — nested spans: embed → retrieve → generate with cost attribution
5. **Backpressure** — 503 when queue depth exceeded; 429 rate limits

## Demo script (2 minutes)

```bash
docker compose up -d
# 1. Show /ready
curl -s localhost:8000/ready | jq .

# 2. First query (miss)
curl -s -X POST localhost:8000/api/v1/rag/query \
  -H "Content-Type: application/json" \
  -d '{"query":"What is our SLA?"}' | jq .cache_hit

# 3. Paraphrase (semantic hit)
curl -s -X POST localhost:8000/api/v1/rag/query \
  -H "Content-Type: application/json" \
  -d '{"query":"Tell me about service level agreements"}' | jq .

# 4. Open Langfuse trace — show spans
```

## Screenshots to capture

- [ ] `docker compose ps` — all healthy
- [ ] Langfuse trace with nested spans
- [ ] `cache_report.json` similarity score
- [ ] Optional: Azure Container Apps URL

## Links

| Item | URL |
|------|-----|
| GitHub repo | `your-repo` |
| Langfuse project | `cloud.langfuse.com/...` |
| Live demo | Optional Azure URL |

## Lessons learned (2–3 bullets)

- Example: "Started semantic threshold at 0.95 — lowered to 0.92 after measuring paraphrase scores"
- Example: "Worker shared Redis URL with API — fixed hostname for Compose networking"
