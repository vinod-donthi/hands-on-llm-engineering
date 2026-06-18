# Coding Interview Exercises — Week 2

> Week 2 · [← README](../README.md)

## Assignment A: Provider adapter (45 min)

Implement `AnthropicProvider.complete()` that maps to your existing `LLMResponse`. Include token usage and cost from registry pricing.

**Rubric:**

| Criteria | Points |
|----------|--------|
| Correct system prompt mapping | 25 |
| Content block text extraction | 25 |
| Observability fields populated | 25 |
| Error handling | 25 |

---

## Assignment B: Context trim (30 min)

Given `messages: list[dict]`, `max_input_tokens: int`, and a `count_tokens()` function, implement tail-keep trim that never removes the system message.

**Test cases:**

- Already under budget → unchanged
- Over budget → drops oldest pairs until fit
- Only system left → still over budget → raise `ContextBudgetExceeded`

---

## Assignment C: SSE handler (30 min)

Write an async generator that yields SSE-formatted strings from `async for chunk in provider.stream(...)`.

**Must include:** `event: token`, final `event: done` with `ttft_ms`.

---

## Self-grade

≥ 70% on A + B or A + C to pass. Compare with your lab implementations.
