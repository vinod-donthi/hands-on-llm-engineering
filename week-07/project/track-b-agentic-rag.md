# Track B — Agentic RAG Module

> Week 7 Project · [← Overview](overview.md) · [ADR Template](adr-template.md)

**Choose Track B when** Day 1 matrix favors RAG/agentic: changing corpus, multi-hop questions, tools + docs combined.

---

## Build scope

1. **LangGraph** agentic RAG from Lab 4 (`plan → retrieve → grade → rewrite → generate`)
2. **Hybrid retrieval** — Week 3 BM25 + dense + rerank
3. **MCP tools** — production server from Lab 6 (`web_search`, `fetch_url` with auth)
4. **Trace API** — return `steps[]` for debugging and portfolio

---

## Graph configuration

| Setting | Default | Notes |
|---------|---------|-------|
| `max_retrieval_steps` | 3 | Hard cap |
| `top_k` | 8 | Chunks per retrieve |
| `grader_model` | gpt-4o-mini | Structured output |
| `generate_model` | gpt-4o-mini | Citations required |

---

## API surface

| Endpoint | Purpose |
|----------|---------|
| `POST /api/v1/agent/query` | Agentic RAG answer + trace |
| `POST /api/v1/rag/classic` | Single-shot baseline for A/B |
| `GET /api/v1/agent/trace/{id}` | Fetch stored trace |

### Sample response

```json
{
  "answer": "EU retention is 90 days; US SOC2 appendix specifies 30-day backups...",
  "citations": ["eu-policy:2", "soc2-appendix:1"],
  "steps": [
    {"node": "retrieve", "query": "EU retention", "chunk_count": 4},
    {"node": "grade_context", "sufficient": false},
    {"node": "rewrite_query", "query": "SOC2 backup retention"},
    {"node": "retrieve", "chunk_count": 3},
    {"node": "generate", "latency_ms": 890}
  ],
  "model": "gpt-4o-mini"
}
```

---

## Eval requirements (Day 7)

- Agentic beats classic on ≥60% of multihop golden set **or**
- Documented latency/cost tradeoff with faithfulness gain

---

## ADR sections to emphasize

- Why multi-hop required agentic loop
- `max_steps` and cost cap choices
- MCP tool risk tiers and auth

[← Overview](overview.md) · [Backend](backend.md)
