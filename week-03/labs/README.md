# Week 3 Labs

> [← README](../README.md) · [Project](../project/overview.md)

> **Learning path:** Specs in `Learning/week-03/labs/`  
> **Work dir:** `~/ai-learning/week-03-work/` — all code and deliverables

## Prerequisites

```bash
cd ~/ai-learning/week-03-work
source .venv/bin/activate
# OPENAI_API_KEY in .env
mkdir -p data/documents eval config
```

Place 3–5 documents in `data/documents/` (PDF, Markdown, or DOCX).

## Lab Index

| Lab | Topic | Required | Deliverable |
|-----|-------|----------|-------------|
| [Lab 1](lab-01-document-ingestion-chunking.md) | Parse + chunk strategies | Yes | `chunked_documents.json` |
| [Lab 2](lab-02-embeddings-chroma.md) | Embed + Chroma index | Yes | `chroma_index_stats.json` |
| [Lab 3](lab-03-hybrid-search.md) | BM25 + dense + RRF | Yes | `hybrid_search_results.json` |
| [Lab 4](lab-04-reranking.md) | Cross-encoder rerank | Yes | `rerank_comparison.json` |
| [Lab 5](lab-05-ragas-eval.md) | RAGAS golden eval | Yes | `rag_eval_report.json` (draft) |
| [Lab 6](lab-06-pgvector.md) | pgvector production path | Optional* | Migration notes + row count |

*Skip Lab 6 if behind — document in [progress.md](../progress.md).

## Cost Notes

| Lab | Est. spend |
|-----|------------|
| Lab 1 | $0 |
| Lab 2 | $0.20–0.80 (embed index) |
| Lab 3–4 | $0 (local BM25 + reranker) |
| Lab 5 | $1–4 (RAGAS judge + generation) |
| Full week | $5–12 total |
