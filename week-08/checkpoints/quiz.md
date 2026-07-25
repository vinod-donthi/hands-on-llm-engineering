# Week 8 Quiz — AI Radar Capstone

> [← Exit Criteria](exit-criteria.md) · Pass: **≥ 12/15 (80%)**

Answer from course materials and your built project.

---

## Section A — Architecture (5 questions)

**1.** Name the four Week 8 implementation phases in order.

**2.** What two storage systems does AI Radar use and what is each for?

**3.** Which phase delivers the Next.js dashboard?

**4.** What file documents the decision between agentic and static RAG?

**5.** Name three MCP tools required for the capstone.

---

## Section B — Data & retrieval (4 questions)

**6.** How does hybrid retrieval differ from vector-only search?

**7.** What field deduplicates ingested documents?

**8.** What similarity threshold is suggested for semantic cache (default in `.env.example`)?

**9.** What minimum document count is required in pgvector for Phase 1?

---

## Section C — Agents & product (3 questions)

**10.** What LangGraph node decides if more context is needed?

**11.** What API endpoint powers agent Q&A?

**12.** What two cron jobs are configured in `.env.example`?

---

## Section D — Eval & ops (3 questions)

**13.** What RAGAS metric measures whether answers are supported by context?

**14.** What percentage regression triggers CI failure by default?

**15.** Name two Docker Compose services required besides backend.

---

## Answer key

<details>
<summary>Click to reveal</summary>

1. Foundation → Intelligence → Product → Production  
2. PostgreSQL+pgvector (corpus); Redis (semantic answer cache)  
3. Phase 3 (Days 5–6)  
4. `docs/adr/001-agentic-rag-vs-static.md`  
5. web_search, rss_lookup, github_search (accept search/rss/github variants)  
6. Combines vector similarity + keyword/BM25 (RRF)  
7. URL (unique key / hash)  
8. 0.92  
9. 50 documents  
10. critique (accept critique node)  
11. `POST /api/v1/radar/query`  
12. INGESTION_CRON and DIGEST_CRON  
13. Faithfulness  
14. 5% (EVAL_REGRESSION_MAX_PCT)  
15. postgres, redis, worker, frontend — any two besides backend  

</details>

---

## Next

[Exit criteria](exit-criteria.md) · [Capstone defense](../interview/system-design.md)
