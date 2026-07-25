# Day 1 — Document Ingestion & Chunking

> **You are here:** Day 1 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Start Here](../START-HERE.md) (setup once) |
| **Today's outcome** | Parsed docs + three chunking strategies compared |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-03-work/` or `~/ai-learning/week-03-work/` |
| **Stop when** | `chunked_documents.json` exists |

**Catch-up:** skip to Step 5 (lab) if needed; skim theory Concepts only.

---

## Steps

### Step 1 — Setup (~20 min)

```bash
cd Learning/week-03
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
cd ~/ai-learning/week-03-work
source .venv/bin/activate
mkdir -p data/documents
# Copy 3–5 PDFs or Markdown files into data/documents/
```

### Step 2 — Theory: document ingestion (~30 min)

Read [document-ingestion.md](../theory/document-ingestion.md) — metadata schema, pipeline diagram, checkpoint.

### Step 3 — Theory: chunking strategies (~30 min)

Read [chunking-strategies.md](../theory/chunking-strategies.md) — fixed, semantic, parent-child comparison table.

### Step 4 — Lab spec (~15 min)

Read [Lab 1](../labs/lab-01-document-ingestion-chunking.md).

### Step 5 — Code: ingest + chunk (~120 min)

Implement parsers for PDF and Markdown. Produce chunks with three strategies: fixed 512/64, semantic (threshold 0.5), parent-child. Run:

```bash
python lab01_ingest_chunk.py --input data/documents --out chunked_documents.json
```

### Step 6 — Deliverable

- [ ] `chunked_documents.json` — per doc: chunk counts, avg tokens, sample chunk for each strategy
- [ ] Notes on which strategy preserved PTO/stipend-type facts best

### Step 7 — Close out (~15 min)

- [ ] Self-test checkpoint questions in theory files
- [ ] Mark Day 1 in [progress.md](../progress.md)

---

## Done when

- [ ] `chunked_documents.json` in work dir
- [ ] Day 1 row checked in `progress.md`

---

## Tomorrow

**→ [Day 2 — Embeddings & Chroma](day-02.md)** — start with [embeddings-retrieval.md](../theory/embeddings-retrieval.md)
