# Day 2 — Attention and Embeddings

> **You are here:** Day 2 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 1](day-01.md) — tokenization + Lab 1 |
| **Today's outcome** | Understand attention and embeddings; run semantic similarity search |
| **Time** | 3–4h (hard cap 5h) |
| **Work dir** | `week-01-work/` in this repo (or `~/ai-learning/week-01-work/`) |
| **Stop when** | `similarity_results.md` exists in work dir |

**Normal order:** steps below. **Catch-up:** Lab 2 is skippable per [roadmap](../roadmap.md) — skip to Day 3 if behind.

---

## Steps

### Step 1 — Theory: Attention (~25 min)

Read [attention.md](../theory/attention.md)

- Focus: Concepts (Q/K/V intuition), causal mask, AI engineer takeaway

### Step 2 — Theory: Embeddings (~25 min)

Read [embeddings.md](../theory/embeddings.md)

- Focus: encoder vs decoder, cosine similarity, RAG preview (Week 3)

### Step 3 — Lab spec (~5 min)

Read [Lab 2](../labs/lab-02-embeddings.md)

### Step 4 — Code in work dir (~60 min)

```bash
cd week-01-work
source .venv/bin/activate
# documents.json + lab02_embeddings.py per lab spec
python lab02_embeddings.py
```

Configure `.env` if using Azure OpenAI (`EMBED_PROVIDER=openai`, `OPENAI_BASE_URL`, etc.).

### Step 5 — Deliverable

Confirm in work dir:

- [ ] `similarity_results.md` (top-3 per query + similarity matrix)
- [ ] Failure analysis: one misrank case (extension in lab) — e.g. ambiguous "python" query

### Step 6 — Close out (~15 min)

- [ ] Checkpoint questions in attention + embeddings theory
- [ ] Mark Day 2 done in [progress.md](../progress.md)

---

## Done when

- [ ] `similarity_results.md` in work dir
- [ ] Day 2 row checked in `progress.md`

---

## Tomorrow

**→ [Day 3 — Context, Inference, Sampling](day-03.md)** — start with [context-window.md](../theory/context-window.md)
