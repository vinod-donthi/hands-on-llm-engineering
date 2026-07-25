# Week 7 Quiz

> [← README](../README.md) · [Exit Criteria](exit-criteria.md)

**Pass:** ≥ 12/15 (80%) · Answers in theory pages and labs.

---

## Section A — Decision framework (3)

1. Name two signals that favor **RAG** over **fine-tuning**.
2. When is a **bigger model** the right first step?
3. What hybrid pattern combines fresh facts with locked output format?

---

## Section B — Fine-tune & distillation (3)

4. What does LoRA train instead of the full weight matrix?
5. Why should you not fine-tune encyclopedic product facts that change weekly?
6. When does a distilled 3B model need a teacher fallback?

---

## Section C — Agentic RAG (3)

7. What question type motivates agentic over classic RAG?
8. What happens if `max_retrieval_steps` is uncapped?
9. Name two grader implementation options.

---

## Section D — Long context & GraphRAG (2)

10. At high QPS with a 95K-token doc, which is usually cheaper — stuff or RAG?
11. **Optional:** What query type favors GraphRAG over vector RAG?

---

## Section E — MCP & multimodal (2)

12. Why block RFC1918 in MCP `fetch_url`?
13. Why not send every user message with images to a vision model?

---

## Section F — System design (2)

14. Your ADR chose Track B. Name one metric from Day 1 baseline you'd cite.
15. List three production controls on an MCP SSE server.

---

## Answer key (self-grade)

<details>
<summary>Click after attempting</summary>

1. Knowledge changes often; multi-doc corpus updates frequently
2. Pilot, low volume, need max quality before optimizing cost
3. RAG + fine-tuned generator (or similar hybrid)
4. Low-rank adapter matrices A·B beside frozen weights
5. Fine-tune goes stale; use RAG for fresh facts
6. Low confidence / out-of-distribution inputs
7. Multi-hop across documents
8. Infinite retrieve loops, runaway cost
9. LLM structured grader; rerank score threshold (any two)
10. RAG (lower input tokens per query)
11. Global thematic synthesis across many docs
12. SSRF — prevent probing internal network
13. Cost and token bloat; use vision selectively
14. Any from baseline_eval / decision_matrix (accept reasonable)
15. Auth, rate limit, SSRF block, health check, response cap (any three)

</details>
