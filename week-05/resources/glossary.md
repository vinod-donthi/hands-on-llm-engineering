# Week 5 Glossary

> [← README](../README.md) · [Reading List](reading-list.md)

| Term | Definition |
|------|------------|
| **ARQ** | Async Redis Queue — Python job runner built on asyncio and Redis. [Theory →](../theory/background-queues.md) |
| **Backpressure** | Signaling overload by rejecting/delaying work (503) instead of unbounded queues. [Theory →](../theory/scaling-cost-backpressure.md) |
| **Container Apps** | Azure managed service for running containers with scale rules and HTTPS ingress. [Theory →](../theory/azure-deployment.md) |
| **Cosine similarity** | Measure of how similar two embedding vectors are (1.0 = same direction). [Theory →](../theory/semantic-caching.md) |
| **Exact cache** | Cache keyed by hash of normalized query text — identical strings only. [Theory →](../theory/redis-patterns.md) |
| **Health probe** | Automated check if a service is alive (`/health`) or ready for traffic (`/ready`). [Theory →](../theory/fastapi-production.md) |
| **HPA** | Horizontal Pod Autoscaler — Kubernetes scales replica count by metrics. **Optional** Week 5. [Theory →](../theory/azure-deployment.md) |
| **Idempotent job** | Job safe to retry without duplicate LLM calls or side effects. [Theory →](../theory/background-queues.md) |
| **Langfuse** | Open-source LLM observability platform — traces, costs, evals. [Theory →](../theory/observability.md) |
| **Lifespan hook** | FastAPI startup/shutdown context for connection pools. [Theory →](../theory/fastapi-production.md) |
| **OpenTelemetry (OTEL)** | Vendor-neutral standard for distributed traces and metrics. [Theory →](../theory/observability.md) |
| **Readiness probe** | Check that dependencies are OK before sending user traffic. [Theory →](../theory/fastapi-production.md) |
| **Semantic cache** | Cache keyed by embedding similarity — hits paraphrased queries. [Theory →](../theory/semantic-caching.md) |
| **Span** | One timed operation within a distributed trace. [Theory →](../theory/observability.md) |
| **Structlog** | Python structured logging library — JSON-friendly output. [Theory →](../theory/fastapi-production.md) |
| **Token bucket** | Rate-limit algorithm allowing bursts up to bucket capacity. [Theory →](../theory/redis-patterns.md) |
| **Trace** | End-to-end record of one request across services. [Theory →](../theory/observability.md) |
| **TTL** | Time to live — Redis key auto-expiry in seconds. [Theory →](../theory/redis-patterns.md) |
