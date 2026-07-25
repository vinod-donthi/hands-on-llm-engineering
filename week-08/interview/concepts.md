# Week 8 Interview — Concepts

> [← System Design](system-design.md) · [Cheat Sheet](cheat-sheet.md)

Capstone-focused concept questions — answer from your **built** AI Radar, not generic definitions.

---

## Architecture & phases

1. What are the four implementation phases and their deliverables?
2. Why monorepo `ai-radar/` for a capstone?
3. What artifact proves Phase 1 complete?

## Ingestion

4. How do you prevent duplicate documents?
5. RSS vs GitHub ingestion — different failure modes?
6. What is stored in `ingestion_runs`?

## Retrieval & cache

7. Explain hybrid retrieval in one sentence.
8. Semantic cache vs exact key cache?
9. When should cache be bypassed?

## Agents

10. Name LangGraph nodes in your graph.
11. What is agentic RAG vs static RAG?
12. Max loop count — why?

## MCP

13. List three MCP tools and what each returns.
14. Where do API keys live in MCP architecture?

## Product

15. What API powers the query panel?
16. Digest job steps from cron to email?

## Eval & ops

17. Define RAGAS faithfulness.
18. What triggers CI eval failure?
19. Estimated cost per agent query with numbers from your run?

## Tradeoffs

20. pgvector in Postgres vs dedicated vector DB at scale?
21. Celery Beat vs cron?
22. Optional: why Azure Container Apps vs Compose?

---

## Answer tips

- Lead with **your** metrics (`cache_hit` rate, faithfulness score, doc count)
- Draw mini diagram on paper when stuck
- Say "I documented this in ADR-001" for design choices

---

## Next

[System Design defense](system-design.md) · [Coding](coding.md)
