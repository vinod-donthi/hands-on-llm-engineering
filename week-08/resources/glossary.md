# Week 8 Glossary — Capstone Terms

> Quick lookup · Deep dives in [theory/](../theory/) and prior weeks

| Term | Definition |
|------|------------|
| **Agentic RAG** | Agent decides when/how to retrieve instead of always fetching top-k chunks. [Theory →](../theory/agentic-rag-patterns.md) |
| **AI Radar** | Week 8 capstone — AI ecosystem monitoring system. [Overview →](../project/overview.md) |
| **Celery Beat** | Scheduler that triggers periodic tasks (ingestion, digest). |
| **Checkpointing (LangGraph)** | Saving graph state so agent resumes after failure. |
| **Context precision (RAGAS)** | Whether retrieved chunks were relevant to the question. |
| **Digest job** | Daily summarization + email of recent ingested items. |
| **Faithfulness (RAGAS)** | Whether answer claims are supported by retrieved context. |
| **Hybrid retrieval** | Combining vector search + keyword search (often RRF merge). |
| **Ingestion run** | One execution of fetch → normalize → embed → store. |
| **LangGraph** | Library for building stateful agent workflows as graphs. |
| **MCP** | Model Context Protocol — standard for exposing tools to agents. |
| **pgvector** | PostgreSQL extension for storing/querying embedding vectors. |
| **RRF** | Reciprocal Rank Fusion — merges multiple ranked retrieval lists. |
| **Semantic cache** | Cache hit when query *meaning* is similar (embedding cosine), not exact text. |
| **Tool trace** | Log of MCP/agent tool calls with inputs and latency. |

---

## Prior week terms still used

| Term | Week | Refresh |
|------|------|---------|
| Embedding | 1 | Vector representation of text |
| RAG | 3 | Retrieval-augmented generation |
| ReAct | 4 | Reason → act → observe loop |
| HITL | 4 | Human-in-the-loop approval |
| SSE | 2 | Server-sent events streaming |
| TTFT | 2 | Time to first token |

---

## Appendix

Optional deep dives: [appendix/](../../appendix/README.md)
