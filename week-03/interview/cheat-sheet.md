# Week 3 Interview Cheat Sheet

> Week 3 · [← Concepts](concepts.md) · [Quiz](../checkpoints/quiz.md)

## One-liner

**RAG** = retrieve relevant chunks → assemble context → generate grounded answer with citations → measure with RAGAS.

## Pipeline (memorize)

```
Ingest → Chunk → Embed → Index
Query → BM25 top-50 + Dense top-50 → RRF → Rerank top-5 → Assemble → LLM → Citations
```

## Numbers to know

| Item | Typical value |
|------|---------------|
| Chunk size | 512 tokens |
| Overlap | 64 tokens |
| RRF k | 60 |
| Retrieve | 50+50 → merge 20 |
| Rerank | 20 → 5 |
| Context budget | 2000 tokens retrieval |
| Faithfulness gate | ≥ 0.75 |
| Golden set | ≥ 50 pairs |

## Formulas

**Cosine similarity:** `(A·B) / (||A|| × ||B||)`

**RRF:** `score(d) += 1 / (k + rank_i(d))` for each rank list i

## Stack (2026)

| Layer | Week 3 pick |
|-------|-------------|
| Embed | text-embedding-3-small |
| Vector DB dev | Chroma |
| Vector DB prod | pgvector |
| Lexical | BM25 |
| Fusion | RRF |
| Rerank | BGE cross-encoder / Cohere |
| Eval | RAGAS |
| Chat | GPT-4o Mini |

## Debug order

1. Ingestion 2. Chunking 3. Retrieval 4. Rerank 5. Prompt

## Interview phrases

- *"I'd re-index on embedding model change."*
- *"Hybrid for recall, rerank for precision."*
- *"Faithfulness before launch; golden set in CI."*
- *"Agentic retrieval only when single-shot fails eval."*

## Anti-patterns

- Chat model as embedder
- Average BM25 + cosine scores
- Rerank entire corpus
- No negative test questions
- Tune prompt before fixing retrieval

## Week links

- [Week 1 embeddings](../../week-01/theory/embeddings.md)
- [Week 2 context budget](../../week-02/theory/context-management.md)
- [Week 3 failure modes](../theory/rag-failure-modes.md)
