# Week 5 Resume Bullets

> [← Showcase](week-05-showcase.md) · [LinkedIn Notes](linkedin-notes.md)

Pick 2–3 bullets. Quantify where possible using your lab artifacts.

---

## Template bullets (customize numbers)

- Deployed **Production AI Stack** — FastAPI RAG service on Docker Compose (API, Redis, ARQ workers) with health/readiness probes and structured JSON logging for production incident response.

- Implemented **two-tier caching** (semantic embedding similarity + exact Redis) reducing LLM API calls by **~35%** on FAQ-style queries and cutting p95 latency from **1.8s to 8ms** on cache hits.

- Built **async job pipeline** with ARQ and Redis — long-running RAG requests return in **<100ms** (202 + job poll) instead of blocking HTTP connections.

- Integrated **Langfuse + OpenTelemetry** for end-to-end LLM tracing (embed, retrieve, generate spans) with per-request **cost_usd** and **request_id** correlation for support debugging.

- Enforced **rate limits and cost caps** via Redis token bucket and pre-flight token estimation — prevented runaway OpenAI spend under load tests (**20 concurrent users**, **<5% error rate**).

- *(Optional)* Deployed stack to **Azure Container Apps** with managed Redis and HTTP scale rules — same containers as local Compose.

---

## Action verbs by skill

| Skill | Verbs |
|-------|-------|
| Infrastructure | Deployed, containerized, orchestrated |
| Performance | Reduced latency, optimized cache hit rate |
| Reliability | Implemented backpressure, health probes |
| Observability | Instrumented, traced, correlated |

---

## Avoid

- "Used Docker" without outcome
- "Integrated AI" without specificity
- Unquantified "improved performance"

## Pair with

Link to repo + Langfuse screenshot in [week-05-showcase.md](week-05-showcase.md).
