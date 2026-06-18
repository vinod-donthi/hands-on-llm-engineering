# Conceptual Interview Questions — Week 2

> Week 2 · [← README](../README.md)

**Q1: How would you design a multi-provider LLM abstraction layer?**

> **Answer outline:** `BaseLLMProvider` with `complete` + `stream`. YAML registry maps model_id → provider + pricing + capabilities. Normalized `LLMResponse` with observability. Factory pattern. Never leak vendor SDK types to routes. Partial failure isolation for compare.

---

**Q2: OpenAI vs Anthropic — key API differences?**

> **Answer outline:** System prompt placement. Content blocks vs plain string. Tool result message shapes. Streaming event types. Same business interface in your adapter.

---

**Q3: Why stream LLM responses? How do you measure success?**

> **Answer outline:** TTFT drives perceived latency. SSE for one-way push. Log TTFT separately from total latency and TPS. Cancel on client disconnect.

---

**Q4: Explain the function-calling / tool loop.**

> **Answer outline:** Model emits structured tool call → app validates args → executes → returns tool result message → model produces final answer. Max rounds. Security: validate, timeout, no arbitrary code execution.

---

**Q5: How do you manage context window limits?**

> **Answer outline:** Count tokens; reserve output + margin. Trim strategies (tail-keep, summarize). Store full history in DB, send trimmed view. Reject before API 400.

---

**Q6: What guardrails would you add before production?**

> **Answer outline:** Input: length, injection patterns, PII. Output: secret scan, schema validation. Cost caps. Rate limits. Rule-based first; LLM moderator optional. Consistent error shapes.

---

**Q7: How do you optimize LLM API costs?**

> **Answer outline:** Cheaper models via benchmarks. Shorter prompts. max_tokens caps. Caching (Week 5). Local for dev/batch. Log $/request. Daily budgets. Cascade routing.

---

**Q8: JSON mode vs structured outputs vs prompt-only?**

> **Answer outline:** Prompt-only weakest. JSON mode = syntax only. Structured/schema = semantics enforced. Cross-provider ladder with Pydantic validation and parse_status.

---

**Q9: When would you use local open-source models vs cloud?**

> **Answer outline:** Privacy, cost at scale, offline. Cloud for best quality/tools. Benchmark to decide — don't assume.

---

**Q10: How would you benchmark models fairly?**

> **Answer outline:** Same prompts, fixed temperature policy, record latency/tokens/cost/parse_status per row. Aggregate by model. Recommend per task type, not globally.
