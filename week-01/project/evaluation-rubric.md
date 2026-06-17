# Evaluation Rubric

> Week 1 Project · [Overview](overview.md) · Used in Labs 3, 5, and capstone
> **Work dir:** Scoring artifacts live in `~/ai-learning/week-01-work/` (lab outputs, capstone JSON/report)

## Dimension Scores (1–5 each)

| Dimension | 1 (Poor) | 3 (Acceptable) | 5 (Excellent) |
|-----------|----------|----------------|---------------|
| **Correctness** | Wrong or harmful | Mostly correct | Fully correct |
| **Format compliance** | Ignores format | Partial | Exact format |
| **Groundedness** | Fabricates confidently | Some unsupported claims | Refuses or qualifies |
| **Conciseness** | Rambling | Adequate | Precise |

## Composite Score

```
composite = (correctness + format + groundedness + conciseness) / 4
```

## Automated Signals (supplement manual scores)

| Signal | Detection |
|--------|-----------|
| `json_valid` | `json.loads()` succeeds |
| `schema_valid` | Pydantic validation succeeds |
| `parse_status` | From extraction ladder |
| `refusal_present` | "I don't know" when appropriate |
| `latency_rank` | Rank within compare batch |

## Export Row Shape

```json
{
  "request_id": "550e8400-e29b-41d4-a716-446655440000",
  "model_id": "ollama/llama3.1:8b",
  "prompt_id": "benchmark_reasoning",
  "scores": {
    "correctness": 4,
    "format": 5,
    "groundedness": 3,
    "conciseness": 4
  },
  "composite": 4.0,
  "parse_status": null,
  "latency_ms": 842,
  "input_tokens": 120,
  "output_tokens": 89,
  "cost_usd": 0.0,
  "error": null
}
```

## Capstone Quality Rubric (quick reference)

| Score | Meaning |
|-------|---------|
| 1 | Wrong, harmful, nonsensical |
| 2 | Partially correct, major errors |
| 3 | Acceptable, minor issues |
| 4 | Good — correct, well-structured |
| 5 | Excellent — concise, appropriate |
