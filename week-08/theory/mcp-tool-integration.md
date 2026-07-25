# MCP Tool Integration

> Week 8 Theory · Day 3 · [← langgraph-orchestration](langgraph-orchestration.md) · Next: [agentic-rag-patterns](agentic-rag-patterns.md)

The **Model Context Protocol (MCP)** is a standard way for AI applications to expose **tools** (search, databases, APIs) so agents can call them without custom glue code for every provider.

---

## What problem are we solving?

Hard-coding Tavily, GitHub, and RSS as separate Python functions inside every agent node creates spaghetti. MCP wraps each capability as a **tool** with schema — swap providers or add tools without rewriting the graph.

### Worked scenario

LangGraph `tool_router` calls MCP tool `github_search` with `{"q": "topic:agents stars:>100"}`. MCP server returns JSON repo list. Agent never imports PyGithub directly in the graph file — only the MCP adapter changes if you switch to a different GitHub wrapper.

---

## Concepts

### MCP pieces

| Piece | Role |
|-------|------|
| **MCP server** | Exposes tools + resources |
| **MCP client** | LangGraph / agent invokes tools |
| **Tool schema** | Name, description, JSON input schema |

### AI Radar tools (minimum)

| Tool | Input | Output |
|------|-------|--------|
| `web_search` | `{query: string}` | Snippets + URLs |
| `rss_lookup` | `{feed_id: string, limit: int}` | Recent items |
| `github_search` | `{q: string, sort: string}` | Repo metadata |

### Security

- API keys stay in MCP server process env — not in tool arguments logged to traces
- Rate limit per tool — especially search
- Validate tool inputs with Pydantic before external calls

---

## Tradeoffs

| | MCP | Direct SDK in nodes |
|---|-----|---------------------|
| Portability | Standard protocol | Faster initial hack |
| Ops | Extra process optional | Fewer moving parts |
| Interview story | Strong — "production tool boundary" | Weaker |

---

## Best practices

- One tool = one file under `app/mcp/tools/`
- Return structured JSON — agent parses reliably
- Include `latency_ms` in tool trace for observability

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Secrets in tool args | Env vars on server |
| Huge raw HTML in tool output | Truncate + summarize |
| No timeout on search | 10s httpx timeout |

---

## Checkpoint

1. What three MCP tools does AI Radar require?
2. Where do API keys live?
3. Why MCP vs importing SDKs in graph nodes?
4. What gets logged in `mcp_tool_trace.json`?
5. One security risk of tool calling and its mitigation?

---

## Go deeper

| Resource | Why |
|----------|-----|
| [modelcontextprotocol.io](https://modelcontextprotocol.io/) | Spec |
| [Week 4 MCP content](../../week-04/) | Prior week foundation |
| [backend.md](../project/backend.md) | Module layout |

---

## Next

[agentic-rag-patterns.md](agentic-rag-patterns.md) → [Day 4 playbook](../daily/day-04.md)
