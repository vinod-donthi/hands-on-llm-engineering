# Advanced AI Studio — Backend

> Week 7 Project · [← Architecture](architecture.md) · [API](api.md)

> **Work dir:** `~/ai-learning/week-07-work/advanced-ai-studio/backend/`

## Core modules

| Module | Track | Responsibility |
|--------|-------|----------------|
| `app/main.py` | Both | FastAPI app, middleware, lifespan |
| `app/config.py` | Both | Settings from `.env` |
| `app/models/router.py` | A | Fine-tuned vs baseline routing |
| `app/graph/agentic_rag.py` | B | LangGraph definition |
| `app/retrieval/` | B | Hybrid search (Week 3) |
| `app/mcp/production_server.py` | B | SSE MCP with auth |
| `app/eval/capstone_eval.py` | Both | Day 7 eval script |

## Middleware (Week 5 carry-over)

- Request ID / trace propagation
- Cost cap (`MAX_COST_USD_PER_REQUEST`)
- Rate limiting via Redis

## Tests

```bash
cd backend
pytest tests/ -v
```

Minimum tests:

- `test_router_falls_back_on_finetune_error` (Track A)
- `test_agentic_rag_max_steps` (Track B)
- `test_mcp_auth_rejects_invalid_key` (Track B)

## Dependencies

Installed via week-07 `requirements.txt` in work venv.

[← Architecture](architecture.md) · [API](api.md)
