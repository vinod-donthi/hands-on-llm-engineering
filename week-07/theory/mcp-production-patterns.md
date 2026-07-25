# MCP Production Patterns

> Week 7 Theory · Day 6 · [← README](../README.md) · Prev: [multimodal-preview](multimodal-preview.md) · Next: [Day 7 capstone](../daily/day-07.md)

Week 4 introduced the **Model Context Protocol (MCP)** for local tool servers. Week 7 hardens MCP for **production**: authentication, rate limits, health checks, and safe deployment — the same patterns Week 8 **AI Radar** will use for search, RSS, and GitHub tools.

---

## Concepts

### What problem are we solving?

A stdio MCP server on your laptop is fine for development. In production, tools face **untrusted callers**, **quota abuse**, and **SSRF** risks when fetching URLs. Production MCP wraps the same tool definitions with guards you'd add to any internal API.

### Worked scenario: research tools server

Week 4 `fetch_url` fetches arbitrary URLs. Production additions:

| Control | Implementation | Failure without it |
|---------|----------------|---------------------|
| **API key auth** | `Authorization: Bearer $MCP_API_KEY` on SSE | Anyone on network calls tools |
| **Rate limit** | 60 RPM per key (Redis sliding window) | Tavily budget drained in minutes |
| **SSRF block** | Deny RFC1918, metadata IPs | Server probes internal network |
| **Response cap** | 32 KB max body | Memory blowup on huge HTML |
| **Health endpoint** | `GET /health` → tool count | K8s can't probe readiness |

### Transport modes

| Mode | Dev | Production |
|------|-----|------------|
| **stdio** | LangGraph spawns subprocess | Single tenant, sidecar pattern |
| **SSE / HTTP** | Remote clients | Multi-tenant, load-balanced |

Week 7 Lab 6 implements SSE with auth header; stdio remains for local agent dev.

### Architecture

```mermaid
flowchart TB
    Client[LangGraph Agent] -->|Bearer token| Gateway[MCP SSE Gateway]
    Gateway --> RL[Rate Limiter Redis]
    RL --> Server[MCP Tool Server]
    Server --> Tavily[Tavily API]
    Server --> Fetch[HTTP Fetch SSRF safe]
    Gateway --> Health[/health]
```

### Observability

Log structured events — not full tool payloads:

```json
{
  "event": "mcp_tool_call",
  "tool": "web_search",
  "client_id": "advanced-studio",
  "latency_ms": 342,
  "status": "ok",
  "result_count": 5
}
```

Wire to Langfuse/OpenTelemetry from Week 5.

### AI engineer takeaway

Interview: "MCP is not magic security — treat tool servers like microservices." List auth, rate limits, SSRF, and secrets-in-server-env only.

---

## Tradeoffs

| | stdio MCP | SSE MCP + auth |
|---|-----------|----------------|
| Setup | Trivial | Needs gateway |
| Multi-client | No | Yes |
| Secret exposure | Parent process env | Server-side only |
| K8s friendly | Sidecar | Service + ingress |

---

## Best Practices

1. **Secrets never in tool arguments** — LLM must not pass API keys.
2. **Tool risk tiers** — high-risk (`fetch_url`) requires HITL from Week 4.
3. **Idempotent tools** where possible — safe retries.
4. **Version tools** — `web_search_v2` when schema changes.
5. **Contract tests** — Lab 6 checklist JSON in CI.

---

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Expose SSE without TLS | Terminate TLS at ingress |
| Log full HTML responses | Log hash + length only |
| Same rate limit for all tools | Per-tool quotas |

---

## Checkpoint

1. Why block RFC1918 addresses in `fetch_url`?
2. Name three production controls added in Week 7 vs Week 4.
3. When is stdio MCP still appropriate in production?
4. Where do Tavily API keys live?
5. What does `/health` enable in Kubernetes?

---

## Go Deeper

| Resource | Why |
|----------|-----|
| [MCP specification](https://modelcontextprotocol.io/) | Protocol details |
| [Week 4 MCP theory](../../week-04/theory/mcp-protocol.md) | Foundations |
| [Week 4 project MCP spec](../../week-04/project/mcp-server.md) | Starter server |

---

## Next

**Lab:** [Lab 6 — MCP Production](../labs/lab-06-mcp-production.md) → Day 6 done → [Day 7](../daily/day-07.md) → [project/overview.md](../project/overview.md)
