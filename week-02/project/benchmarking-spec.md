# Benchmarking Spec

> Week 2 Project · Day 7 · [Acceptance Criteria](acceptance-criteria.md)

## Purpose

Produce a **reproducible, data-driven comparison** of ≥ 3 models across 5 prompts — the Week 2 deliverable: **Model benchmarking tool**.

## Prompt suite: `config/benchmark_prompts.yaml`

```yaml
prompts:
  - id: chat_greeting
    type: chat
    prompt: "Explain what an LLM is in two sentences."
    temperature: 0.7

  - id: json_extract
    type: extraction
    prompt: "Extract: John Doe, age 34, email john@example.com"
    schema: ContactInfo
    temperature: 0

  - id: reasoning
    type: chat
    prompt: "If a train travels 60 mph for 2.5 hours, how far? Show reasoning."
    temperature: 0

  - id: code
    type: chat
    prompt: "Write a Python function to merge two sorted lists."
    temperature: 0

  - id: tool_math
    type: tool
    prompt: "What is 999 * 888? Use the calculator."
    temperature: 0
```

## Models (minimum)

- `gpt-4o-mini`
- `claude-3-5-haiku-20241022`
- `llama3.1:8b`

## Runner: `scripts/run_benchmark.py`

For each `(prompt, model)`:

1. Generate `request_id`
2. Call appropriate endpoint (`/compare`, `/extract`, `/chat/tools`, `/stream` for chat with TTFT)
3. Record observability fields
4. Append to JSON array

## Output: `benchmark_report.json`

```json
{
  "generated_at": "2026-06-18T12:00:00Z",
  "hardware_note": "MacBook M2, Ollama local",
  "results": [
    {
      "prompt_id": "json_extract",
      "model_id": "gpt-4o-mini",
      "latency_ms": 820,
      "ttft_ms": null,
      "input_tokens": 45,
      "output_tokens": 32,
      "cost_usd": 0.00002,
      "parse_status": "success",
      "schema_ladder_step": "openai_json_schema",
      "error": null
    }
  ],
  "aggregates": {
    "gpt-4o-mini": {
      "avg_latency_ms": 650,
      "total_cost_usd": 0.04,
      "parse_success_rate": 1.0
    }
  }
}
```

## Summary: `benchmark_summary.md`

Human-readable report with:

1. **Executive summary** — cheapest model that passes quality bar per task type
2. **Latency table** — TTFT for streaming prompts
3. **Cost table** — $ per prompt and total
4. **Quality notes** — parse failures, tool errors, subjective 1–5 scores (your judgment)
5. **Recommendation** — default model per task type for Week 3 RAG project

## Scoring rubric (manual)

| Dimension | 1 | 5 |
|-----------|---|---|
| Accuracy | Wrong | Correct |
| Format compliance | Broken JSON | Perfect schema |
| Conciseness | Rambling | Tight |
| Latency feel | Slow TTFT | Snappy |

## CLI usage

```bash
cd backend
python -m scripts.run_benchmark \
  --prompts ../config/benchmark_prompts.yaml \
  --models gpt-4o-mini,claude-3-5-haiku-20241022,llama3.1:8b \
  --out ../../benchmark_report.json

python -m scripts.summarize_benchmark ../../benchmark_report.json ../../benchmark_summary.md
```
