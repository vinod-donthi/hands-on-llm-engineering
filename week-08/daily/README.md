# Week 8 — Daily Playbooks (AI Radar Capstone)

> **Start here:** [Day 1 — Phase 1](day-01.md) · [← Week README](../README.md) · [Progress](../progress.md)

**Prerequisite:** Weeks 1–7 exit criteria (RAG, agents, production, eval).

Each day maps to one of **four implementation phases**. Follow steps in order — do not read all theory upfront.

**Work dir:** `Learning/week-08-work/` or `~/ai-learning/week-08-work/`

---

## Week at a glance

| Day | Phase | Playbook | Theory (in order) | Lab / build | Deliverable(s) |
|-----|-------|----------|-------------------|-------------|----------------|
| **1** | 1 | [day-01.md](day-01.md) | capstone-architecture → ingestion-scheduling | [Lab 1](../labs/lab-01-ingestion-smoke.md) | `ingestion_smoke.json`, scaffold |
| **2** | 1 | [day-02.md](day-02.md) | pgvector-redis-caching (pgvector) | [Lab 2](../labs/lab-02-pgvector-retrieval.md) | ≥ 50 docs, `ingestion_report.json` |
| **3** | 2 | [day-03.md](day-03.md) | langgraph-orchestration → mcp-tool-integration | [Lab 3](../labs/lab-03-langgraph-mcp.md) | `mcp_tool_trace.json` |
| **4** | 2 | [day-04.md](day-04.md) | agentic-rag-patterns | [Lab 4](../labs/lab-04-agentic-rag-query.md) | `agent_query_trace.json`, ADR |
| **5** | 3 | [day-05.md](day-05.md) | nextjs-dashboard → pgvector-redis (Redis) | [Lab 5](../labs/lab-05-redis-semantic-cache.md) | Dashboard + `cache_hit_report.json` |
| **6** | 3 | [day-06.md](day-06.md) | ingestion-scheduling (digest) | [Lab 6](../labs/lab-06-email-digest-scheduler.md) | `digest_preview.html` |
| **7** | 4 | [day-07.md](day-07.md) | eval-ci-gates → docker-azure | Eval + Docker ship | `rag_eval_report.json`, README |

---

## Phase summary

| Phase | Days | Milestone |
|-------|------|-----------|
| [1 Foundation](../project/phases/phase-1-foundation.md) | 1–2 | Corpus in pgvector |
| [2 Intelligence](../project/phases/phase-2-intelligence.md) | 3–4 | LangGraph + agentic RAG |
| [3 Product](../project/phases/phase-3-product.md) | 5–6 | Dashboard + digest |
| [4 Production](../project/phases/phase-4-production.md) | 7 | Eval CI + ship |

---

## How to use each day

1. Open **only** that day's playbook (`day-XX.md`).
2. Complete steps **1 → N** in order.
3. Stop when **Done when** checkboxes are satisfied.
4. Update [progress.md](../progress.md) — day + phase milestone.
5. Open the **Tomorrow** link.

**Catch-up mode:** lab/build steps + deliverables only; skim theory Concepts + takeaway.

---

## Where else to look

| Resource | Use when |
|----------|----------|
| [theory/README.md](../theory/README.md) | Map by day — not a reading list |
| [roadmap.md](../roadmap.md) | Time budget, cost |
| [project/architecture.md](../project/architecture.md) | Folder structure reference |
| [resources/glossary.md](../resources/glossary.md) | Unknown term |
