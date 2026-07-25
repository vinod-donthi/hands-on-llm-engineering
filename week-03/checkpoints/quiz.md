# Week 3 Quiz

> Week 3 · [← Exit Criteria](exit-criteria.md)

### Quiz (15 Questions)

#### Conceptual (1–10)

**1.** What is the primary purpose of chunking in RAG?
- (a) Compress PDF file size
- (b) Split documents into retrievable units sized for embedding and context
- (c) Encrypt document text
- (d) Train the LLM

> **Answer:** (b)

---

**2.** Why should query and document embeddings use the same model?
- (a) API requirement
- (b) Vectors must live in the same semantic space for meaningful similarity
- (c) Faster inference
- (d) Required by BM25

> **Answer:** (b)

---

**3.** BM25 excels at which query type?
- (a) Paraphrased semantic questions
- (b) Exact keyword, SKU, or error code lookup
- (c) Image search
- (d) Multi-hop reasoning alone

> **Answer:** (b)

---

**4.** RRF combines retrieval lists using:
- (a) Average of normalized scores
- (b) Reciprocal of ranks with smoothing constant k
- (c) GPT-4 reranking
- (d) Alphabetical chunk_id order

> **Answer:** (b)

---

**5.** Cross-encoder reranking is applied to:
- (a) The entire corpus
- (b) A small set of candidate chunks from stage-1 retrieval
- (c) Only the user query
- (d) The LLM output after generation

> **Answer:** (b)

---

**6.** Parent-child chunking means:
- (a) Embed parents, search children
- (b) Embed/search children, often return parent text to the LLM
- (c) Delete parent documents after chunking
- (d) Store only PDF covers

> **Answer:** (b)

---

**7.** RAGAS faithfulness measures:
- (a) API latency
- (b) Whether the answer is grounded in retrieved context
- (c) Embedding model size
- (d) Number of PDF pages

> **Answer:** (b)

---

**8.** Chroma is primarily recommended in Week 3 for:
- (a) Production multi-tenant SaaS
- (b) Local development and fast iteration
- (c) Replacing PostgreSQL entirely
- (d) Training embedding models

> **Answer:** (b)

---

**9.** First step when a RAG answer is wrong but retrieval logs show the correct chunk was retrieved:
- (a) Re-index all documents
- (b) Suspect generation/prompt or context assembly
- (c) Delete BM25 index
- (d) Switch to temperature 2.0

> **Answer:** (b)

---

**10.** A golden dataset for RAG eval should:
- (a) Be generated entirely by the chatbot
- (b) Include ground-truth answers from source documents
- (c) Contain only easy keyword questions
- (d) Avoid unanswerable questions

> **Answer:** (b)

---

#### Scenario (11–13)

**11.** Query `"ERR_AUTH_4012"` returns irrelevant semantic matches but not the error doc. Best fix?
- (a) Increase temperature
- (b) Add or fix hybrid search (BM25 + dense + RRF)
- (c) Use larger chat model only
- (d) Remove citations

> **Answer:** (b)

---

**12.** Faithfulness is 0.9 but context recall is 0.4. What layer likely needs work?
- (a) Retrieval / chunking
- (b) SSE streaming
- (c) Docker Compose
- (d) Frontend CSS

> **Answer:** (a)

---

**13.** You change from `text-embedding-3-small` to `text-embedding-3-large`. Required action?
- (a) Nothing
- (b) Full re-embed and re-index all chunks
- (c) Only update .env chat model
- (d) Delete golden dataset

> **Answer:** (b)

---

#### Short answer (14–15)

**14.** In one sentence, what does RRF solve when merging BM25 and dense results?

> **Sample answer:** It merges ranked lists without needing to normalize incompatible score scales by summing reciprocal ranks.

---

**15.** Name two metrics from RAGAS besides faithfulness.

> **Sample answer:** Context precision, context recall, answer relevancy (any two).

---

## Scoring

| Score | Result |
|-------|--------|
| ≥ 12/15 | Pass — proceed |
| 10–11 | Review weak topics, retake |
| < 10 | Re-read theory Concepts + retake |

Mark completion in [progress.md](../progress.md).
