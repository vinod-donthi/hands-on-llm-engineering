# Week 8 Interview — Cheat Sheet

> One page before capstone defense · [← System Design](system-design.md)

---

## Elevator pitch

**AI Radar** — scheduled RSS/GitHub ingestion → pgvector corpus → LangGraph agent (MCP search + agentic RAG) → Next.js dashboard + daily email → RAGAS CI gate. Docker Compose; ~$20/week dev cost with semantic cache.

---

## Stack

| Layer | Tech |
|-------|------|
| API | FastAPI |
| Agent | LangGraph + MCP |
| DB | PostgreSQL + pgvector |
| Cache | Redis semantic |
| UI | Next.js |
| Jobs | Celery Beat |
| Eval | RAGAS + GitHub Actions |

---

## Query path (memorize)

```
Query → embed → Redis similar? → hit return
  miss → LangGraph plan → MCP? → agentic RAG → critique → synthesize + cite → cache set
```

---

## Key numbers (replace with yours)

| Metric | Your value |
|--------|------------|
| Documents ingested | ___ |
| Faithfulness | ___ |
| Cache hit latency | ___ ms |
| Agent miss latency | ___ ms |
| Cost/query | $___ |

---

## Phase deliverables

1. `ingestion_report.json` + 50 docs  
2. `agent_query_trace.json` + ADR  
3. Dashboard + `digest_preview.html`  
4. `rag_eval_report.json` + CI green  

---

## Tradeoff one-liners

- **Agentic RAG:** agent chooses retrieve vs live search  
- **MCP:** standard tool boundary  
- **pgvector:** one DB for metadata + vectors  
- **Semantic cache:** paraphrase hits — not exact match  

---

## Failures you handled

- RSS feed down → log + continue  
- Agent loop cap → partial answer  
- Eval regression → CI blocks PR  

---

## Links

[Architecture](../project/architecture.md) · [API](../project/api.md) · [Eval](../project/eval.md)
