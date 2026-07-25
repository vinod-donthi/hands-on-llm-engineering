# Day 4 — Semantic Caching

> **You are here:** Day 4 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 3 — Redis](day-03.md) |
| **Today's outcome** | Paraphrased query hits semantic cache (no LLM call) |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-05-work/` or `~/ai-learning/week-05-work/` |
| **Stop when** | `cache_report.json` shows semantic hit on paraphrase |

**Catch-up:** implement lookup + one test pair only; tune threshold later.

---

## Steps

### Step 1 — Theory: Semantic caching (~30 min)

Read [semantic-caching.md](../theory/semantic-caching.md) — embeddings, cosine similarity, false positives.

### Step 2 — Lab spec (~10 min)

Read [Lab 4](../labs/lab-04-semantic-cache.md).

### Step 3 — Semantic cache service (~90 min)

Implement `SemanticCacheService`:

1. Embed query with `text-embedding-3-small`
2. Store in Redis: vector + response payload (Redis Stack `HNSW` optional; sorted set + numpy OK for lab scale)
3. On lookup: find nearest neighbor; if similarity ≥ `SEMANTIC_CACHE_THRESHOLD`, return cached answer

### Step 4 — Integrate into RAG route (~45 min)

Check semantic cache **before** exact cache **before** LLM.

### Step 5 — Demo script (~45 min)

```bash
python lab04_semantic_cache_demo.py
```

Query A: `"What is our refund policy for annual plans?"`  
Query B (paraphrase): `"How do yearly subscription refunds work?"`  
Expect B → `"semantic_cache_hit": true`, `"llm_called": false`.

### Step 6 — Deliverable

- [ ] `cache_report.json` with similarity score and hit type

### Step 7 — Close out (~15 min)

- [ ] Mark Day 4 in [progress.md](../progress.md)

---

## Done when

- [ ] Semantic hit documented with similarity ≥ threshold
- [ ] Day 4 row checked in `progress.md`

---

## Tomorrow

**→ [Day 5 — Background Queues](day-05.md)** — start with [background-queues.md](../theory/background-queues.md)
