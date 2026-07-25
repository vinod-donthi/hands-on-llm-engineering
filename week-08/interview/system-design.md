# Week 8 Interview — Capstone Defense (System Design)

> [← README](../README.md) · [Cheat Sheet](cheat-sheet.md) · [Acceptance Criteria](../project/acceptance-criteria.md)

Practice a **15-minute architecture walkthrough** + **10-minute deep dive**. This is the interview format for staff-engineer loops.

---

## Prompt (mock)

*"You built AI Radar — walk me through the architecture. How does a user query get answered? What happens overnight? How do you know quality didn't regress?"*

---

## Recommended answer structure (15 min)

### 1. One-liner (30 sec)

AI Radar ingests RSS and GitHub into pgvector, answers questions via a LangGraph agent with MCP tools and agentic RAG, surfaces trends on a Next.js dashboard, and emails a daily digest — with RAGAS CI gates.

### 2. Diagram narrative (3 min)

Draw or reference [architecture.md](../project/architecture.md): ingestion → Postgres → agent path → cache → UI/email → eval CI.

### 3. Query path deep dive (5 min)

Cache check → plan node → MCP vs RAG branch → critique loop → citations. Mention latency and cost numbers from your artifacts.

### 4. Operations (3 min)

Celery schedules ingestion every 6h, digest at 7 AM. Docker Compose for local; optional Azure. Cost controls: semantic cache, daily budget middleware.

### 5. Quality (3 min)

RAGAS golden set, faithfulness ≥ 0.75, CI blocks > 5% regression. Show `rag_eval_report.json` or badge.

---

## Follow-up questions (be ready)

| Question | Strong answer includes |
|----------|------------------------|
| Why agentic RAG vs always retrieve? | Plan + critique; live GitHub vs stale corpus — cite ADR |
| Why MCP? | Tool boundary, swap search provider, security isolation |
| Why pgvector not Pinecone? | Single DB, Week 3 path, capstone scope |
| Cache invalidation? | TTL, model version in key, skip for time-sensitive |
| Failure modes? | RSS down → partial ingest logged; agent timeout → 503 + trace |
| Scale to 10x traffic? | Horizontal API pods, read replicas, queue ingestion, separate vector index tuning |
| Privacy / compliance? | Public data only; no user PII; API keys in vault |
| What would you add next? | Online eval sampling, Slack digest, human feedback on citations |

---

## Red flags interviewers watch for

- Cannot explain tool loop or who executes tools
- No eval story — "I eyeball outputs"
- Citations decorative — not tied to claims
- Cannot estimate cost per query

---

## Self-assessment rubric

Score 1–5 each; **≥ 4 average = hire-ready** for capstone defense.

| # | Criterion | 1 | 3 | 5 |
|---|-----------|---|---|---|
| 1 | Clear end-to-end narrative | Lost | OK with notes | Crisp whiteboard |
| 2 | Tradeoff reasoning | Buzzwords | One tradeoff | Multiple with alternatives rejected |
| 3 | Data + agent layers | Conflates | Separates | Explains handoffs |
| 4 | Production ops | Dev only | Docker | Docker + eval CI + cost |
| 5 | Depth on request | Cannot go deeper | One layer deeper | Metrics, failures, scale |

Record scores in [progress-tracker.md](../checkpoints/progress-tracker.md).

---

## 30-minute drill

1. Whiteboard architecture (5 min)
2. Explain one `agent_query_trace.json` (5 min)
3. Explain CI failure scenario (5 min)
4. Peer or self record — watch filler words (15 min review)

---

## Next

[Concepts](concepts.md) · [Coding](coding.md) · [Cheat Sheet](cheat-sheet.md)
