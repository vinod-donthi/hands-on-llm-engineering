# Day 3 — Context, Inference, Sampling

> **You are here:** Day 3 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 2](day-02.md) — embeddings + Lab 2 |
| **Today's outcome** | Understand context windows, inference (prefill/decode), sampling; observe temperature effects |
| **Time** | 3–4h (hard cap 5h) |
| **Work dir** | `week-01-work/` |
| **Stop when** | `sampling_analysis.md` + `sampling_grid_results.jsonl` exist |

---

## Steps

### Step 1 — Theory: Context window (~15 min)

Read [context-window.md](../theory/context-window.md)

### Step 2 — Theory: Inference (~15 min)

Read [inference.md](../theory/inference.md)

- Focus: prefill vs decode, TTFT, KV cache

### Step 3 — Theory: Temperature & top-p (~15 min)

Read [temperature-top-p.md](../theory/temperature-top-p.md)

### Step 4 — Lab spec (~5 min)

Read [Lab 3](../labs/lab-03-sampling.md)

### Step 5 — Code in work dir (~90 min)

```bash
cd week-01-work
source .venv/bin/activate
python lab03_sampling_grid.py
```

Cap: 10 runs if using GPT-4o Mini (see lab cost notes).

### Step 6 — Deliverable

- [ ] `sampling_grid_results.jsonl`
- [ ] `sampling_analysis.md` (half page: which setting hallucinated most?)

### Step 7 — Close out

- [ ] Mark Day 3 in [progress.md](../progress.md)

---

## Done when

- [ ] Both sampling deliverables in work dir
- [ ] Day 3 row checked in `progress.md`

---

## Tomorrow

**→ [Day 4 — Training, RLHF, Hallucinations](day-04.md)** — start with [training-vs-finetuning.md](../theory/training-vs-finetuning.md)
