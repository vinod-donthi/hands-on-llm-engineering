# Week 3 Progress Tracker (Interview Self-Assessment)

> Week 3 · [← Exit Criteria](exit-criteria.md)

Rate each area **1–5** (1 = cannot explain, 5 = hire-ready whiteboard). Target: **≥4 on at least 4 of 5** parts.

| # | Area | 1 | 2 | 3 | 4 | 5 | Notes |
|---|------|---|---|---|---|---|-------|
| 1 | **Ingestion & chunking** — fixed, semantic, parent-child tradeoffs | | | | | | |
| 2 | **Embeddings & vector stores** — Chroma vs pgvector, re-index rules | | | | | | |
| 3 | **Hybrid + rerank** — BM25, RRF, cross-encoder two-stage | | | | | | |
| 4 | **Context + citations** — assembly, budgets, refusal | | | | | | |
| 5 | **Eval & debug** — RAGAS metrics, golden sets, failure mode triage | | | | | | |

## Part prompts

### 1. Ingestion & chunking
Explain how you'd ingest a 200-page PDF and choose chunk strategy for an HR policy bot.

### 2. Embeddings & vector stores
When would you migrate from Chroma to pgvector? What breaks if you swap embedding models?

### 3. Hybrid + rerank
Draw retrieve → RRF → rerank on a whiteboard with latency estimates.

### 4. Context + citations
How do you prevent hallucinations when retrieval scores are weak?

### 5. Eval & debug
Walk through one failed golden-set sample and how you'd fix it.

## Hire-ready checklist

- [ ] Can implement `rrf_merge` from memory
- [ ] Can explain faithfulness vs context recall
- [ ] Can demo Doc Q&A Studio with citation
- [ ] Can defend hybrid search with a concrete keyword example
- [ ] Know when agentic RAG is overkill

## Record scores

| Date | Avg score | Weak area | Action |
|------|-----------|-----------|--------|
| | /5 | | |

Update after [Day 7](../daily/day-07.md) validation.
