# Lab 3: LangGraph + MCP Integration

> Week 8 Labs · Day 3 · [← README](README.md) · [LangGraph](../theory/langgraph-orchestration.md) · [MCP](../theory/mcp-tool-integration.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/backend/`

**Estimated cost:** $0.10–0.30 (2–3 agent runs with tools)

**Goal:** LangGraph agent invokes MCP tools and records a trace you can show in interviews.

---

## Task

Create `lab03_mcp_trace.py` that:

1. Compiles your LangGraph from `app/agents/graph.py`
2. Runs query: `"Find two trending AI repos on GitHub this week related to agents"`
3. Writes `artifacts/mcp_tool_trace.json`

### Expected output

```json
{
  "query": "Find two trending AI repos...",
  "tool_calls": [
    {
      "tool": "github_search",
      "input": {"q": "agent topic:ai"},
      "output_preview": "[{name: ...}]",
      "latency_ms": 380,
      "error": null
    }
  ],
  "final_answer_preview": "Two repos stand out...",
  "total_latency_ms": 4100,
  "cost_usd": 0.012
}
```

---

## Acceptance

- [ ] ≥ 1 MCP tool invoked successfully
- [ ] `final_answer_preview` non-empty
- [ ] `tool_calls` includes latency
- [ ] Graph completes without unhandled exception

---

## Next

[Day 4](../daily/day-04.md) → [Lab 4](lab-04-agentic-rag-query.md)
