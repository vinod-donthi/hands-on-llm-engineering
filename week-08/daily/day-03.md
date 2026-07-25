# Day 3 — Phase 2: LangGraph + MCP Tools

> **You are here:** Day 3 of 7 · Phase 2 of 4 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 2](day-02.md) |
| **Today's outcome** | LangGraph agent calling MCP search, RSS, GitHub |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-08-work/` or `~/ai-learning/week-08-work/` |
| **Stop when** | `mcp_tool_trace.json` exists |

**Catch-up:** Lab 3 only; skim LangGraph Concepts.

---

## Steps

### Step 1 — Theory: LangGraph (~35 min)

Read [langgraph-orchestration.md](../theory/langgraph-orchestration.md).

### Step 2 — Theory: MCP (~30 min)

Read [mcp-tool-integration.md](../theory/mcp-tool-integration.md).

### Step 3 — Project spec (~15 min)

Read [phase-2-intelligence.md](../project/phases/phase-2-intelligence.md) Day 3 section.

### Step 4 — LangGraph scaffold (~90 min)

- Define `AgentState` in `app/agents/state.py`
- Nodes: `plan`, `tool_router`, `synthesize`
- Compile graph in `app/agents/graph.py`

### Step 5 — MCP tools (~90 min)

Implement tools: `web_search`, `rss_lookup`, `github_search` in `app/mcp/tools/`.

### Step 6 — Lab 3 (~60 min)

Follow [Lab 3](../labs/lab-03-langgraph-mcp.md).

### Step 7 — Deliverable

- [ ] Agent invokes ≥ 2 MCP tools on test query
- [ ] `mcp_tool_trace.json` with inputs, outputs, latency
- [ ] Checkpointer saves graph state (Sqlite OK)

### Step 8 — Close out

- [ ] Mark Day 3 in [progress.md](../progress.md)

---

## Done when

- [ ] `mcp_tool_trace.json` in artifacts/
- [ ] Graph runs end-to-end without RAG node yet

---

## Tomorrow

**→ [Day 4 — Agentic RAG](day-04.md)** — start with [agentic-rag-patterns.md](../theory/agentic-rag-patterns.md)
