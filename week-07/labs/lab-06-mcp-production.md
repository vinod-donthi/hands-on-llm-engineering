# Lab 6: MCP Production Hardening

> Week 7 Labs · **Optional** — skip if behind · [MCP Production Theory](../theory/mcp-production-patterns.md)

> **Work path:** `~/ai-learning/week-07-work/`

**Estimated cost:** $0 (local tests)

**Goal:** Production checklist passes for SSE MCP server with auth and rate limits.

---

## Task

Extend Week 4 MCP server → `lab06_mcp_production_server.py`:

1. SSE transport on `MCP_SERVER_HOST:MCP_SERVER_PORT`
2. `Authorization: Bearer` validation against `MCP_API_KEY`
3. Rate limit: 60 requests/minute per API key
4. `GET /health` returns `{"status":"ok","tools":N}`
5. SSRF-safe `fetch_url` (carry forward Week 4 blocks)

Run automated checks:

```bash
python lab06_mcp_production_server.py &
python lab06_mcp_production_check.py --output mcp_production_checklist.json
```

### Expected output: `mcp_production_checklist.json`

```json
{
  "checks": [
    {"name": "health_endpoint", "status": "pass"},
    {"name": "auth_rejects_missing_key", "status": "pass"},
    {"name": "auth_accepts_valid_key", "status": "pass"},
    {"name": "rate_limit_returns_429", "status": "pass"},
    {"name": "ssrf_blocks_private_ip", "status": "pass"},
    {"name": "response_size_cap", "status": "pass"}
  ],
  "required_pass_count": 5,
  "passed": 6
}
```

Optional multimodal demo:

```bash
python lab06_multimodal_demo.py --image data/sample_diagram.png
```

---

## Acceptance (required subset if skipping optional lab)

Minimum for Week 7 without Lab 6: auth **or** rate limit on any MCP tool path in capstone.

Full Lab 6:

- [ ] All `required` checks `pass`
- [ ] Server integrated into Advanced AI Studio agent

---

## Next

[Day 7](../daily/day-07.md) → [project/overview.md](../project/overview.md)
