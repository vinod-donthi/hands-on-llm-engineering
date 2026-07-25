# Day 3 — Hybrid Search & RRF

> **You are here:** Day 3 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 2](day-02.md) |
| **Today's outcome** | BM25 + dense merged with RRF; measurable recall lift |
| **Time** | 4–5h |
| **Work dir** | `week-03-work/` |
| **Stop when** | `hybrid_search_results.json` exists |

---

## Steps

### Step 1 — Theory (~35 min)

Read [hybrid-search-rrf.md](../theory/hybrid-search-rrf.md) — RRF formula walkthrough, worked rank table.

### Step 2 — Lab spec (~10 min)

Read [Lab 3](../labs/lab-03-hybrid-search.md).

### Step 3 — Build BM25 index (~45 min)

Build in-memory BM25 over same chunk texts used in Chroma. Store `chunk_id → text` map on disk for reuse.

### Step 4 — Implement RRF (~90 min)

For 10 test queries (include 2 keyword-heavy: SKUs, error codes, exact policy terms):

```bash
python lab03_hybrid_search.py --queries config/test_queries.yaml --out hybrid_search_results.json
```

Log BM25 top-10, dense top-10, RRF top-10 per query.

### Step 5 — Compare (~30 min)

Document in JSON which queries improved vs dense-only. Target: ≥2 queries where hybrid rank @1 beats dense.

### Step 6 — Deliverable

- [ ] `hybrid_search_results.json` with per-query rank lists and winner at rank 1

### Step 7 — Close out

- [ ] Mark Day 3 in [progress.md](../progress.md)

---

## Done when

- [ ] RRF merge implemented with k=60
- [ ] At least 2 keyword-style queries rank correct chunk #1 under hybrid but not dense-only

---

## Tomorrow

**→ [Day 4 — Reranking & Citations](day-04.md)** — start with [reranking.md](../theory/reranking.md)
