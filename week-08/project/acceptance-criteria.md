# Week 8 Acceptance Criteria — AI Radar

> [← Overview](overview.md) · [Testing](testing-strategy.md) · [GitHub README](github-readme-spec.md)

**Ship rule:** All required boxes checked before you declare the 8-week program complete.

---

## Phase 1 — Foundation

- [ ] FastAPI app boots; `GET /api/v1/health` returns OK
- [ ] `config/sources.yaml` — ≥ 5 RSS + ≥ 2 GitHub queries
- [ ] RSS + GitHub ingestion fetches real items
- [ ] Documents deduped by URL
- [ ] pgvector extension enabled; migrations applied
- [ ] ≥ **50 documents** with embedded chunks in DB
- [ ] `GET /api/v1/feed` returns ingested items
- [ ] `ingestion_report.json` artifact produced
- [ ] Scheduler module wired (manual trigger acceptable)

---

## Phase 2 — Intelligence

- [ ] LangGraph agent graph with plan → tools → synthesize
- [ ] MCP tools: **search**, **RSS lookup**, **GitHub search** (minimum 3)
- [ ] Agentic RAG node with retrieve/critique loop (max 3 iterations)
- [ ] `POST /api/v1/radar/query` returns answer + `citations[]`
- [ ] Every factual claim has ≥ 1 citation URL
- [ ] `agent_query_trace.json` artifact with tool trace
- [ ] ADR: agentic RAG vs static retrieval documented

---

## Phase 3 — Product

- [ ] Next.js dashboard: feed + query pages functional
- [ ] `GET /api/v1/trends` or equivalent trend data on UI
- [ ] Redis semantic cache on query path
- [ ] Paraphrased query achieves cache hit (document threshold)
- [ ] Digest job generates markdown/HTML summary
- [ ] `digest_preview.html` artifact OR email sent
- [ ] Celery Beat / APScheduler cron config in `.env`

---

## Phase 4 — Production

- [ ] RAGAS eval: ≥ 10 golden samples
- [ ] `rag_eval_report.json` meets `.env` threshold minimums
- [ ] GitHub Actions eval gate fails on > 5% regression (tested once)
- [ ] `docker compose up` — postgres, redis, backend, worker healthy
- [ ] `pytest` unit + integration pass
- [ ] Public README meets [github-readme-spec.md](github-readme-spec.md)
- [ ] No secrets in repo; `.env.example` complete

---

## Quality bars

| Metric | Minimum |
|--------|---------|
| Ingestion success rate | ≥ 90% of sources (document failures) |
| Query latency (cache miss) | < 15s p95 locally |
| Query latency (cache hit) | < 500ms |
| RAGAS faithfulness | ≥ 0.75 |
| RAGAS context precision | ≥ 0.70 |

---

## Portfolio

- [ ] [Resume bullets](../portfolio/resume-bullets.md) customized with your metrics
- [ ] [Showcase doc](../portfolio/week-08-showcase.md) filled in
- [ ] GitHub repo public (recommended)

---

## Optional (does not block completion)

- [ ] Azure deployment live URL
- [ ] DeepEval pytest suite
- [ ] Langfuse trace dashboard
- [ ] Lab 7 extended eval tuning

**Congratulations** when all required boxes are checked.
