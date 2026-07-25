# Day 1 — ReAct Loop & LangGraph

> **You are here:** Day 1 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Start Here](../START-HERE.md) (setup once) |
| **Today's outcome** | LangGraph ReAct loop with one tool; trace exported |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-04-work/` or `~/ai-learning/week-04-work/` |
| **Stop when** | `react_trace.json` exists |

**Catch-up:** skip to Step 5 (lab) if needed; skim theory Concepts only.

---

## Steps

### Step 1 — Theory: ReAct & agent vs chain (~30 min)

Read [react-loop-agent-vs-chain.md](../theory/react-loop-agent-vs-chain.md) — Concepts, comparison table, checkpoint.

### Step 2 — Theory: LangGraph (~30 min)

Read [langgraph.md](../theory/langgraph.md) — state, nodes, conditional edges, checkpoint preview.

### Step 3 — Lab spec (~10 min)

Read [Lab 1](../labs/lab-01-react-langgraph.md).

### Step 4 — Scaffold work dir (~20 min)

```bash
cd week-04
./scripts/setup-work.sh
cd ~/ai-learning/week-04-work
source .venv/bin/activate
mkdir -p research-agent-studio/backend/app/graph
```

### Step 5 — Code: minimal ReAct graph (~2h)

Build `plan → research ↔ tools → write` with one tool (`calculate` or `web_search`). Run:

```bash
python lab01_react_langgraph.py
```

### Step 6 — Deliverable

- [ ] `react_trace.json` — each step: `node`, `event`, `latency_ms`, optional `tool`
- [ ] Graph completes a multi-step question without infinite loop

### Step 7 — Close out (~15 min)

- [ ] Self-test checkpoint questions in theory files
- [ ] Mark Day 1 in [progress.md](../progress.md)

---

## Done when

- [ ] `react_trace.json` in work dir
- [ ] Day 1 row checked in `progress.md`

---

## Tomorrow

**→ [Day 2 — OpenAI Agents SDK & Pydantic AI](day-02.md)** — start with [openai-agents-sdk.md](../theory/openai-agents-sdk.md)
