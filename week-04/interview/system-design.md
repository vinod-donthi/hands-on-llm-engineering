# Week 4 Interview — System Design

> [← README](../README.md)

## Prompt 1: Autonomous research agent

**Framing:** Legal/compliance team needs research memos from web + internal policy PDFs.

### Requirements to clarify

| Area | Questions |
|------|-----------|
| Sources | Public web only? Internal SharePoint? Both? |
| Freshness | Real-time web vs cached index |
| Approval | Email/export/external fetch? |
| SLA | Minutes vs hours; sync vs async |
| Audit | Full trace retention? |

### High-level architecture

```
API → LangGraph → [plan | research↔tools | reflect | write]
                 → MCP tools (web)
                 → doc_search (vector index)
                 → Checkpointer (Postgres prod)
                 → HITL queue
                 → Trace store (JSONL / Langfuse)
```

### Deep dives interviewers ask

**Tool routing:** LLM picks tools; cap rounds; reflection for quality.

**HITL:** Interrupt before `fetch_url` internal, `send_email`. API approve/resume with same thread_id.

**Failure modes:**

| Failure | Mitigation |
|---------|------------|
| Infinite tool loop | max_rounds + cost cap |
| Stale/wrong citations | Reflection + require URL in findings |
| SSRF via fetch_url | Block private IPs + HITL |
| Crash mid-run | Checkpoints |
| Duplicate Tavily charges | Idempotent search cache |

**Scaling:** Async job queue for long research; poll `GET /research/{id}`; horizontal API replicas; shared Postgres checkpointer.

**Cost:** GPT-4o Mini for loops; summarize tool outputs; cache searches.

---

## Prompt 2: Multi-agent vs single agent

Start single agent with good tools. Split to supervisor when:

- Tool count > 8 reliably confuses model
- Different compliance rules per domain (web vs internal docs)

Shared `findings` store avoids duplicated searches.

---

## Prompt 3: MCP in enterprise

- One MCP server per domain (research, CRM)
- mTLS on SSE transport
- Central allowlist of server binaries
- Same HITL policy for MCP and native tools

---

## Red flags

- "Let the model browse freely"
- No checkpoint on 10+ step runs
- Tools execute without schema validation
- No cost attribution per research job
