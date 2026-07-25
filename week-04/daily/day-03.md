# Day 3 — MCP Protocol & Custom Server

> **You are here:** Day 3 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 2](day-02.md) |
| **Today's outcome** | MCP research-tools server; LangGraph client calls MCP tools |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-04-work/` or `~/ai-learning/week-04-work/` |
| **Stop when** | `mcp_tool_trace.json` exists |

**Catch-up:** Lab 3 deliverable; skim MCP security table only.

---

## Steps

### Step 1 — Theory: MCP (~35 min)

Read [mcp-protocol.md](../theory/mcp-protocol.md) — servers, tools, security, architecture diagram.

### Step 2 — Lab spec (~10 min)

Read [Lab 3](../labs/lab-03-mcp-server.md) and [project/mcp-server.md](../project/mcp-server.md).

### Step 3 — Code: MCP server (~2h)

Create `research_mcp_server.py` with `web_search` and `fetch_url` (public URLs only in lab).

```bash
python research_mcp_server.py  # stdio server
```

### Step 4 — Code: MCP client in graph (~90 min)

Wire LangGraph tools node to discover and call MCP tools. Run:

```bash
python lab03_mcp_client.py
```

### Step 5 — Deliverable

- [ ] MCP server starts and lists tools
- [ ] `mcp_tool_trace.json` — list_tools + call_tool events

### Step 6 — Close out (~15 min)

- [ ] Mark Day 3 in [progress.md](../progress.md)

---

## Done when

- [ ] `mcp_tool_trace.json` in work dir
- [ ] Day 3 row checked in `progress.md`

---

## Tomorrow

**→ [Day 4 — Memory & Reflection](day-04.md)** — start with [agent-memory-planning.md](../theory/agent-memory-planning.md)
