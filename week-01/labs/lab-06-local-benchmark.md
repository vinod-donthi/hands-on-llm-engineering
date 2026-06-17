# Lab 6: Local Inference Benchmark

> Week 1 Labs · [← README](../README.md) · [Project](../project/overview.md)

> **Learning path:** This file (`Learning/week-01/labs/`) — specs and snippets only.  
> **Work dir:** `~/ai-learning/week-01-work/` — script and deliverables live here.

## Setup

```bash
cd ~/ai-learning/week-01-work
source .venv/bin/activate
ollama pull llama3.1:8b
ollama pull mistral:7b
```

**Estimated cost:** $0 — local Ollama only; no cloud API calls.

**Goal:** Benchmark Ollama models on your machine — measure tokens/sec, latency, and memory footprint. Builds intuition for local vs. cloud tradeoffs (AI Radar will run scheduled local/cloud inference).

**File:** `lab06_local_benchmark.py`

**Tasks:**

1. Pull 2–3 Ollama models: `llama3.1:8b`, `mistral:7b` (and optionally `qwen2.5:7b`).
2. Run a fixed prompt (100 tokens in, request 200 tokens out) 5 times per model.
3. Record per run: `model`, `ttft_ms` (time to first token if streaming preview), `total_latency_ms`, `output_tokens`, `tokens_per_sec`.
4. Use `ollama run` or the REST API (`POST /api/generate` with `"stream": false` for simpler Week 1 timing).

```python
import time, httpx, statistics

PROMPT = "Explain the transformer attention mechanism step by step."
MODELS = ["llama3.1:8b", "mistral:7b"]
RUNS = 5

async def bench_model(client: httpx.AsyncClient, model: str) -> list[dict]:
    results = []
    for i in range(RUNS):
        start = time.perf_counter()
        r = await client.post("http://localhost:11434/api/generate", json={
            "model": model, "prompt": PROMPT, "stream": False,
            "options": {"num_predict": 200, "temperature": 0},
        })
        elapsed = time.perf_counter() - start
        data = r.json()
        out_tokens = data.get("eval_count", 0)
        results.append({
            "model": model, "run": i + 1,
            "latency_ms": round(elapsed * 1000, 2),
            "output_tokens": out_tokens,
            "tokens_per_sec": round(out_tokens / elapsed, 2) if elapsed else 0,
        })
    return results
```

5. Output `benchmark_summary.csv` with mean ± std latency and tokens/sec per model.
6. Write 3 sentences: which model would you use for local dev vs. which for cloud-only?

**Expected Output:**

```
model,mean_latency_ms,mean_tokens_per_sec
llama3.1:8b,4200,38.2
mistral:7b,3100,52.1
```

**Deliverable:** `benchmark_summary.csv` + `benchmark_analysis.md`.

---
