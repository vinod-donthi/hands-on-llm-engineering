# Week 3 Resume Bullets

> Week 3 Portfolio · [← Showcase](week-03-showcase.md)

Tailor numbers to your actual `rag_eval_report.json`. Replace placeholders before submitting applications.

## Template bullets (pick 2–3)

- Built **Doc Q&A Studio**, a production-style RAG chatbot ingesting PDF/Markdown corpora with **hybrid retrieval (BM25 + dense embeddings + RRF)** and **cross-encoder reranking**, achieving **0.81 faithfulness** on a **52-pair golden eval set** (RAGAS).

- Implemented document ingestion pipeline with **fixed, semantic, and parent-child chunking**; indexed **1,200+ chunks** in **Chroma** with OpenAI `text-embedding-3-small`, migrating production path to **PostgreSQL/pgvector**.

- Designed **two-stage retrieve→rerank** architecture reducing wrong-context answers; logged retrieval/rerank/LLM latency breakdown (**p95 &lt; 3s TTFT**) reusing Week 2 FastAPI + SSE patterns.

- Created **50+ Q&A golden dataset** with keyword, semantic, and negative test cases; automated **RAGAS** regression eval (`faithfulness`, `context recall`) gating deploy at **≥ 0.75**.

- Debugged RAG failures using layered triage (ingestion → chunking → hybrid retrieval → rerank → prompt), improving **context recall from 0.62 to 0.78** after enabling BM25+RRF.

## Skills to list (ATS keywords)

`RAG` · `Retrieval Augmented Generation` · `vector databases` · `Chroma` · `pgvector` · `embeddings` · `BM25` · `hybrid search` · `reranking` · `LangChain` · `FastAPI` · `RAGAS` · `LLM evaluation`

## Project one-liner

**Doc Q&A Studio** — Document-grounded chatbot with hybrid search, cross-encoder reranking, source citations, and RAGAS eval report.

## Link placeholders

- GitHub: `{your-repo}/doc-qa-studio`
- Demo: local screenshot or 30s Loom
- Artifact: `rag_eval_report.json` (redact doc names if sensitive)
