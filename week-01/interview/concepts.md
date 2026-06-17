# Conceptual Interview Questions

> Week 1 · [← README](../README.md)


**Q1: Explain the difference between AI, ML, DL, and Generative AI.**

> **Answer outline:** AI is the umbrella. ML learns from data without explicit rules. DL uses deep neural networks for unstructured data. GenAI creates new content by modeling data distributions; LLMs are the text modality. Give examples at each layer and state when an LLM is overkill (tabular classification → XGBoost).

---

**Q2: How does self-attention work in transformers?**

> **Answer outline:** Each token projects to Q, K, V. Attention weights = softmax(QK^T / √d_k). Weighted sum of V vectors. Multi-head runs parallel heads for different relationship types. Decoder uses causal mask. Complexity O(n²) in sequence length.

---

**Q3: Why are decoder-only models dominant for LLM applications?**

> **Answer outline:** Single architecture handles generation, in-context learning, tool use. Scaled better than encoder-decoder for general capabilities. Ecosystem convergence (GPT, Claude, Llama all decoder-only). Encoder models still used for embeddings.

---

**Q4: What is the difference between pre-training, fine-tuning, instruction tuning, and RLHF?**

> **Answer outline:** Pre-training learns language from massive corpus. SFT adapts to tasks with labeled data. Instruction tuning uses (instruction, response) pairs for helpfulness. RLHF optimizes against human preference reward model. Chat models = pre-train → instruct → RLHF.

---

**Q5: When would you NOT fine-tune an LLM?**

> **Answer outline:** When prompt engineering suffices; when gap is knowledge (use RAG); when you need fast iteration; when training data is insufficient; when cost/time cannot be justified. Fine-tune for behavior/style/format, not facts.

---

**Q6: How do temperature and top-p affect output?**

> **Answer outline:** Temperature scales logits — low = deterministic/greedy, high = diverse/random. Top-p truncates to nucleus of cumulative probability mass. Adjust one at a time. Use temp=0 for extraction/code; moderate for chat; high for creative tasks.

---

**Q7: What causes hallucinations and how do you mitigate them?**

> **Answer outline:** Causes: training on noisy data, no grounding, helpfulness pressure, ambiguous prompts, high temperature. Mitigations: RAG with citations, tool verification, refusal prompts, low temperature, evals, human review. Cannot eliminate entirely — design systems to reduce and detect.

---

**Q8: How do you estimate the cost of an LLM API call?**

> **Answer outline:** Count input tokens + output tokens separately. Multiply by per-million pricing for each. Add up. Use tiktoken or provider APIs. Factor in system prompt (every request), retries, and tool call overhead. Monitor in production with per-request logging.

---

**Q9: What is a context window and what happens when you exceed it?**

> **Answer outline:** Max tokens per request (input + output). Exceeding → error or truncation. Strategies: head/tail truncation, summarization, RAG. Reserve tokens for output. Long context has "lost in the middle" quality issues and higher cost.

---

**Q10: Explain prefill vs decode in inference.**

> **Answer outline:** Prefill processes entire prompt in parallel, populates KV cache. Decode generates one token at a time using cached K/V. TTFT dominated by prefill; streaming latency dominated by decode. KV cache memory scales with sequence length and batch size.

---

**Q11: What is the difference between tokens and words?**

> **Answer outline:** Tokens are subword units from BPE/byte-level tokenizers. One word may be 1+ tokens. Code and non-English text often have more tokens per character. Billing and context limits are in tokens, not words or characters.

---

**Q12: How do embeddings differ from generation model outputs?**

> **Answer outline:** Embeddings are fixed-size dense vectors from encoder models optimized for similarity. Generation models produce sequential tokens autoregressively. Use specialized embedding models for retrieval; do not conflate hidden states with production embeddings without proper pooling and evaluation.

---

**Q13: What is the difference between JSON mode and structured outputs?**

> **Answer outline:** JSON mode guarantees valid JSON syntax only — keys and types may be wrong. Structured outputs (response schema / constrained decoding) enforce schema compliance at generation time. Prefer structured outputs when available; use JSON mode + Pydantic validation as fallback. Always set temperature=0 for extraction.

---

**Q14: What observability fields should every LLM API response include?**

> **Answer outline:** `request_id` (correlation), `input_tokens`, `output_tokens`, `cost_usd`, `latency_ms`, `error` (null on success). Generate request_id at API boundary; use parent/child IDs for multi-model compare. Log structured JSON; never log secrets or full prompts in production.

---

