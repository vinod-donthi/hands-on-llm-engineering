# Week 3 LinkedIn Notes

> Week 3 Portfolio · [← Resume Bullets](resume-bullets.md)

## Post draft (short)

Finished Week 3 of my AI Engineering curriculum — built **Doc Q&A Studio**, a RAG chatbot over my own documents.

Stack: document ingestion → chunking → **Chroma/pgvector** → **hybrid search (BM25 + embeddings + RRF)** → **cross-encoder rerank** → cited answers → **RAGAS eval** on a 50+ question golden set.

Key lesson: most "bad chatbot" bugs are **retrieval**, not the LLM. Hybrid search fixed keyword queries my dense-only baseline missed.

#RAG #LLM #AIEngineering #MachineLearning #GenAI

---

## Experience entry (paste into Projects)

**Doc Q&A Studio** · Personal project · 2026

- RAG application answering questions over PDF/Markdown with inline citations
- Hybrid retrieval (BM25 + dense + RRF) and BGE cross-encoder reranking
- RAGAS evaluation pipeline with 50+ golden Q&A pairs; faithfulness ≥ 0.75 gate
- FastAPI backend, React chat UI with SSE streaming (extends multi-provider LLM work from prior week)

---

## Recruiter DM snippet

> I recently shipped a RAG document Q&A project with hybrid search, reranking, and RAGAS eval — happy to walk through architecture or share eval metrics.

---

## Profile skills (add if missing)

Retrieval Augmented Generation (RAG) · Vector Databases · Embeddings · LLM Evaluation · FastAPI · Python

## Optional comment on hybrid search post

If engaging on others' RAG posts: *"We've seen the biggest lift from hybrid BM25+dense with RRF before reranking — especially on error codes and policy numbers dense-only missed."*
