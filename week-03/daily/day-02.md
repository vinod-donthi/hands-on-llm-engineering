# Day 2 — Embeddings & Chroma Index

> **You are here:** Day 2 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 1](day-01.md) |
| **Today's outcome** | All chunks embedded and indexed in Chroma |
| **Time** | 4h |
| **Work dir** | `week-03-work/` |
| **Stop when** | `chroma_index_stats.json` exists |

**Catch-up:** Step 4 lab only; read theory takeaways.

---

## Steps

### Step 1 — Theory: embeddings for retrieval (~30 min)

Read [embeddings-retrieval.md](../theory/embeddings-retrieval.md) — bi-encoder vs cross-encoder, query/document parity.

Refresher: [Week 1 embeddings](../../week-01/theory/embeddings.md) if cosine similarity feels rusty.

### Step 2 — Theory: vector databases (~25 min)

Read [vector-databases.md](../theory/vector-databases.md) — Chroma vs pgvector decision table.

### Step 3 — Lab spec (~10 min)

Read [Lab 2](../labs/lab-02-embeddings-chroma.md).

### Step 4 — Code: embed + index (~150 min)

Pick **one** chunk strategy from Day 1 (recommend fixed 512/64 or parent-child). Batch-embed with `text-embedding-3-small`. Persist Chroma collection `doc_qa_v1`.

```bash
python lab02_embed_chroma.py --chunks chunked_documents.json --collection doc_qa_v1
```

### Step 5 — Smoke query (~20 min)

Run 3 manual queries; verify top-3 chunks are on-topic in stdout.

### Step 6 — Deliverable

- [ ] `chroma_index_stats.json` — chunk count, embed model, dims, persist path, sample query results
- [ ] Chroma data under `data/chroma/`

### Step 7 — Close out

- [ ] Mark Day 2 in [progress.md](../progress.md)

---

## Done when

- [ ] `chroma_index_stats.json` exists
- [ ] Dense-only search returns sensible top-3 for 3 test queries

---

## Tomorrow

**→ [Day 3 — Hybrid Search + RRF](day-03.md)** — start with [hybrid-search-rrf.md](../theory/hybrid-search-rrf.md)
