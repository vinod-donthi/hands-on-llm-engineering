# Agentic RAG Patterns

> Week 8 Theory · Day 4 · [← mcp-tool-integration](mcp-tool-integration.md) · Next: [nextjs-dashboard-patterns](nextjs-dashboard-patterns.md)

**Agentic RAG** means the agent decides **whether**, **when**, and **how** to retrieve — not every query gets the same "embed → top-k → answer" pipeline. That matches real questions like *"what's trending today?"* that need live tools plus corpus context.

---

## What problem are we solving?

Static RAG always retrieves — polluting context with irrelevant chunks. Some queries need GitHub live data first; others need only your ingested corpus. Agentic RAG adds a **plan** and **critique** step.

### Before / after

**Weak (static RAG):**

```
User query → always retrieve top 8 → LLM answer
```

Fails when corpus lacks today's GitHub stars but MCP could fetch them.

**Strong (agentic RAG):**

```
User query → plan → [MCP search if needed] → retrieve → critique ("enough?") → synthesize with citations
```

---

## Concepts

### Decision table

| Query type | Path |
|------------|------|
| "Summarize yesterday's digest items" | RAG only |
| "Breaking: new OpenAI model today?" | MCP search → maybe RAG |
| "Compare LangGraph vs CrewAI in our corpus" | RAG + critique loop |

### Critique loop

Lightweight LLM prompt: *"Given query and 8 chunks, rate sufficient yes/no."*

If no → reformulate query OR call MCP → retrieve again (max 2 extra loops).

### Citations

Every factual sentence maps to `[title](url)` from chunk metadata. No citation → do not state as fact.

**Sample synthesis rule in system prompt:**

```
Use only provided context. After each claim, cite as [Title](url).
If unknown, say "Not in corpus or live search."
```

---

## Tradeoffs

| | Agentic RAG | Static RAG |
|---|-------------|------------|
| Latency | Higher (2–3 LLM calls) | Lower |
| Accuracy on complex queries | Better | Worse |
| Cost | Higher without cache | Predictable |
| Debuggability | Trace per step | Simpler |

---

## Best practices

- Write ADR documenting why you chose agentic over static ([phase-2](../project/phases/phase-2-intelligence.md))
- Expose `mode: rag_only` on API for cheaper eval CI runs
- Log retrieved chunk IDs in `agent_query_trace.json`

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Unbounded retrieve loops | Max 3 iterations |
| Citations missing URLs | Validate in synthesize node |
| Agent ignores corpus | Force RAG node when plan says corpus |

---

## Checkpoint

1. When should MCP run before RAG?
2. What does the critique node output?
3. Why is static RAG insufficient for "trending today"?
4. How do citations appear in the API response?
5. What ADR should you write on Day 4?

---

## Go deeper

| Resource | Why |
|----------|-----|
| [Week 7 agentic RAG](../../week-07/) | Advanced patterns |
| [Lab 4](../labs/lab-04-agentic-rag-query.md) | Query integration |
| [api.md](../project/api.md) | Response schema |

---

## Next

[nextjs-dashboard-patterns.md](nextjs-dashboard-patterns.md) → [Day 5 playbook](../daily/day-05.md)
