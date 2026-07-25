# LangGraph Orchestration

> Week 8 Theory · Day 3 · [← pgvector-redis-caching](pgvector-redis-caching.md) · Next: [mcp-tool-integration](mcp-tool-integration.md)

**LangGraph** models your agent as a **state machine** — nodes are steps, edges are transitions. Unlike a single prompt, you get checkpointing, conditional branching, and visible tool traces for debugging and interviews.

---

## What problem are we solving?

A one-shot "call GPT with tools" loop hides control flow. AI Radar needs: plan → maybe search web → maybe retrieve corpus → critique → synthesize with citations. LangGraph makes that flow explicit and resumable.

### Worked scenario

Query: *"Compare two new agent frameworks from GitHub this week."*

```
Plan → strategy: "both"
ToolRouter → github_search (live stars/README)
AgenticRAG → prior news in corpus
Critique → sufficient: true
Synthesize → answer with 4 citations
```

Total graph time: 5.2s — trace saved to `agent_query_trace.json`.

---

## Concepts

### State

```python
class AgentState(TypedDict):
    query: str
    plan: dict
    messages: list
    retrieved_docs: list
    tool_calls: list
    final_answer: str
```

### Nodes vs edges

| Node | Role |
|------|------|
| `plan` | LLM picks strategy: rag / search / both |
| `tool_router` | Dispatches MCP tools |
| `agentic_rag` | Retrieves from pgvector |
| `critique` | Enough context? |
| `synthesize` | Final markdown + citations |

**Conditional edge:** if `critique.sufficient == False` → back to `tool_router` (max 3 loops).

### Checkpointing

Sqlite saver for dev; Postgres saver for production. After crash, resume from last node — Week 4 pattern.

---

## Tradeoffs

| | LangGraph | Simple ReAct loop |
|---|-----------|-------------------|
| Observability | Node-level traces | One blob |
| Resume | Checkpoints | Restart from scratch |
| Learning curve | Higher | Lower |

---

## Best practices

- Keep nodes single-purpose — easier to test
- Cap iterations — prevent runaway tool spend
- Log `cost_usd` per node for capstone metrics

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Giant monolithic node | Split plan / act / synthesize |
| No max loop count | Hard limit 3 |
| State mutation bugs | Use reducers LangGraph provides |

---

## Checkpoint

1. What is stored in `AgentState` for AI Radar?
2. When does flow return to `tool_router`?
3. Why checkpointing matters for Celery workers?
4. Name two nodes in your graph.
5. How does LangGraph help in a system design interview?

---

## Go deeper

| Resource | Why |
|----------|-----|
| [LangGraph tutorials](https://langchain-ai.github.io/langgraph/tutorials/) | Patterns |
| [phase-2-intelligence.md](../project/phases/phase-2-intelligence.md) | Day 3–4 spec |
| [Lab 3](../labs/lab-03-langgraph-mcp.md) | Integration lab |

---

## Next

[mcp-tool-integration.md](mcp-tool-integration.md) → [Lab 3](../labs/lab-03-langgraph-mcp.md) → [Day 4](../daily/day-04.md)
