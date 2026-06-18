# Day 4 — Function Calling & Structured Outputs

> **You are here:** Day 4 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 3](day-03.md) |
| **Today's outcome** | Tool loop executes; cross-provider extraction ladder updated |
| **Time** | 4–5h |
| **Work dir** | `week-02-work/` |
| **Stop when** | `tool_call_trace.json` exists |

---

## Steps

### Step 1 — Theory: Function calling (~25 min)

Read [function-calling.md](../theory/function-calling.md)

### Step 2 — Theory: Structured outputs (~25 min)

Read [structured-outputs-engineering.md](../theory/structured-outputs-engineering.md)

### Step 3 — Lab spec (~10 min)

Read [Lab 4](../labs/lab-04-function-calling.md)

### Step 4 — Tool router service (~2h)

Implement `ToolRouter` + one tool (`calculate` or `get_current_time`). Add `POST /api/v1/chat/tools`.

### Step 5 — Extend extraction service (~60 min)

Add Anthropic + Ollama branches to JSON ladder; record `schema_ladder_step`.

### Step 6 — Deliverable

- [ ] `tool_call_trace.json` from a successful tool round-trip
- [ ] `test_tool_router.py` passes
- [ ] Extraction returns `parse_status` for GPT-4o Mini + Haiku

### Step 7 — Close out

- [ ] Mark Day 4 in [progress.md](../progress.md)

---

## Done when

- [ ] Tool trace JSON saved
- [ ] Tool tests green
- [ ] Day 4 checked in `progress.md`

---

## Tomorrow

**→ [Day 5 — Context, Guardrails, Cost](day-05.md)** — [context-management.md](../theory/context-management.md)
