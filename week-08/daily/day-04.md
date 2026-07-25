# Day 4 — Phase 2: Agentic RAG Query Path

> **You are here:** Day 4 of 7 · Phase 2 of 4 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 3](day-03.md) |
| **Today's outcome** | Cited answers via `POST /api/v1/radar/query` |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-08-work/` or `~/ai-learning/week-08-work/` |
| **Stop when** | Phase 2 milestone + ADR written |

**Catch-up:** Lab 4 + query endpoint; skip ADR if desperate (not recommended).

---

## Steps

### Step 1 — Theory: Agentic RAG (~40 min)

Read [agentic-rag-patterns.md](../theory/agentic-rag-patterns.md).

### Step 2 — Agentic RAG node (~90 min)

Implement `app/agents/agentic_rag.py` — retrieve → critique → expand loop (max 2).

Wire conditional edges in graph per [phase-2](../project/phases/phase-2-intelligence.md).

### Step 3 — Query API (~60 min)

Implement `POST /api/v1/radar/query` per [api.md](../project/api.md).

### Step 4 — Lab 4 (~60 min)

Follow [Lab 4](../labs/lab-04-agentic-rag-query.md).

### Step 5 — ADR (~30 min)

Write `docs/adr/001-agentic-rag-vs-static.md` — why agent decides retrieve vs search.

### Step 6 — Deliverable

- [ ] ≥ 3 golden queries return cited answers
- [ ] `agent_query_trace.json` artifact
- [ ] Phase 2 acceptance boxes checked

### Step 7 — Close out

- [ ] Mark Day 4 + Phase 2 in [progress.md](../progress.md)

---

## Done when

- [ ] Query API returns `citations[]` for factual answers
- [ ] Phase 2 milestone complete

---

## Tomorrow

**→ [Day 5 — Dashboard + Cache](day-05.md)** — start with [nextjs-dashboard-patterns.md](../theory/nextjs-dashboard-patterns.md)
