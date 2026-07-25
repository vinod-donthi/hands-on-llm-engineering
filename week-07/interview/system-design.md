# Week 7 Interview — System Design

> [← README](../README.md) · [Concepts](concepts.md)

## Scenario 1: Enterprise policy assistant

**Prompt:** 500 PDFs, updated monthly. Employees ask multi-hop compliance questions. Budget sensitive.

**Strong answer outline:**

1. **Clarify:** QPS, latency SLO, PII rules
2. **Baseline:** Classic RAG + eval golden set
3. **Gap:** Multi-hop failures → agentic RAG (Week 7)
4. **Not yet:** GraphRAG optional for "themes across all policies"
5. **Not:** Full fine-tune on facts (stale monthly)
6. **Ops:** Qdrant index, MCP for ticket lookup, Langfuse traces
7. **Metrics:** Faithfulness, p95 latency, $/query

---

## Scenario 2: High-volume ticket triage

**Prompt:** 50K tickets/day, taxonomy stable, company tone matters.

**Strong answer outline:**

1. LoRA fine-tune on historical tickets (Track A)
2. RAG only for rare policy edge cases (hybrid router)
3. Distilled 3B for draft → fine-tuned classify
4. ADR cites decision matrix + finetune_eval_report
5. CI eval gate blocks regression >5%

---

## Scenario 3: MCP tool platform

**Prompt:** Multiple agents call shared search + fetch tools in production.

**Strong answer outline:**

1. SSE MCP gateway with API keys per agent
2. Redis rate limits per key + global Tavily budget
3. SSRF blocks, 32KB response cap, 15s timeout
4. `/health` for K8s, structured logs without bodies
5. High-risk tools → HITL from Week 4

---

## Scenario 4: Long document product

**Prompt:** Users upload 200-page contracts, ask specific clause questions.

**Strong answer outline:**

1. Run Lab 5 style benchmark — likely RAG wins on cost
2. Long context for "summarize entire contract" button only
3. Context cache for session follow-ups on same doc
4. Citation required in all modes

[← Coding](coding.md)
