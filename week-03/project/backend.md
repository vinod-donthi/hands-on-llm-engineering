# Doc Q&A Studio — Backend

> Week 3 Project · [← Architecture](architecture.md) · [API](api.md)

> **Work dir:** `~/ai-learning/week-03-work/doc-qa-studio/backend/`

## Service layer

| Service | Responsibility |
|---------|----------------|
| `IngestionService` | Parse PDF/MD/DOCX → raw pages + metadata |
| `ChunkingService` | fixed / semantic / parent-child strategies |
| `EmbeddingService` | Batch embed, track model + token usage |
| `HybridRetriever` | BM25 + Chroma dense + RRF |
| `RerankerService` | Cross-encoder or Cohere top-20 → 5 |
| `ContextAssembler` | Token budget pack + SOURCE labels |
| `RAGChain` | Orchestrate retrieve → generate |
| `IndexService` | Full ingest pipeline, manifest write |

## HybridRetriever interface

```python
class HybridRetriever:
    def __init__(self, chroma_collection, bm25_index, chunk_store, k_rrf: int = 60):
        ...

    async def retrieve(self, query: str, top_k: int = 20) -> list[RetrievedChunk]:
        dense_ids = self._dense_search(query, n=50)
        bm25_ids = self._bm25_search(query, n=50)
        merged = self._rrf_merge([bm25_ids, dense_ids], k=self.k_rrf)
        return [self.chunk_store[cid] for cid, _ in merged[:top_k]]
```

## RAGChain prompt

Reuse Week 2 provider for generation:

```python
SYSTEM = """You answer using ONLY the provided sources.
If the answer is not in the sources, say you don't have that information.
Cite inline as [source_label]."""

async def answer(self, question: str) -> RAGResponse:
    chunks = await self.retriever.retrieve(question, top_k=20)
    top = self.reranker.rerank(question, chunks, top_n=5)
    context = self.assembler.assemble(top, max_tokens=2000)
    text = await self.llm.complete(system=SYSTEM, user=f"Sources:\n{context}\n\nQuestion: {question}")
    return RAGResponse(answer=text, citations=self._extract_citations(top))
```

## Configuration (`app/config.py`)

| Env var | Default |
|---------|---------|
| `EMBEDDING_MODEL` | text-embedding-3-small |
| `CHAT_MODEL` | gpt-4o-mini |
| `CHROMA_PERSIST_DIR` | ../../data/chroma |
| `CHUNK_SIZE` | 512 |
| `CHUNK_OVERLAP` | 64 |
| `RRF_K` | 60 |
| `RERANKER_MODEL` | BAAI/bge-reranker-base |
| `RETRIEVAL_TOP_K` | 20 |
| `RERANK_TOP_N` | 5 |
| `CONTEXT_MAX_TOKENS` | 2000 |

## Observability (extend Week 2)

Log struct per chat request:

```json
{
  "event": "rag_chat",
  "query_hash": "abc123",
  "retrieval_ms": 42,
  "rerank_ms": 118,
  "llm_ms": 1240,
  "chunks_retrieved": 20,
  "chunks_used": 5,
  "context_tokens": 876,
  "embedding_model": "text-embedding-3-small",
  "index_version": "v1_2026-07-25"
}
```

## Tests (minimum)

| Test | Assert |
|------|--------|
| `test_rrf_merge` | Known rank lists → expected order |
| `test_context_budget` | Assembler stops before max_tokens |
| `test_index_idempotent` | Same checksum → no duplicate chunks |
| `test_chat_returns_citations` | Response schema has ≥0 citations |

```bash
cd backend && pytest tests/ -v
```

## Migration from labs

Copy lab modules into `app/services/` — refactor shared `chunk_store.json` or load from Chroma metadata. Single source of truth: **Chroma holds vectors + chunk text**.

## Next

[api.md](api.md) · [frontend.md](frontend.md)
