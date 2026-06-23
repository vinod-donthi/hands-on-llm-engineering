# Evaluation Rubric

> Week 1 Project · [Overview](overview.md) · [Capstone prompts](CAPSTONE-PROMPTS.md) · [Build guide](BUILD-GUIDE.md)

> **Work path:** Scoring artifacts live in `week-01-work/` (`compare_sample_output.json`, `capstone_comparison.json`).

---

## What problem are we solving?

"Which model is better?" is not one number. This rubric forces you to score **four dimensions** so you can say *"GPT won on format; Llama was faster but hallucinated once."*

---

## Dimension scores (1–5 each)

| Dimension | 1 (Poor) | 3 (Acceptable) | 5 (Excellent) |
|-----------|----------|----------------|---------------|
| **Correctness** | Wrong or harmful | Mostly correct | Fully correct |
| **Format compliance** | Ignores format | Partial | Exact format |
| **Groundedness** | Fabricates confidently | Some unsupported claims | Refuses or qualifies |
| **Conciseness** | Rambling | Adequate | Precise |

---

## Composite score

```
composite = (correctness + format + groundedness + conciseness) / 4
```

**Example:** scores 5, 5, 4, 5 → composite **4.75**

---

## Automated signals (supplement manual scores)

| Signal | Detection |
|--------|-----------|
| `json_valid` | `json.loads()` succeeds |
| `schema_valid` | Pydantic validation succeeds |
| `parse_status` | From extraction ladder |
| `refusal_present` | "I don't know" when appropriate |
| `latency_rank` | Rank within compare batch |

---

## Export row shape

```json
{
  "request_id": "550e8400-e29b-41d4-a716-446655440000",
  "model_id": "ollama/llama3.1:8b",
  "prompt_id": "capstone_format_bullets",
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

Lab 5 `run_lab05_export.py` produces this shape; capstone adds five prompts.

---

## Capstone quality rubric (quick reference)

| Score | Meaning |
|-------|---------|
| 1 | Wrong, harmful, nonsensical |
| 2 | Partially correct, major errors |
| 3 | Acceptable, minor issues |
| 4 | Good — correct, well-structured |
| 5 | Excellent — concise, appropriate |

---

## Next

[CAPSTONE-PROMPTS.md](CAPSTONE-PROMPTS.md) · [Day 7](../daily/day-07.md)
