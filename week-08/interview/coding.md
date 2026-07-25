# Week 8 Interview — Coding

> [← Concepts](concepts.md) · [Cheat Sheet](cheat-sheet.md)

Short coding exercises aligned with AI Radar — practice in work dir or whiteboard.

---

## Exercise 1: Hybrid score merge

Given ranked lists from vector search and BM25, implement reciprocal rank fusion (RRF) with `k=60`.

**Input:** two lists of chunk IDs with ranks  
**Output:** merged top 8 IDs

---

## Exercise 2: Semantic cache lookup

Given query embedding and list of `{embedding, response}` in Redis, return cache hit if cosine similarity ≥ threshold.

Pseudocode acceptable — mention normalization.

---

## Exercise 3: Citation validator

Function: `validate_answer_citations(answer: str, allowed_urls: set[str]) -> bool`

Return False if markdown link URL not in allowed set from retrieved chunks.

---

## Exercise 4: Ingestion idempotency

SQL sketch: insert document only if `url` not exists — async SQLAlchemy pattern.

---

## Exercise 5: LangGraph conditional edge

Pseudocode: route to `synthesize` if `state["critique"]["sufficient"]` else `tool_router` with iteration cap.

---

## Exercise 6: RAGAS gate

Python: `def ci_pass(current: dict, baseline: dict, max_drop_pct: float) -> bool` comparing faithfulness, context_precision.

---

## Evaluation rubric

| Score | Criteria |
|-------|----------|
| Strong | Working code + mentions edge cases |
| OK | Pseudocode + correct logic |
| Weak | API confusion only |

Target **≥ 4/6 OK or Strong** before interviews.

---

## Next

[Cheat Sheet](cheat-sheet.md)
