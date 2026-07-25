# Day 4 — Agentic RAG Integration

> **You are here:** Day 4 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 3 — Distillation](day-03.md) |
| **Today's outcome** | LangGraph agentic RAG with grade → re-query loop |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-07-work/` or `~/ai-learning/week-07-work/` |
| **Stop when** | `agentic_rag_trace.json` exists |

**Catch-up:** implement 2-step loop only (retrieve + grade); skip query rewrite node.

---

## Steps

### Step 1 — Theory: Agentic RAG (~40 min)

Read [agentic-rag.md](../theory/agentic-rag.md) — full integration vs Week 3 preview.

### Step 2 — Lab spec (~10 min)

Read [Lab 4](../labs/lab-04-agentic-rag.md).

### Step 3 — Wire LangGraph nodes (~90 min)

Implement graph: `plan_query` → `retrieve` → `grade_context` → `rewrite_query` (conditional) → `generate`.

Reference: [project/track-b-agentic-rag.md](../project/track-b-agentic-rag.md).

### Step 4 — Run multi-hop eval (~60 min)

```bash
python lab04_agentic_rag_eval.py --cases data/golden/multihop.jsonl
```

### Step 5 — Deliverable

- [ ] `agentic_rag_trace.json` — per-case steps, retrieval counts, final answer, faithfulness
- [ ] Classic RAG vs agentic comparison on ≥5 multi-hop questions

### Step 6 — Close out (~15 min)

- [ ] Checkpoint questions in agentic-rag theory
- [ ] Mark Day 4 in [progress.md](../progress.md)

---

## Done when

- [ ] `agentic_rag_trace.json` in work dir
- [ ] Agent completes ≥3 retrieval iterations on at least one multi-hop case
- [ ] Day 4 row checked in `progress.md`

---

## Tomorrow

**→ [Day 5 — Long Context vs RAG](day-05.md)** — start with [long-context-vs-rag.md](../theory/long-context-vs-rag.md)
