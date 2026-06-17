# Week 1 Quiz

> Week 1 · [← Exit Criteria](exit-criteria.md)

### Quiz (15 Questions)

#### Conceptual (Questions 1–10)

**1.** Which statement is correct?
- (a) All AI systems use machine learning
- (b) Deep learning is a subset of machine learning
- (c) Generative AI is the same as deep learning
- (d) LLMs are encoder-only transformers

> **Answer:** (b)

---

**2.** In scaled dot-product attention, why divide by √d_k?
- (a) To reduce memory usage
- (b) To prevent softmax saturation from large dot products
- (c) To enable parallelization
- (d) To implement causal masking

> **Answer:** (b)

---

**3.** What is the time complexity of self-attention over sequence length n (standard implementation)?
- (a) O(n)
- (b) O(n log n)
- (c) O(n²)
- (d) O(1)

> **Answer:** (c)

---

**4.** Which training stage aligns model outputs with human preferences?
- (a) Pre-training
- (b) Instruction tuning
- (c) RLHF
- (d) Tokenization

> **Answer:** (c)

---

**5.** When is RAG preferred over fine-tuning?
- (a) When you need to change model writing style
- (b) When the gap is factual knowledge in specific documents
- (c) When you have no documents
- (d) When you need the smallest possible model

> **Answer:** (b)

---

**6.** Temperature = 0 typically produces:
- (a) Maximum creativity
- (b) Greedy/deterministic token selection
- (c) Longer outputs
- (d) Higher hallucination rate

> **Answer:** (b)

---

**7.** What does top-p (nucleus) sampling control?
- (a) Maximum output length
- (b) The cumulative probability mass of the sampling pool
- (c) Input context size
- (d) Embedding dimension

> **Answer:** (b)

---

**8.** KV cache is primarily used to:
- (a) Store training gradients
- (b) Avoid recomputing key/value tensors during autoregressive decode
- (c) Compress the context window
- (d) Cache API responses at the HTTP layer

> **Answer:** (b)

---

**9.** Which is a confabulation-type hallucination?
- (a) Grammatical error in output
- (b) Inventing a nonexistent research paper citation
- (c) Slow response latency
- (d) Token limit exceeded error

> **Answer:** (b)

---

**10.** JSON mode differs from structured outputs because:
- (a) JSON mode enforces schema compliance; structured outputs only enforce syntax
- (b) Structured outputs enforce schema compliance; JSON mode only guarantees valid JSON syntax
- (c) They are identical on all providers
- (d) JSON mode requires temperature = 1.0

> **Answer:** (b)

---

#### Applied (Questions 11–15)

**11.** A prompt uses 1,500 input tokens. The model generates 800 output tokens. Input price is $3/MTok, output price is $15/MTok. What is the total cost?

> **Answer:** (1500 × 3 / 1,000,000) + (800 × 15 / 1,000,000) = $0.0045 + $0.012 = **$0.0165**

---

**12.** A model has a 128K context window. You reserve 4K for output and 2K for system prompt. What is the maximum user+history token budget?

> **Answer:** 128,000 - 4,000 - 2,000 = **122,000 tokens**

---

**13.** You run the same prompt at temperature 0 three times and get identical outputs. At temperature 1.2, outputs differ significantly. Which parameter should you lower to improve format consistency for JSON extraction?

> **Answer:** **Temperature** (set to 0 or near 0). Optionally also lower top-p.

---

**14.** An application stuffs 200K tokens of documents into a 32K context model. The API does not error but answers miss information in the middle of documents. Name two strategies to fix this.

> **Answer:** Any two of: (1) RAG — retrieve only relevant chunks; (2) summarization compression; (3) use a longer-context model; (4) chunk documents and query selectively; (5) middle-out truncation awareness — restructure prompt to put key info at start/end.

---

**15.** A `/api/v1/compare` call fans out to 3 models; one returns 503. What should the response contain?

> **Answer:** 3 result objects — two with `error: null` and full observability fields; one with `error` set, `text` empty, and `request_id` still populated. `parent_request_id` ties the batch together. Other models must not be blocked.

---

**Pass threshold:** 12/15 (80%) or higher.

---

### Coding Assignment: Observability Envelope + JSON Extraction Endpoint
