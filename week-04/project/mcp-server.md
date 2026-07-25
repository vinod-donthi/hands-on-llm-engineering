# Research Agent Studio — MCP Server

> Week 4 Project · [← Overview](overview.md) · [MCP Theory](../theory/mcp-protocol.md)

Standalone **research-tools** MCP server used by Research Agent Studio and Lab 3.

## Tools

| Tool | Input | Output | Risk tier |
|------|-------|--------|-----------|
| `web_search` | `query`, `max_results?` | `[{title, url, snippet}]` | Low |
| `fetch_url` | `url` | `{title, text_excerpt, status_code}` | High (HITL) |
| `cite_source` | `title`, `url`, `snippet` | `{citation_id}` | Low |

## Transport

- **Dev:** stdio (LangGraph spawns process)
- **Optional stretch:** SSE on `MCP_SERVER_HOST:MCP_SERVER_PORT`

## Security rules

1. `fetch_url` blocks private IP ranges and `localhost`
2. Max response size 32 KB — summarize longer pages in server
3. Timeout 15s per HTTP fetch
4. Tavily/API keys only in server process env — not passed to LLM
5. Log tool calls without full response bodies

## File layout

```
research_mcp_server.py
├── create_server() -> Server
├── web_search_handler
├── fetch_url_handler  # SSRF checks
└── main() -> stdio_server
```

## Registration in agent

```python
tools = await mcp_client.list_tools()
llm.bind_tools(mcp_tools_to_openai_schema(tools))
```

## Health check (optional SSE mode)

`GET /health` → `{"tools": 3, "status": "ok"}`

## Testing

```bash
# Manual MCP inspector or lab client
python lab03_mcp_client.py --list-tools
python lab03_mcp_client.py --call web_search '{"query":"EU AI Act"}'
```

Expected: 3 tools listed; internal URL rejected on `fetch_url`.
