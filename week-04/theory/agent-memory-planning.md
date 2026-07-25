# Agent Memory & Planning

> Week 4 Theory · Day 4 · [← README](../README.md) · [MCP Protocol](mcp-protocol.md) · [Reflection](reflection-self-correction.md)

**Memory** lets an agent remember prior turns, facts, and research findings. **Planning** breaks a big question into ordered sub-tasks before tool use. Together they stop the model from randomly searching without a map.

---

## Concepts

### What problem are we solving?

**User:** *"Write a competitive analysis: Acme Corp vs our Q3 roadmap doc."*

Without planning, the agent might search "Acme Corp" once and hallucinate the rest. Without memory, it forgets what it already found when the context window fills.

### Worked example: plan → execute → remember

**1. Planning node** (LangGraph `plan`):

```json
{
  "sub_questions": [
    "What products does Acme Corp ship in 2026?",
    "What features are in our Q3 roadmap doc?",
    "Where do roadmap items overlap or gap vs Acme?"
  ],
  "tool_strategy": "web for Acme, doc_search for internal roadmap"
}
```

**2. Short-term memory** — `messages` list in graph state (last N turns + tool results).

**3. Working memory** — structured `findings` list:

```python
findings: list[dict] = [
    {"topic": "Acme products", "source": "https://...", "summary": "..."},
    {"topic": "Q3 roadmap", "source": "doc:roadmap-v3#chunk-12", "summary": "..."},
]
```

**4. Long-term memory (optional)** — vector store or SQLite keyed by `user_id` for facts that survive sessions. *Optional — not required for Week 4 exit criteria.*

Lab 4 persists `reflection_report.json` showing plan vs findings coverage.

### Memory types

| Type | Lifetime | Storage | Example |
|------|----------|---------|---------|
| **Short-term** | Current run | Graph state `messages` | Tool outputs this session |
| **Working** | Current run | Graph state `findings`, `plan` | Structured research notes |
| **Long-term** | Cross-session | Vector DB / KV store | "User prefers APA citations" |

Week 4 capstone requires short-term + working memory. Long-term is stretch.

### Planning patterns

| Pattern | When | Sketch |
|---------|------|--------|
| **Up-front plan** | Complex research | Plan all sub-questions first |
| **Re-plan** | Tool surprise | After failed search, revise plan |
| **HTN-lite** | Multi-source | High-level goal → tool-specific steps |

Research Agent Studio uses **up-front plan + re-plan on reflection** (Day 4 reflection node).

### Context budget interaction

From Week 2: memory competes with tool outputs for tokens.

```
available = context_window - system - plan - findings_summaries - margin
```

**Strategy:** Summarize each tool result into one line in `findings` instead of keeping raw HTML in `messages`.

### Timeline: memory growth (illustrative)

| Round | messages tokens | findings entries |
|-------|-----------------|------------------|
| After plan | 400 | 0 |
| After 2 searches | 2,800 | 2 |
| After summarize step | 1,200 | 2 (summaries only) |
| After doc retrieval | 2,100 | 5 |

**AI engineer takeaway:** Planning reduces wasted tool calls; structured working memory keeps multi-step research coherent without blowing the context window.

---

## Tradeoffs

| Pros | Cons |
|------|------|
| Fewer redundant searches | Planning step adds latency |
| Auditable research trail | Plan can be wrong — need re-plan |
| Easier reflection | Summarization can drop nuance |

---

## Best Practices

- Store **pointers** (URL, doc_id) not full documents in working memory
- Cap `findings` length; merge duplicates by topic
- Include plan in final report appendix for transparency
- Reuse Week 3 chunk IDs in `doc_search` findings

---

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Only chat history, no structured findings | Add `findings` to state |
| Plan never updated | Reflection triggers re-plan |
| Raw 50KB tool dumps in messages | Summarize node after tools |
| Long-term memory for everything | Default to session scope |

---

## Checkpoint

1. Difference between short-term and working memory?
2. What does the planning node output?
3. Why summarize tool results before the next LLM call?
4. How does Week 3 doc retrieval appear in working memory?
5. Is long-term memory required for Week 4 exit?

---

## Go Deeper

| Resource | Why |
|----------|-----|
| [context-management (Week 2)](../week-02/theory/context-management.md) | Token budgets |
| [reflection-self-correction.md](reflection-self-correction.md) | Re-plan trigger |
| [LangGraph memory docs](https://langchain-ai.github.io/langgraph/concepts/memory/) | Framework patterns |

---

## Next

→ [Lab 4](../labs/lab-04-memory-reflection.md) · [reflection-self-correction.md](reflection-self-correction.md)
