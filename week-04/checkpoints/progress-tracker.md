# Week 4 Interview Progress Tracker

> [← README](../README.md) · [Exit Criteria](exit-criteria.md)

Rate each **1–5** (1 = couldn't explain, 5 = hire-ready whiteboard). Target: **≥ 4 on at least 4/5 parts**.

| Part | Topic | 1 | 2 | 3 | 4 | 5 |
|------|-------|---|---|---|---|---|
| **A** | ReAct, agent vs chain, tool loop | | | | | |
| **B** | LangGraph architecture (state, nodes, checkpoints) | | | | | |
| **C** | MCP + security + HITL | | | | | |
| **D** | Multi-agent + memory + reflection | | | | | |
| **E** | System design: autonomous research agent | | | | | |

## Part E prompt (practice 25 min)

*"Design an autonomous research agent for a legal team. It searches web and internal docs, cites sources, and must not email externals without approval. Walk through architecture, failure modes, and observability."*

Checklist you should mention:

- [ ] LangGraph or equivalent state graph
- [ ] Tool tiers + HITL on high-risk
- [ ] Checkpoint resume
- [ ] Idempotent/search cache
- [ ] Trace every tool call + cost
- [ ] Week 3 RAG as doc_search tool
- [ ] MCP for portable tools (optional bonus)

## Coding assignment

See [interview/coding.md](../interview/coding.md). Target ≥ 70%.

## Notes

_Space for weak areas to revisit:_

---

**Date completed:** ______
