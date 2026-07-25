# Week 4 Roadmap

> [← README](README.md) · [Progress Tracker](progress.md)

## Learning Path

**Default:** Follow [daily/day-XX.md](daily/) numbered steps in order (theory → lab → deliverable).

**Catch-up** (behind schedule): On each daily page, do lab/build steps + deliverables only; skim theory Concepts + takeaway.

```
Daily playbook (driver) → theory (linked steps) → lab/build → deliverable → progress.md → Tomorrow link
```

**Rule:** Good enough to continue > perfect completion.

---

## Weekly Outcomes

By end of Week 4 you will:

1. Distinguish chains, workflows, and agents — and pick the right pattern
2. Implement a ReAct loop in LangGraph with state, nodes, and conditional edges
3. Compare LangGraph, OpenAI Agents SDK, and Pydantic AI for real tasks
4. Expose tools via MCP and consume them from an agent safely
5. Add memory, planning, reflection, and human approval gates
6. Build multi-agent supervisor/handoff patterns with checkpoint resume
7. Ship **Research Agent Studio** — autonomous research with citations and HITL

---

## Time Budget (Anti-Burnout)

| Constraint | Limit |
|------------|-------|
| Max per day | **5 hours** |
| Max per week | **28 hours** |
| Optional skip | **ONE** lab (recommend Lab 6 if behind) |

### Priority Order (catch-up only)

1. **Today's deliverable** from [daily/](daily/) playbook
2. **Labs / build** steps on that day
3. **Theory** — Concepts + AI engineer takeaway only
4. **Go Deeper** — skip unless interviewing

---

## Model Scope (Week 4)

### Required

| Role | Model | Why |
|------|-------|-----|
| Agent reasoning | **GPT-4o Mini** | Strong tool use, low cost for multi-step loops |
| Structured extraction | **GPT-4o Mini** | Pydantic AI / JSON outputs in reflection step |

### Optional

| Model | Use |
|-------|-----|
| GPT-4o | Hard synthesis or judge step (1–2 calls) |
| Claude 3.5 Haiku | Compare tool reliability vs OpenAI |

> Week 4 focuses on **orchestration**, not model shopping. Stick to one primary model unless benchmarking tool accuracy.

---

## Framework Selection (Week 4)

| Framework | Week 4 role | Best for |
|-----------|-------------|----------|
| **LangGraph** | Primary — graph, checkpoints, HITL | Stateful agents, production control flow |
| **OpenAI Agents SDK** | Lab 2 + handoff pattern | Fast handoffs, guardrails, sessions |
| **Pydantic AI** | Typed tool I/O in one node | Strict schemas on tool args/results |
| **MCP** | Custom research tools | Portable tools across clients |

---

## Core Knowledge Objectives

| # | Objective | Theory |
|---|-----------|--------|
| 1 | ReAct loop; agent vs chain | [react-loop-agent-vs-chain.md](theory/react-loop-agent-vs-chain.md) |
| 2 | LangGraph state graphs | [langgraph.md](theory/langgraph.md) |
| 3 | OpenAI Agents SDK | [openai-agents-sdk.md](theory/openai-agents-sdk.md) |
| 4 | Pydantic AI typed agents | [pydantic-ai.md](theory/pydantic-ai.md) |
| 5 | MCP servers, tools, security | [mcp-protocol.md](theory/mcp-protocol.md) |
| 6 | Memory and planning | [agent-memory-planning.md](theory/agent-memory-planning.md) |
| 7 | Reflection and self-correction | [reflection-self-correction.md](theory/reflection-self-correction.md) |
| 8 | Human-in-the-loop interrupts | [human-in-the-loop.md](theory/human-in-the-loop.md) |
| 9 | Multi-agent patterns | [multi-agent-patterns.md](theory/multi-agent-patterns.md) |
| 10 | Checkpointing and idempotency | [checkpointing-idempotency.md](theory/checkpointing-idempotency.md) |
| 11 | Agent observability | [agent-observability.md](theory/agent-observability.md) |

---

## Build Objective

Ship [Research Agent Studio](project/overview.md): LangGraph research agent with web search, document retrieval (Week 3), MCP tools, HITL on risky actions, checkpoints, and cited final reports.

---

## Daily Index

| Day | Focus | Hours (max) |
|-----|-------|-------------|
| [Day 1](daily/day-01.md) | ReAct loop + LangGraph basics | 4h |
| [Day 2](daily/day-02.md) | OpenAI Agents SDK + Pydantic AI | 4h |
| [Day 3](daily/day-03.md) | MCP protocol + custom server | 4–5h |
| [Day 4](daily/day-04.md) | Memory, planning, reflection | 4–5h |
| [Day 5](daily/day-05.md) | Human-in-the-loop interrupts | 4h |
| [Day 6](daily/day-06.md) | Multi-agent + checkpointing + project wiring | 4–5h |
| [Day 7](daily/day-07.md) | Research Agent Studio capstone | 4–5h |

---

## Cost Budget

| Category | Spend |
|----------|-------|
| GPT-4o Mini (labs + capstone) | $3–8 |
| Tavily web search | $0–5 (free tier often enough) |
| DuckDuckGo fallback | $0 |
| **Total** | **$5–15** |

---

## Week 3 Prerequisite Refresh

Before Day 1, you should be able to:

- Chunk documents and embed them into Chroma (or pgvector)
- Run hybrid retrieval + rerank for a user question
- Return answers with `source_id` / page citations

If not, revisit Week 3 Labs 2–4 before starting Week 4.
