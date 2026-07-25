# Production AI Stack — Backend

> Week 5 Project · [← Architecture](architecture.md) · [API](api.md)

## Module map

| Module | Purpose |
|--------|---------|
| `main.py` | App factory, lifespan, middleware registration |
| `worker.py` | ARQ settings, job functions, cron reindex |
| `core/config.py` | `pydantic-settings` from env |
| `core/redis.py` | Async pool create/close |
| `core/logging.py` | structlog configure |
| `middleware/request_id.py` | `X-Request-ID` |
| `middleware/rate_limit.py` | Redis token bucket |
| `middleware/cost_cap.py` | Pre-flight token estimate |
| `services/exact_cache.py` | SHA256 key cache |
| `services/semantic_cache.py` | Embedding similarity cache |
| `services/rag_pipeline.py` | Week 3 RAG orchestration |
| `routes/health.py` | `/health`, `/ready`, `/version` |
| `routes/rag.py` | Sync query endpoint |
| `routes/jobs.py` | Async job enqueue + status |

## Lifespan contract

```python
@asynccontextmanager
async def lifespan(app: FastAPI):
    configure_logging()
    app.state.redis = await create_redis_pool(settings.redis_url)
    init_langfuse(settings)
    yield
    await langfuse_flush()
    await app.state.redis.close()
```

## RAG pipeline integration

Wrap existing Week 3 code — do not rewrite retrieval logic:

```python
from langfuse.decorators import observe

@observe(name="rag_answer")
async def rag_answer(query: str, user_id: str | None = None) -> RagResponse:
    # 1. semantic cache (caller may already check — avoid double)
    # 2. embed + retrieve + generate with nested @observe children
    # 3. return RagResponse(answer, citations, cost_usd, ...)
```

## Middleware order

Register in `main.py` (last added = outermost):

```python
app.add_middleware(CostCapMiddleware)
app.add_middleware(RateLimitMiddleware)
app.add_middleware(RequestIdMiddleware)
```

## Cost cap middleware sketch

```python
ESTIMATED_OUTPUT_TOKENS = 500

async def dispatch(self, request, call_next):
    if request.url.path.startswith("/api/v1/rag"):
        body = await request.body()
        # re-inject body for downstream
        estimated = estimate_cost_from_body(body)
        if estimated > settings.max_cost_usd_per_request:
            raise HTTPException(402, detail="Request exceeds cost cap")
    return await call_next(request)
```

## Worker jobs

| Job | Trigger | Idempotent key |
|-----|---------|----------------|
| `run_rag_async` | POST `/jobs/rag` | `job_id` |
| `reindex_documents` | Cron 03:00 UTC | `reindex:{date}` |

## Tests (recommended)

```bash
pytest tests/test_health.py tests/test_cache.py -q
```

Minimum: health routes, cache key normalization, rate limit returns 429.

## Next

[API endpoints](api.md) · [Lab 1](../labs/lab-01-fastapi-production.md)
