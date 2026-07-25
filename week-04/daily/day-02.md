# Day 2 — OpenAI Agents SDK & Pydantic AI

> **You are here:** Day 2 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 1](day-01.md) |
| **Today's outcome** | Multi-agent handoff trace; typed citation extractor |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-04-work/` or `~/ai-learning/week-04-work/` |
| **Stop when** | `agents_sdk_handoff.json` exists |

**Catch-up:** Lab 2 + deliverable; skim pydantic-ai Concepts only.

---

## Steps

### Step 1 — Theory: OpenAI Agents SDK (~30 min)

Read [openai-agents-sdk.md](../theory/openai-agents-sdk.md) — handoffs, guardrails, SDK vs LangGraph table.

### Step 2 — Theory: Pydantic AI (~25 min)

Read [pydantic-ai.md](../theory/pydantic-ai.md) — `result_type`, typed tools.

### Step 3 — Lab spec (~10 min)

Read [Lab 2](../labs/lab-02-openai-agents-sdk.md).

### Step 4 — Code: triage handoff (~2h)

Implement Triage → Research → Writer handoff. Enable tracing. Run:

```bash
python lab02_openai_agents_sdk.py
```

### Step 5 — Code: Pydantic AI citation node (~45 min)

Add `citation_extractor.py` — used later in LangGraph `write` node.

### Step 6 — Deliverable

- [ ] `agents_sdk_handoff.json` with handoff events and tool calls
- [ ] Citation extractor returns valid `CitationList` on sample notes

### Step 7 — Close out (~15 min)

- [ ] Mark Day 2 in [progress.md](../progress.md)

---

## Done when

- [ ] `agents_sdk_handoff.json` in work dir
- [ ] Day 2 row checked in `progress.md`

---

## Tomorrow

**→ [Day 3 — MCP Protocol](day-03.md)** — start with [mcp-protocol.md](../theory/mcp-protocol.md)
