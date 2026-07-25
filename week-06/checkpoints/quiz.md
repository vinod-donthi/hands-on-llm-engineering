# Week 6 Quiz

> Week 6 · [← Exit Criteria](exit-criteria.md)

### Quiz (15 Questions)

#### Conceptual (1–10)

**1.** Why is automated eval considered the top production readiness signal for LLM apps?
- (a) It replaces the need for observability
- (b) It catches silent regressions on prompt/model/retrieval changes with measurable gates
- (c) It eliminates API costs
- (d) It guarantees zero hallucinations

> **Answer:** (b)

---

**2.** Offline eval primarily uses:
- (a) Random production traffic only
- (b) A fixed golden dataset run before deploy
- (c) User star ratings
- (d) GPU utilization metrics

> **Answer:** (b)

---

**3.** RAGAS faithfulness measures:
- (a) API latency
- (b) Whether the answer is grounded in retrieved context
- (c) Embedding model dimension
- (d) Number of chunks indexed

> **Answer:** (b)

---

**4.** DeepEval is best suited for:
- (a) pytest-native fast LLM tests in CI
- (b) Training embedding models
- (c) Docker orchestration
- (d) Vector index compaction

> **Answer:** (a)

---

**5.** Promptfoo is primarily used for:
- (a) Database migrations
- (b) Prompt regression, model comparison, and red teaming
- (c) Kubernetes deployment
- (d) PDF parsing

> **Answer:** (b)

---

**6.** In a layered eval pipeline, which layer typically runs on every PR?
- (a) Full RAGAS on 50 samples
- (b) DeepEval on a small subset
- (c) Red team suite
- (d) Online 100% judging

> **Answer:** (b)

---

**7.** Baseline faithfulness 0.80 with max regression 5% — what is the floor?
- (a) 0.80
- (b) 0.75
- (c) 0.76
- (d) 0.70

> **Answer:** (c) — 0.80 × 0.95 = 0.76

---

**8.** LLM-as-judge calibration means:
- (a) Setting temperature to 0
- (b) Aligning judge scores with human labels on a labeled subset
- (c) Using the same model for generation and judging
- (d) Removing all rubrics

> **Answer:** (b)

---

**9.** Trace regression testing detects:
- (a) Only spelling errors
- (b) Structural behavior changes like different retrieved chunk IDs or tool sequences
- (c) Git merge conflicts
- (d) SSL certificate expiry

> **Answer:** (b)

---

**10.** Promptfoo red team should typically run:
- (a) On every keystroke
- (b) Weekly or pre-release, not every PR
- (c) Never — security is separate from eval
- (d) Only after a production incident

> **Answer:** (b)

---

#### Applied (11–15)

**11.** Faithfulness is 0.82, context recall drops from 0.75 to 0.60. Primary fix lever?
- (a) System prompt tone
- (b) Retrieval / chunking / embeddings
- (c) Frontend CSS
- (d) Increase temperature

> **Answer:** (b)

---

**12.** CI faithfulness stable at 0.78; Langfuse online sample drops to 0.65. Best action?
- (a) Disable CI
- (b) Add failing production queries to golden dataset; investigate drift
- (c) Lower floor to 0.50
- (d) Remove online sampling

> **Answer:** (b)

---

**13.** Agent gives correct final answer but calls `delete_database` tool. Which eval catches this?
- (a) RAGAS faithfulness only
- (b) Trajectory eval with forbidden tools list
- (c) BM25 score
- (d) Token count limit

> **Answer:** (b)

---

**14.** Which assertion type in Promptfoo is best for verifying exact stipend amount "$500"?
- (a) `llm-rubric` only
- (b) `contains` with value "500"
- (c) `javascript` random
- (d) No assertion needed

> **Answer:** (b)

---

**15.** Week 6 Eval Pipeline Studio CI gate blocks merge when:
- (a) Any single test case fails DeepEval
- (b) Faithfulness drops more than 5% below pinned baseline on full eval
- (c) Langfuse is unreachable
- (d) Docker image size increases

> **Answer:** (b) — also DeepEval failures on PR; primary regression gate is faithfulness on full eval

---

**Scoring:** ≥ 12/15 (80%) to pass. Review [theory/](../theory/) for missed questions.
