# Week 3 Roadmap

> [← README](README.md) · [Progress Tracker](progress.md)

## Learning Path

**Default:** Follow [daily/day-XX.md](daily/) numbered steps in order (theory → lab → deliverable).

**Catch-up** (behind schedule): On each daily page, do lab/build steps + deliverables only; skim theory Concepts + takeaway.

```
Daily playbook (driver) → theory (linked steps) → lab/build → deliverable → progress.md → Tomorrow link
```

**Rule:** Good enough to continue > perfect completion.

---

## Weekly Outcomes

By end of Week 3 you will:

1. Parse and chunk documents with fixed, semantic, and parent-child strategies
2. Embed chunks and store vectors in Chroma (dev) and pgvector (production path)
3. Retrieve with hybrid BM25 + dense search fused by Reciprocal Rank Fusion (RRF)
4. Rerank candidates with a cross-encoder for precision at the top of the context window
5. Assemble context with citations and respect Week 2 context budgets
6. Build a 50+ pair golden dataset and run RAGAS evaluation
7. Preview agentic RAG — iterative retrieval when one pass fails
8. Ship **Doc Q&A Studio** — document Q&A chatbot with eval report

---

## Time Budget (Anti-Burnout)

| Constraint | Limit |
|------------|-------|
| Max per day | **5 hours** |
| Max per week | **28 hours** |
| Optional skip | **ONE** lab (recommend Lab 6 pgvector if behind) |

### Priority Order (catch-up only)

1. **Today's deliverable** from [daily/](daily/) playbook
2. **Labs / build** steps on that day
3. **Theory** — Concepts + AI engineer takeaway only
4. **Go Deeper** — skip unless interviewing

---

## Stack Scope (Week 3)

### Required

| Component | Choice | Role |
|-----------|--------|------|
| Embeddings | `text-embedding-3-small` | Dense retrieval |
| Vector DB (dev) | **Chroma** | Local index, fast iteration |
| Vector DB (prod path) | **PostgreSQL + pgvector** | Same DB as app metadata |
| Lexical search | **BM25** (`rank-bm25`) | Keyword recall |
| Fusion | **RRF** | Merge BM25 + dense ranks |
| Reranker | Cross-encoder (local BGE) or Cohere Rerank | Precision boost |
| Eval | **RAGAS** | Faithfulness, context precision/recall |
| Orchestration | LangChain or LlamaIndex | Pipelines — pick one, stay consistent |
| Chat | GPT-4o Mini | Generation with retrieved context |

### Optional

| Component | Use |
|-----------|-----|
| HyDE query transform | Synthetic answer embedding for hard queries |
| Cohere Rerank API | Hosted reranker vs local sentence-transformers |
| Ollama `nomic-embed-text` | Offline embedding experiments |

---

## Core Knowledge Objectives

| # | Objective | Theory |
|---|-----------|--------|
| 1 | Document parsing and metadata | [document-ingestion.md](theory/document-ingestion.md) |
| 2 | Chunking strategies | [chunking-strategies.md](theory/chunking-strategies.md) |
| 3 | Bi-encoder embeddings for retrieval | [embeddings-retrieval.md](theory/embeddings-retrieval.md) |
| 4 | Chroma vs pgvector | [vector-databases.md](theory/vector-databases.md) |
| 5 | Hybrid search + RRF | [hybrid-search-rrf.md](theory/hybrid-search-rrf.md) |
| 6 | Cross-encoder reranking | [reranking.md](theory/reranking.md) |
| 7 | Context assembly + citations | [context-assembly-citations.md](theory/context-assembly-citations.md) |
| 8 | RAGAS + golden datasets | [rag-evaluation-ragas.md](theory/rag-evaluation-ragas.md) |
| 9 | RAG failure modes | [rag-failure-modes.md](theory/rag-failure-modes.md) |
| 10 | Agentic RAG preview | [agentic-rag-preview.md](theory/agentic-rag-preview.md) |

---

## Build Objective

Ship [Doc Q&A Studio](project/overview.md): ingest your documents, hybrid retrieve + rerank, stream answers with citations, export `rag_eval_report.json` from a 50+ pair golden set.

---

## Daily Index

| Day | Focus | Hours (max) |
|-----|-------|-------------|
| [Day 1](daily/day-01.md) | Ingestion + chunking | 4h |
| [Day 2](daily/day-02.md) | Embeddings + Chroma | 4h |
| [Day 3](daily/day-03.md) | Hybrid search + RRF | 4–5h |
| [Day 4](daily/day-04.md) | Reranking + citations | 4h |
| [Day 5](daily/day-05.md) | RAGAS + golden dataset | 4–5h |
| [Day 6](daily/day-06.md) | Agentic preview + project build | 4–5h |
| [Day 7](daily/day-07.md) | Capstone eval + validation | 4–5h |

---

## Cost Budget

| Category | Spend |
|----------|-------|
| Embeddings (index + queries) | $1–3 |
| Chat generation (labs + eval) | $3–6 |
| Cohere Rerank (optional) | $0–2 |
| Chroma / local BM25 / cross-encoder | $0 |
| **Total** | **$5–12** |
