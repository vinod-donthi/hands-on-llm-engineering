# Project Observability

> Week 1 Project · [Theory](../theory/observability.md) · [API](api.md)
> **Work dir:** All implementation code lives in `~/ai-learning/week-01-work/prompt-playground-lite/`

## Implementation Checklist

- [ ] `new_request_id()` in `observability.py`
- [ ] `parent_request_id` on compare; child IDs `{parent}:{model_id}`
- [ ] All 9 fields on every response (see theory doc)
- [ ] Structured log line per model call
- [ ] `MetricsBar.tsx` displays all fields + error badge

## Log Format (stdout)

```json
{
  "event": "llm_complete",
  "request_id": "550e8400-...:openai/gpt-4o-mini",
  "parent_request_id": "550e8400-...",
  "model_id": "openai/gpt-4o-mini",
  "latency_ms": 842.3,
  "input_tokens": 45,
  "output_tokens": 120,
  "cost_usd": 0.0001,
  "parse_status": null,
  "error": null
}
```

## What NOT to Log

- Full prompts or completions (PII)
- API keys
- Raw user PII in production (Week 5 expands)
