# Week 1 Cheat Sheet

> [← README](../README.md) · [Concepts](concepts.md)

## Sampling Defaults

| Task | Temperature | Top-P |
|------|-------------|-------|
| Code / JSON | 0 | 1.0 |
| Chat | 0.7 | 0.9 |
| Creative | 1.0 | 0.95 |

## Observability Envelope

`request_id` · `input_tokens` · `output_tokens` · `cost_usd` · `latency_ms` · `error` · `parse_status` · `json_validation_error`

## JSON Ladder

Structured Output → JSON Mode → Validate → Prompt repair → Retry once → `parse_failure`

## Evaluation Composite

`(correctness + format + groundedness + conciseness) / 4`

## Token Budget

```
available_input = context_window - max_output - system_prompt - safety_margin
```

## Model Selection (Week 1)

| Task | Model |
|------|-------|
| Extraction | GPT-4o Mini, temp=0 |
| Dev / free | Llama 3.1 8B |
| Optional compare | Mistral 7B |

## RSS Ingestion (AI Radar Preview)

Fetch → Parse → Dedupe by URL/hash → Normalize → Store

## Week 1 → Week 2

Lite: hardcoded models, no DB, no stream → Full: YAML registry, PostgreSQL, SSE, Docker
