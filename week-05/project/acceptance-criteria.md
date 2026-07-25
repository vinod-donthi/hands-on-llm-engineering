# Production AI Stack — Acceptance Criteria

> Week 5 Project · [← Overview](overview.md) · [Exit criteria](../checkpoints/exit-criteria.md)

Check every box before declaring Week 5 complete.

## Infrastructure

- [ ] `docker compose up -d --build` starts without manual steps
- [ ] `api` and `redis` services report **healthy** in `docker compose ps`
- [ ] `worker` service running and processing jobs
- [ ] `GET /health` returns 200
- [ ] `GET /ready` returns 200 with Redis check passing
- [ ] Stopping `redis` causes `/ready` to return 503

## FastAPI production

- [ ] Lifespan opens/closes Redis pool cleanly
- [ ] Every response includes `X-Request-ID`
- [ ] Logs are JSON with `request_id`, `latency_ms`, `event`
- [ ] Graceful shutdown on `docker compose stop api` (no stack traces)

## Redis

- [ ] Exact cache: identical query twice → second hit < 20ms
- [ ] Rate limit: burst returns at least one HTTP 429
- [ ] Session store persists multi-turn context *(or documented skip)*

## Semantic cache

- [ ] Paraphrased query hits cache at similarity ≥ configured threshold
- [ ] `cache_report.json` documents similarity score
- [ ] False-positive mitigation documented in `deploy_checklist.md`

## Background jobs

- [ ] `POST /api/v1/jobs/rag` returns 202 in < 100ms
- [ ] Worker completes job; `GET /jobs/{id}` returns result
- [ ] Job idempotency: completed job retry does not double-charge LLM

## Observability

- [ ] Langfuse trace for full RAG request with ≥ 3 spans
- [ ] Trace metadata includes `request_id`, `cost_usd`, `cache_hit`
- [ ] `trace_export.json` saved in work dir

## Cost and backpressure

- [ ] Request over `MAX_COST_USD_PER_REQUEST` rejected with 402
- [ ] Queue depth guard returns 503 when overloaded *(or simulated in test)*
- [ ] Daily budget counter in Redis *(or documented middleware stub)*

## Load test

- [ ] `load_smoke_results.json` from Locust: 20 users, 60s
- [ ] `p95_ms` < 3000 at lab scale *(document if higher)*
- [ ] `failures_pct` < 5%

## Documentation

- [ ] `deploy_checklist.md` — services, env vars, verify commands
- [ ] README in work dir with local run instructions
- [ ] [Portfolio draft](../portfolio/week-05-showcase.md) started

## Optional (not required)

- [ ] Azure Container Apps URL live
- [ ] OpenTelemetry OTLP export to collector
- [ ] Qdrant in Compose with reindex cron

---

**All required boxes must be checked** to proceed to Week 6.
