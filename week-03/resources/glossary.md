# Week 3 Glossary

> Week 3 · [← README](../README.md) · [Appendix](../../appendix/README.md)

| Term | Definition |
|------|------------|
| **RAG** | Retrieval Augmented Generation — fetch relevant docs, then generate an answer grounded in them. |
| **Chunk** | A segment of document text indexed as one retrieval unit (often 256–512 tokens). |
| **Bi-encoder** | Model that embeds query and document separately for fast similarity search. |
| **Cross-encoder** | Model that scores query+document together; used for reranking top candidates. |
| **Dense retrieval** | Search using embedding vector similarity (semantic search). |
| **BM25** | Lexical ranking function based on term frequency; strong on exact keywords. |
| **Hybrid search** | Combining dense and sparse (BM25) retrieval for better recall. |
| **RRF** | Reciprocal Rank Fusion — merges ranked lists via `1/(k+rank)` without score normalization. |
| **ANN** | Approximate Nearest Neighbor — fast vector search (HNSW, IVF). |
| **Chroma** | Embedded vector database for local development. |
| **pgvector** | PostgreSQL extension storing vectors for production SQL + similarity search. |
| **HNSW** | Hierarchical Navigable Small World — graph-based ANN index. |
| **Parent-child chunking** | Small child chunks for search; larger parent chunks for LLM context. |
| **Semantic chunking** | Splitting text when embedding similarity between segments drops. |
| **Context assembly** | Packing retrieved chunks into a prompt within token budget. |
| **Citation** | Reference linking an answer claim to a source chunk (doc, page, section). |
| **RAGAS** | Evaluation framework for RAG: faithfulness, context precision/recall, answer relevancy. |
| **Faithfulness** | Metric: is the answer supported by retrieved context? |
| **Context recall** | Metric: was ground-truth information retrieved? |
| **Context precision** | Metric: are retrieved chunks relevant (low noise)? |
| **Golden dataset** | Labeled Q&A pairs with ground-truth answers and source spans for eval. |
| **Hallucination** | Model states facts not supported by sources or reality. |
| **Re-index** | Re-embed and rebuild vector index after model or chunk strategy change. |
| **Agentic RAG** | LLM loop that may retrieve multiple times before answering (Week 4 depth). |
| **HyDE** | Hypothetical Document Embeddings — embed a synthetic answer for hard queries. Optional Week 3. |
| **MRR@K** | Mean Reciprocal Rank — eval metric for retrieval quality at rank K. |
| **Hit@K** | Whether correct chunk appears in top K results. |
| **LangChain** | Python framework for LLM chains and retrievers. Week 3 orchestration option. |
| **LlamaIndex** | Data framework for ingestion and RAG pipelines. Alternative orchestration option. |

## Week 1–2 terms reused

| Term | Week | Link |
|------|------|------|
| Embedding | 1 | [embeddings.md](../../week-01/theory/embeddings.md) |
| Cosine similarity | 1 | [embeddings.md](../../week-01/theory/embeddings.md) |
| Context window | 1 | [context-window.md](../../week-01/theory/context-window.md) |
| Token | 1 | [tokens.md](../../week-01/theory/tokens.md) |
| Context budget | 2 | [context-management.md](../../week-02/theory/context-management.md) |
| SSE streaming | 2 | [streaming.md](../../week-02/theory/streaming.md) |
