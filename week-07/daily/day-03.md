# Day 3 — Distillation & Small Model Deployment

> **You are here:** Day 3 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 2 — LoRA / PEFT](day-02.md) |
| **Today's outcome** | Teacher vs student benchmark on latency, cost, quality |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-07-work/` or `~/ai-learning/week-07-work/` |
| **Stop when** | `distillation_benchmark.json` exists |

**Catch-up:** skip distillation dataset generation; benchmark Ollama 3B vs GPT-4o Mini only.

---

## Steps

### Step 1 — Theory: Distillation (~35 min)

Read [distillation-small-models.md](../theory/distillation-small-models.md).

### Step 2 — Lab spec (~10 min)

Read [Lab 3](../labs/lab-03-distillation-deploy.md).

### Step 3 — Generate teacher outputs (optional, ~45 min)

```bash
python lab03_generate_distill_pairs.py --teacher gpt-4o-mini --count 100
```

Skip if using pre-built `data/distill/pairs.jsonl` from lab spec.

### Step 4 — Deploy small model (~30 min)

```bash
ollama pull llama3.2:3b
python lab03_serve_small_model.py --model llama3.2:3b
```

### Step 5 — Benchmark (~60 min)

```bash
python lab03_distillation_benchmark.py --golden data/golden/eval.jsonl
```

Compare: teacher (cloud), student (local), fine-tuned (Day 2 if Track A).

### Step 6 — Deliverable

- [ ] `distillation_benchmark.json` — latency p50/p95, cost, quality score per model
- [ ] One-paragraph recommendation in report: when to route to small model

### Step 7 — Close out (~15 min)

- [ ] Mark Day 3 in [progress.md](../progress.md)

---

## Done when

- [ ] `distillation_benchmark.json` in work dir
- [ ] Day 3 row checked in `progress.md`

---

## Tomorrow

**→ [Day 4 — Agentic RAG Integration](day-04.md)** — start with [agentic-rag.md](../theory/agentic-rag.md)
