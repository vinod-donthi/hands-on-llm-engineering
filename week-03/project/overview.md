# Doc Q&A Studio — Overview

> Week 3 Project · [← README](../README.md) · [Architecture](architecture.md)

> **Work dir:** `~/ai-learning/week-03-work/doc-qa-studio/`

Evolution of Week 2's provider patterns into a **Retrieval Augmented Generation** application — the Week 3 capstone per [prompt.md](../../prompt.md).

## Week 2 → Week 3

| Feature | Week 2 (Benchmark Studio) | Week 3 (Doc Q&A Studio) |
|---------|----------------------------|-------------------------|
| Core job | Compare LLM providers | Answer questions over your docs |
| Data | Ephemeral prompts | Indexed document chunks |
| Retrieval | — | Hybrid BM25 + dense + RRF |
| Precision layer | — | Cross-encoder rerank |
| Storage | Postgres run history | Chroma + optional pgvector |
| Output | Benchmark JSON | Chat + citations + RAGAS eval |
| Streaming | SSE tokens | SSE tokens + citation event |

## What you build

A web app where users:

1. Upload PDF/Markdown/DOCX files
2. System ingests, chunks, embeds, indexes
3. User asks questions in chat
4. System retrieves, reranks, generates grounded answers with citations
5. Eval script produces `rag_eval_report.json` from 50+ golden Q&A pairs

## Project Docs

| Doc | Content |
|-----|---------|
| [architecture.md](architecture.md) | Mermaid diagram, folder structure |
| [backend.md](backend.md) | Services, retrieval pipeline, tests |
| [frontend.md](frontend.md) | Chat UI, upload, citation chips |
| [api.md](api.md) | REST + SSE endpoints |
| [indexing-spec.md](indexing-spec.md) | Chunk schema, index versioning |
| [eval-spec.md](eval-spec.md) | Golden dataset + RAGAS report |
| [acceptance-criteria.md](acceptance-criteria.md) | Ship checklist |

## Capstone deliverables

- Running Doc Q&A Studio (local)
- `rag_eval_report.json` — ≥50 samples, faithfulness ≥ 0.75
- Golden dataset in work dir
- Optional: pgvector migration (Lab 6)

## Local Run

```bash
cd ~/ai-learning/week-03-work/doc-qa-studio
docker compose up -d          # optional Postgres Day 6+
cd backend && uvicorn app.main:app --reload --port 8000
cd frontend && npm run dev    # port 5173
```

Index sample docs:

```bash
curl -X POST http://localhost:8000/api/v1/index \
  -H "Content-Type: application/json" \
  -d '{"paths": ["../../data/documents/handbook.pdf"]}'
```

## Portfolio

[week-03-showcase.md](../portfolio/week-03-showcase.md) · [resume-bullets.md](../portfolio/resume-bullets.md)
