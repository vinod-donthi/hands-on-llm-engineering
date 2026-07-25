# Day 6 — Multimodal Preview & MCP Production

> **You are here:** Day 6 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 5 — Long Context vs RAG](day-05.md) |
| **Today's outcome** | Production MCP server with auth + rate limits; optional vision demo |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-07-work/` or `~/ai-learning/week-07-work/` |
| **Stop when** | `mcp_production_checklist.json` passes required checks |

**Catch-up:** Lab 6 auth + rate limit only; skip multimodal demo.

---

## Steps

### Step 1 — Theory: Multimodal preview (~25 min)

Read [multimodal-preview.md](../theory/multimodal-preview.md) — vision + text patterns for Week 8 preview.

### Step 2 — Theory: MCP production (~35 min)

Read [mcp-production-patterns.md](../theory/mcp-production-patterns.md).

### Step 3 — Lab spec (~10 min)

Read [Lab 6](../labs/lab-06-mcp-production.md) *(optional lab — required checks listed in exit criteria)*.

### Step 4 — Harden MCP server (~90 min)

Extend Week 4 MCP server with:

- API key auth on SSE transport
- Per-client rate limiting (Redis or in-memory)
- `/health` + structured logging
- SSRF-safe fetch (carry forward from Week 4)

```bash
python lab06_mcp_production_server.py
python lab06_mcp_production_check.py
```

### Step 5 — Optional vision demo (~30 min)

```bash
python lab06_multimodal_demo.py --image data/sample_diagram.png
```

### Step 6 — Deliverable

- [ ] `mcp_production_checklist.json` — auth, rate limit, health, SSRF tests pass
- [ ] MCP server wired into Advanced AI Studio agent (Track B) or tool router (Track A)

### Step 7 — Close out (~15 min)

- [ ] Mark Day 6 in [progress.md](../progress.md)

---

## Done when

- [ ] `mcp_production_checklist.json` all required checks `pass`
- [ ] Day 6 row checked in `progress.md`

---

## Tomorrow

**→ [Day 7 — Capstone & ADR](day-07.md)** — start with [project/overview.md](../project/overview.md)
