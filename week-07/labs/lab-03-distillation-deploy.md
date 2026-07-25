# Lab 3: Distillation & Small Model Deploy

> Week 7 Labs · [← README](README.md) · [Distillation Theory](../theory/distillation-small-models.md)

> **Work path:** `~/ai-learning/week-07-work/`

**Estimated cost:** $1–3 (teacher generation) · Ollama local free

**Goal:** Benchmark teacher (cloud) vs student (Ollama 3B) on latency, cost, quality.

---

## Task

### Part A — Generate pairs (optional)

```bash
python lab03_generate_distill_pairs.py \
  --teacher gpt-4o-mini \
  --prompts data/golden/eval.jsonl \
  --output data/distill/pairs.jsonl \
  --count 100
```

Each row: `{"prompt": "...", "teacher_response": "..."}`.

### Part B — Serve student

```bash
ollama pull llama3.2:3b
python lab03_serve_small_model.py --verify
```

### Part C — Benchmark

```bash
python lab03_distillation_benchmark.py \
  --teacher gpt-4o-mini \
  --student ollama:llama3.2:3b \
  --golden data/golden/eval.jsonl \
  --output distillation_benchmark.json
```

### Expected output: `distillation_benchmark.json`

```json
{
  "models": [
    {
      "id": "gpt-4o-mini",
      "role": "teacher",
      "p50_latency_ms": 780,
      "p95_latency_ms": 1200,
      "cost_per_1k_usd": 0.45,
      "quality_score": 0.82
    },
    {
      "id": "llama3.2:3b",
      "role": "student",
      "p50_latency_ms": 310,
      "p95_latency_ms": 520,
      "cost_per_1k_usd": 0.0,
      "quality_score": 0.71
    }
  ],
  "routing_recommendation": "Route 70% to student when task=summary; fallback to teacher if confidence < 0.65"
}
```

---

## Acceptance

- [ ] At least two models benchmarked on same golden set
- [ ] Latency p50/p95 recorded
- [ ] Quality score documented (RAGAS, LLM judge, or rubric)
- [ ] Routing recommendation paragraph in JSON or README note

---

## Next

[Day 4](../daily/day-04.md) → [Lab 4](lab-04-agentic-rag.md)
