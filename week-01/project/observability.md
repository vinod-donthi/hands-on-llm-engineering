# Project Observability

> Week 1 Project · [Theory](../theory/observability.md) · [API](api.md) · [Build guide](BUILD-GUIDE.md)

> **Your code today:** `lab04_backend/app/observability.py` + fields on `LLMResponse`.  
> **Work path:** `Learning/week-01-work/` or `~/ai-learning/week-01-work/`.

---

## What problem are we solving?

When compare breaks, you need to know **which model**, **how much it cost**, and **whether JSON parsing failed** — without digging through unstructured logs. The observability envelope is the same JSON shape on every response.

Theory depth: [observability.md](../theory/observability.md).

---

## Implementation checklist

- [ ] `new_request_id()` in `observability.py`
- [ ] `parent_request_id` on compare; child IDs `{parent}:{model_id}`
- [ ] All 9 fields on every response (see theory doc)
- [ ] Structured log line per model call
- [ ] `MetricsBar.tsx` displays all fields + error badge (Path A UI)

---

## Log format (stdout)

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

Lab 5 `comparison.py` logs this shape via `_log_llm_complete()`.

---

## What NOT to log

- Full prompts or completions (PII)
- API keys
- Raw user PII in production (Week 5 expands)

---

## AI engineer takeaway

Generate IDs at the API boundary. Log structured JSON. Never drop failed models from compare arrays.

---

## Next

[theory/observability.md](../theory/observability.md) · [failure-recovery.md](failure-recovery.md)
