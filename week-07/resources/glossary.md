# Week 7 Glossary

> [← README](../README.md) · Optional deep dives: [appendix](../../appendix/)

| Term | Definition |
|------|------------|
| **ADR** | Architecture Decision Record — documents context, decision, and consequences for a technical choice. |
| **Agentic RAG** | RAG where an agent loops retrieve, grade, and re-query until context is sufficient. |
| **Community summary** | GraphRAG node summarizing a cluster of related entities/documents. *(Optional topic)* |
| **Distillation** | Training a small **student** model to mimic a larger **teacher** model's outputs. |
| **Fine-tuning** | Updating model weights (or adapters) on task-specific examples after pre-training. |
| **GraphRAG** | Retrieval using a knowledge graph and community summaries, not just vector similarity. *(Optional)* |
| **LoRA** | Low-Rank Adaptation — efficient fine-tuning via small adapter matrices. |
| **Long context** | Passing full documents in the prompt instead of retrieving chunks. |
| **MCP** | Model Context Protocol — standard for exposing tools to LLM agents. |
| **Needle-in-haystack** | Benchmark testing whether a model finds a fact buried in huge context. |
| **PEFT** | Parameter-Efficient Fine-Tuning — family of methods including LoRA. |
| **Prefill** | Processing input tokens before generation begins — dominates long-context cost. |
| **RAG** | Retrieval Augmented Generation — fetch relevant chunks, then generate answer. |
| **SSRF** | Server-Side Request Forgery — attack via malicious URLs in fetch tools. |
| **Student model** | Small, fast model trained to approximate a teacher. |
| **Teacher model** | Large, high-quality model producing training targets for distillation. |

---

## Cross-week terms

| Term | Week | Link |
|------|------|------|
| Hybrid retrieval | 3 | [week-03/theory](../../week-03/theory/README.md) |
| LangGraph | 4 | [week-04/theory/langgraph.md](../../week-04/theory/langgraph.md) |
| RAGAS faithfulness | 3 | [week-03/theory/rag-evaluation-ragas.md](../../week-03/theory/rag-evaluation-ragas.md) |
| Semantic cache | 5 | [week-05/theory/semantic-caching.md](../../week-05/theory/semantic-caching.md) |
