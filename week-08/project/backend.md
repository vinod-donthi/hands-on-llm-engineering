# AI Radar — Backend Spec

> Week 8 Capstone · [Architecture](architecture.md) · [API](api.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/backend/`

The backend is a **FastAPI** service plus **Celery worker** for scheduled jobs. Business logic lives in services; routes stay thin.

---

## Module map

| Module | Responsibility |
|--------|----------------|
| `app/main.py` | App factory, lifespan (DB pool, Redis), CORS |
| `app/config.py` | Pydantic settings from `.env` |
| `app/api/*` | HTTP routes — validate, call service, return schema |
| `app/ingestion/*` | Fetch, normalize, dedupe, chunk |
| `app/rag/*` | Embed, store, hybrid retrieve |
| `app/agents/*` | LangGraph graph, agentic RAG nodes |
| `app/mcp/*` | MCP tool server + adapters |
| `app/cache/semantic.py` | Redis embedding similarity cache |
| `app/jobs/*` | Celery tasks: ingestion, digest |
| `app/notifications/email.py` | Resend/SMTP HTML digest |
| `app/eval/*` | RAGAS runner + threshold check |
| `app/db/*` | SQLAlchemy models, async session |

---

## Ingestion pipeline

```python
# Pseudocode — app/ingestion/pipeline.py
async def run_ingestion(run_id: str) -> IngestionReport:
    items = []
    items += await rss_fetcher.fetch_all(config.sources.rss)
    items += await github_sync.fetch_queries(config.sources.github)
    for raw in dedupe_by_url(items):
        doc = normalize(raw)
        if not await store.document_exists(doc.url):
            chunks = chunker.split(doc.text)
            vectors = await embedder.embed_batch([c.text for c in chunks])
            await store.save_document_with_chunks(doc, chunks, vectors)
    return report
```

**Expected:** `ingestion_report.json` with `documents_added`, `chunks_added`, `errors[]`, `duration_sec`.

---

## LangGraph agent

| Node | Input | Output |
|------|-------|--------|
| `plan` | user query | `{strategy: "rag"|"search"|"both"}` |
| `tool_router` | plan | tool call or branch |
| `mcp_search` | query | live snippets |
| `agentic_rag` | query | retrieved chunks + scores |
| `critique` | chunks | `{sufficient: bool}` |
| `synthesize` | context | markdown answer + citations |

Use **Postgres checkpointer** for production path; Sqlite OK for capstone dev.

---

## Agentic RAG node

The retrieve node must:

1. Run hybrid search (pgvector + BM25/tsvector)
2. Ask a lightweight LLM: *"Do these 8 chunks answer the query?"*
3. If no → expand query or call MCP search → retrieve again (max 2 loops)

See [agentic-rag-patterns.md](../theory/agentic-rag-patterns.md).

---

## Semantic cache

```python
async def query_with_cache(query: str) -> QueryResponse:
    embedding = await embedder.embed_query(query)
    cached = await semantic_cache.find_similar(embedding, threshold=0.92)
    if cached:
        return cached.with_hit(True)
    response = await agent_graph.ainvoke({"query": query})
    await semantic_cache.store(embedding, response, ttl=3600)
    return response
```

Log `cache_hit` on every response for dashboard cost metrics.

---

## Middleware & observability

| Middleware | Purpose |
|------------|---------|
| Request ID | Correlate logs + traces |
| Cost guard | Reject if `cost_usd` estimate > `MAX_COST_USD_PER_REQUEST` |
| Structured logging | `structlog` JSON — query, latency, tokens |

Optional: OpenTelemetry spans on agent nodes (Week 5 pattern).

---

## Tests (see testing-strategy.md)

| Layer | Location | Examples |
|-------|----------|----------|
| Unit | `tests/unit/` | chunker, dedupe, cache similarity |
| Integration | `tests/integration/` | ingestion → pgvector, query API |
| Eval | `tests/eval/` | RAGAS golden set |

```bash
cd backend && pytest tests/unit tests/integration -q
```

---

## Makefile targets

```makefile
run:
\tuvicorn app.main:app --reload --port 8000

worker:
\tcelery -A app.jobs.celery_app worker -l info

beat:
\tcelery -A app.jobs.celery_app beat -l info

ingest:
\tpython -m app.jobs.run_ingestion

digest:
\tpython -m app.jobs.run_digest

eval:
\tpython -m app.eval.run_ragas

test:
\tpytest
```

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Blocking calls in async routes | Use `asyncpg`, `httpx.AsyncClient` |
| Giant transactions per feed item | Commit per document — partial progress on failure |
| Agent loop unbounded | Max 3 graph iterations — return partial + disclaimer |

---

## Next

[API endpoints](api.md) · [Docker](docker.md) · [Eval](eval.md)
