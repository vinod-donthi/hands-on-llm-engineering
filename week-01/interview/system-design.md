# System Design Questions

> Week 1 · [← README](../README.md)


**SD1: Design a multi-model prompt evaluation platform (MVP vs. production).**

> **Answer outline:**
> - **Week 1 MVP:** Next.js single page → FastAPI → hardcoded models → parallel compare → observability envelope → client-side JSON export + manual eval scores.
> - **Week 2 production:** Add YAML registry, PostgreSQL history, SSE streaming, Docker Compose, provider plugin pattern.
> - **Key decisions:** Async parallel dispatch with per-model timeouts and error isolation; cost from token counts + pricing config; `request_id` on every response.
> - **Scale (later):** Rate limiting, batch eval queue, prompt caching.
> - Maps directly to Prompt Playground Lite → full Playground in Week 2.

---

**SD2: How would you add a new model provider to an existing LLM platform without downtime?**

> **Answer outline:** Week 1: add provider class + entry in hardcoded `MODELS` dict — requires code change. Week 2+: config-driven YAML registry with hot-reload or rolling deploy. New provider = interface implementation + config entry. Feature flag per model. Canary with internal prompts. Rollback = revert config.

---

**SD3: Design token budget management for a chat application with conversation history.**

> **Answer outline:** Define budget: `context_limit - max_output - system_prompt_tokens`. Track cumulative history tokens. When exceeded: summarize oldest turns, or sliding window (keep last N turns), or RAG over conversation archive. Never silently truncate system prompt. Log budget utilization. Let user know when old context is dropped.

---
