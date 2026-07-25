# Week 3 References

> Week 3 · [← Reading List](reading-list.md)

Curated links with **why** each matters for AI engineering interviews and production RAG.

## Document processing

| Reference | Type | Why |
|-----------|------|-----|
| [pypdf docs](https://pypdf.readthedocs.io/) | Library | Simple PDF text extraction for labs |
| [python-docx](https://python-docx.readthedocs.io/) | Library | DOCX parsing |
| [Unstructured](https://unstructured.io/) | Product/docs | Layout-aware parsing at scale |

## Embeddings & retrieval

| Reference | Type | Why |
|-----------|------|-----|
| [OpenAI text-embedding-3](https://platform.openai.com/docs/guides/embeddings) | API | Week 3 default embed model |
| [sentence-transformers](https://www.sbert.net/) | Library | Local cross-encoder reranker |
| [Nomic embed (Ollama)](https://ollama.com/library/nomic-embed-text) | Model | Free local embeddings |

## Vector stores

| Reference | Type | Why |
|-----------|------|-----|
| [Chroma](https://www.trychroma.com/) | Vector DB | Local dev standard |
| [pgvector](https://github.com/pgvector/pgvector) | Postgres ext | Production path |
| [Weaviate hybrid search concepts](https://weaviate.io/developers/weaviate/concepts/hybrid-search) | Blog/docs | Industry hybrid patterns |

## Hybrid & rerank

| Reference | Type | Why |
|-----------|------|-----|
| [rank-bm25 PyPI](https://pypi.org/project/rank-bm25/) | Library | BM25 in Python |
| [RRF paper (Cormack et al.)](https://plg.uwaterloo.ca/~gvcormac/cormacksigir09-rrf.pdf) | Paper | Fusion algorithm |
| [Cohere Rerank](https://docs.cohere.com/docs/rerank-2) | API | Hosted reranking |
| [BGE reranker](https://huggingface.co/BAAI/bge-reranker-base) | Model | Local reranking |

## Evaluation

| Reference | Type | Why |
|-----------|------|-----|
| [RAGAS](https://docs.ragas.io/) | Framework | Week 3 eval standard |
| [RAGAS faithfulness metric](https://docs.ragas.io/en/stable/concepts/metrics/faithfulness.html) | Docs | Primary ship gate |
| [BEIR benchmark](https://github.com/beir-cellar/beir) | Benchmark | Retrieval research baseline |

## Frameworks (pick one)

| Reference | Type | Why |
|-----------|------|-----|
| [LangChain RAG](https://python.langchain.com/docs/tutorials/rag/) | Tutorial | Retriever chains |
| [LlamaIndex](https://docs.llamaindex.ai/) | Framework | Ingestion + query engines |

## Research (optional)

| Reference | Type | Why |
|-----------|------|-----|
| [Lewis et al. RAG (2020)](https://arxiv.org/abs/2005.11401) | Paper | Original RAG architecture |
| [Self-RAG](https://arxiv.org/abs/2310.11511) | Paper | Adaptive retrieval |
| [HyDE](https://arxiv.org/abs/2212.10496) | Paper | Query embedding trick |

## Prior curriculum

| Reference | Why |
|-----------|-----|
| [Week 1 embeddings](../../week-01/theory/embeddings.md) | Foundation |
| [Week 2 streaming](../../week-02/theory/streaming.md) | SSE chat UI |
| [Week 2 Docker/Postgres](../../week-02/project/docker.md) | pgvector deployment |
| [prompt.md Week 3](../../prompt.md) | Master spec |
