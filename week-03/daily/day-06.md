# Day 6 — Agentic Preview & Doc Q&A Studio Build

> **You are here:** Day 6 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 5](day-05.md) |
| **Today's outcome** | Doc Q&A Studio API + UI with hybrid RAG pipeline |
| **Time** | 4–5h |
| **Work dir** | `week-03-work/` |
| **Stop when** | Chat returns cited answer in browser |

**Catch-up:** Skip optional Lab 6 pgvector; ship Chroma-backed capstone.

---

## Steps

### Step 1 — Theory (~25 min)

Read [agentic-rag-preview.md](../theory/agentic-rag-preview.md) — when to use loops vs single-shot.

### Step 2 — Project specs (~45 min)

Read in order:

1. [overview.md](../project/overview.md)
2. [architecture.md](../project/architecture.md)
3. [backend.md](../project/backend.md)
4. [indexing-spec.md](../project/indexing-spec.md)
5. [api.md](../project/api.md)

### Step 3 — Scaffold Doc Q&A Studio (~30 min)

```bash
mkdir -p doc-qa-studio/backend/app/{routers,services,retrieval}
mkdir -p doc-qa-studio/frontend/src
# Reuse Week 2 FastAPI layout if available
```

### Step 4 — Integrate retrieval pipeline (~120 min)

Move Labs 1–4 logic into services:

- `IngestionService`, `EmbeddingService`, `HybridRetriever`, `Reranker`, `ContextAssembler`, `RAGChain`

Wire `POST /api/v1/index` and `POST /api/v1/chat`.

### Step 5 — Frontend (~60 min)

Read [frontend.md](../project/frontend.md). Minimal chat UI: message list, citation chips, upload button.

Reuse Week 2 SSE pattern for streaming tokens.

### Step 6 — Optional Lab 6 (~60 min)

If time: [Lab 6 pgvector](../labs/lab-06-pgvector.md) + `docker compose up` for Postgres.

### Step 7 — Golden dataset expansion (~30 min)

Add 15+ pairs today (target 35+ total toward 50).

### Step 8 — Close out

- [ ] `POST /api/v1/chat` returns answer + `citations[]`
- [ ] Mark Day 6 in [progress.md](../progress.md)

---

## Done when

- [ ] Index at least 3 documents via API or CLI
- [ ] Browser chat shows answer with ≥1 citation
- [ ] Streaming works (tokens appear incrementally)

---

## Tomorrow

**→ [Day 7 — Capstone Eval & Validation](day-07.md)** — start with [eval-spec.md](../project/eval-spec.md)
