# Day 4 — Reranking & Context Assembly

> **You are here:** Day 4 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 3](day-03.md) |
| **Today's outcome** | Cross-encoder rerank + citation-ready context assembly |
| **Time** | 4h |
| **Work dir** | `week-03-work/` |
| **Stop when** | `rerank_comparison.json` exists |

---

## Steps

### Step 1 — Theory: reranking (~30 min)

Read [reranking.md](../theory/reranking.md) — two-stage pipeline, latency table.

### Step 2 — Theory: context & citations (~25 min)

Read [context-assembly-citations.md](../theory/context-assembly-citations.md).  
Refresher: [Week 2 context-management](../../week-02/theory/context-management.md) for token budget.

### Step 3 — Lab spec (~10 min)

Read [Lab 4](../labs/lab-04-reranking.md).

### Step 4 — Implement reranker (~90 min)

Use local `BAAI/bge-reranker-base` (default) or Cohere if `COHERE_API_KEY` set. Rerank top-20 from Day 3 hybrid → top-5.

### Step 5 — Context assembler (~45 min)

Implement `assemble_context(chunks, max_tokens=2000)` with `[SOURCE id | metadata]` headers.

### Step 6 — End-to-end smoke (~30 min)

```bash
python lab04_rerank.py --out rerank_comparison.json
```

Compare rank@1 before/after rerank for 5 queries from Day 3.

### Step 7 — Deliverable & close out

- [ ] `rerank_comparison.json` — pre/post rerank order + assembled token count
- [ ] Mark Day 4 in [progress.md](../progress.md)

---

## Done when

- [ ] Reranker moves correct chunk to rank 1 for ≥1 query where RRF alone failed
- [ ] Assembled context respects 2000-token retrieval budget

---

## Tomorrow

**→ [Day 5 — RAGAS & Golden Dataset](day-05.md)** — start with [rag-evaluation-ragas.md](../theory/rag-evaluation-ragas.md)
