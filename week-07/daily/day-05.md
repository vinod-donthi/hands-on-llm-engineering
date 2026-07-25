# Day 5 — Long Context vs RAG (+ GraphRAG Optional)

> **You are here:** Day 5 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 4 — Agentic RAG](day-04.md) |
| **Today's outcome** | Measured cost/quality: stuff full doc vs retrieve chunks |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-07-work/` or `~/ai-learning/week-07-work/` |
| **Stop when** | `long_context_vs_rag.json` exists |

**Catch-up:** run benchmark on one doc size only (50K tokens).

---

## Steps

### Step 1 — Theory: Long context vs RAG (~35 min)

Read [long-context-vs-rag.md](../theory/long-context-vs-rag.md).

### Step 2 — Optional: GraphRAG skim (~20 min)

**Optional — not required for Week 7 exit criteria:** [graphrag-overview.md](../theory/graphrag-overview.md).

### Step 3 — Lab spec (~10 min)

Read [Lab 5](../labs/lab-05-long-context-benchmark.md).

### Step 4 — Benchmark harness (~90 min)

```bash
python lab05_long_context_vs_rag.py --doc-sizes 10k,50k,120k --questions data/golden/longdoc.jsonl
```

### Step 5 — Deliverable

- [ ] `long_context_vs_rag.json` — token cost, latency, answer quality per strategy
- [ ] Decision note: at what doc size RAG wins on your workload

### Step 6 — Close out (~15 min)

- [ ] Mark Day 5 in [progress.md](../progress.md)

---

## Done when

- [ ] `long_context_vs_rag.json` in work dir
- [ ] Day 5 row checked in `progress.md`

---

## Tomorrow

**→ [Day 6 — Multimodal & MCP Production](day-06.md)** — start with [multimodal-preview.md](../theory/multimodal-preview.md)
