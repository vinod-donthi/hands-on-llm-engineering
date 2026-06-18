# Week 2 Quiz

> Week 2 · [← Exit Criteria](exit-criteria.md)

### Quiz (15 Questions)

#### Conceptual (1–10)

**1.** Where does the system prompt go in Anthropic's API?
- (a) First `user` message
- (b) Top-level `system` parameter
- (c) `assistant` message prefix
- (d) HTTP header

> **Answer:** (b)

---

**2.** What metric best captures perceived chat responsiveness?
- (a) Total latency
- (b) Time to first token (TTFT)
- (c) Output token count
- (d) Context window size

> **Answer:** (b)

---

**3.** Who executes a function when the model returns `tool_calls`?
- (a) The model
- (b) The provider API
- (c) Your application code
- (d) The browser

> **Answer:** (c)

---

**4.** Why use Server-Sent Events (SSE) for LLM streaming?
- (a) Bidirectional binary protocol
- (b) One-way server→client push over HTTP
- (c) Required by OpenAI
- (d) Replaces WebSockets for all use cases

> **Answer:** (b)

---

**5.** What is the primary purpose of a YAML model registry?
- (a) Store API keys
- (b) Configure models without code changes
- (c) Replace PostgreSQL
- (d) Cache embeddings

> **Answer:** (b)

---

**6.** Tail-keep trimming removes:
- (a) Newest messages first
- (b) System prompt first
- (c) Oldest user/assistant pairs first
- (d) Tool definitions only

> **Answer:** (c)

---

**7.** Strict JSON schema mode on OpenAI guarantees:
- (a) Factually correct content
- (b) Output matches JSON Schema at generation time
- (c) Zero latency
- (d) No tool calls

> **Answer:** (b)

---

**8.** A sensible default for extraction tasks is:
- (a) temperature = 1.5
- (b) temperature = 0
- (c) No max_tokens
- (d) Skip Pydantic validation

> **Answer:** (b)

---

**9.** Cost in USD for a call equals:
- (a) input_tokens + output_tokens
- (b) (input/1e6 × price_in) + (output/1e6 × price_out)
- (c) latency_ms × 0.01
- (d) context_window / 1000

> **Answer:** (b)

---

**10.** Input guardrails should run:
- (a) Only in the frontend
- (b) Before calling the LLM API
- (c) After user sees the response
- (d) Only in production

> **Answer:** (b)

#### Applied (11–15)

**11.** You get HTTP 400 `context_length_exceeded`. First fix?
- (a) Increase temperature
- (b) Trim history or reduce input
- (c) Switch to embeddings
- (d) Disable streaming

> **Answer:** (b)

---

**12.** Benchmark shows Llama 8B matches GPT-4o Mini on JSON extraction. Best action?
- (a) Remove cloud models
- (b) Use local for that task if privacy/cost matter; verify parse_success_rate
- (c) Stop benchmarking
- (d) Raise temperature

> **Answer:** (b)

---

**13.** Anthropic returns `tool_use` blocks. Your adapter should:
- (a) Ignore them
- (b) Normalize into internal tool_call format
- (c) Return raw blocks to frontend
- (d) Convert to SSE only

> **Answer:** (b)

---

**14.** Daily budget exceeded. Correct behavior?
- (a) Silent failure
- (b) Reject new requests with 429 and log alert
- (c) Unlimited retries
- (d) Delete Postgres

> **Answer:** (b)

---

**15.** Fair multi-model benchmark requires:
- (a) Different prompts per model
- (b) Same prompts, same temperature policy, observability on every row
- (c) Only cloud models
- (d) No cost logging

> **Answer:** (b)

---

**Scoring:** 12/15 = pass (80%)
