# Day 5 — RAGAS Evaluation & Golden Dataset

> **You are here:** Day 5 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 4](day-04.md) |
| **Today's outcome** | ≥20 golden pairs + first RAGAS eval run |
| **Time** | 4–5h |
| **Work dir** | `week-03-work/` |
| **Stop when** | `golden_dataset.json` (≥20) + draft `rag_eval_report.json` |

---

## Steps

### Step 1 — Theory: RAGAS (~35 min)

Read [rag-evaluation-ragas.md](../theory/rag-evaluation-ragas.md) — metrics table, golden pair schema.

### Step 2 — Theory: failure modes (~25 min)

Read [rag-failure-modes.md](../theory/rag-failure-modes.md) — tuning order diagram.

### Step 3 — Lab spec (~10 min)

Read [Lab 5](../labs/lab-05-ragas-eval.md).

### Step 4 — Build golden dataset (~90 min)

Create `eval/golden_dataset.json` with **≥20** Q&A pairs from your indexed docs:

- Mix keyword + paraphrase questions
- Include 2 unanswerable (negative) questions
- Each row: `question`, `ground_truth_answer`, `ground_truth_contexts`, `source_doc`

### Step 5 — Wire RAG pipeline for eval (~60 min)

Run full pipeline: hybrid → rerank → assemble → generate (GPT-4o Mini).

### Step 6 — RAGAS run (~45 min)

```bash
python lab05_ragas_eval.py --golden eval/golden_dataset.json --out rag_eval_report.json
```

Review faithfulness and context recall per sample.

### Step 7 — Tune one knob (~30 min)

Based on worst metric: adjust chunk overlap, hybrid top-K, or system prompt. Re-run on 5 samples.

### Step 8 — Close out

- [ ] `golden_dataset.json` ≥ 20 pairs
- [ ] Draft `rag_eval_report.json`
- [ ] Mark Day 5 in [progress.md](../progress.md)

---

## Done when

- [ ] Golden set committed to work dir (not curriculum repo if it contains private doc text — use synthetic samples for git)
- [ ] RAGAS metrics printed for all 20+ samples

---

## Tomorrow

**→ [Day 6 — Agentic Preview & Project Build](day-06.md)** — start with [agentic-rag-preview.md](../theory/agentic-rag-preview.md)
