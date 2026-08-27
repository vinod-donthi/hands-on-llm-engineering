# Day 6 — Multi-Agent, Checkpointing & Project Wiring

> **You are here:** Day 6 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 5](day-05.md) |
| **Today's outcome** | SQLite checkpoints; project scaffold; optional multi-agent |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-04-work/` or `~/ai-learning/week-04-work/` |
| **Stop when** | Resume-after-crash demo passes; project API boots |

**Catch-up:** Skip Lab 6; do checkpointing + [project/backend.md](../project/backend.md) wiring only.

---

## Steps

### Step 1 — Theory: Multi-agent (~25 min)

Read [multi-agent-patterns.md](../theory/multi-agent-patterns.md) — supervisor vs handoff.

### Step 1b — Optional Go Deeper (~20–30 min)

**Optional — not required for Week 4 exit.** If ahead of schedule:

1. [agent-skills-and-harness.md](../theory/agent-skills-and-harness.md) — skill playbooks + harness map  
2. [a2a-protocol.md](../theory/a2a-protocol.md) — cross-service agents vs in-process multi-agent  

Skip entirely in catch-up mode.

### Step 2 — Theory: Checkpointing (~25 min)

Read [checkpointing-idempotency.md](../theory/checkpointing-idempotency.md) — thread_id, idempotent search cache.

### Step 3 — Lab 6 spec (optional, ~10 min)

Read [Lab 6](../labs/lab-06-multi-agent.md) if time allows.

### Step 4 — Code: checkpoints + idempotency (~1.5h)

Compile graph with `SqliteSaver`. Demo kill-and-resume. Add search cache by query hash.

```bash
python lab06_checkpoint_demo.py
```

### Step 5 — Project wiring (~2h)

Scaffold [Research Agent Studio](../project/overview.md):

```bash
cd research-agent-studio/backend
uvicorn app.main:app --reload --port 8001
```

Wire graph, MCP client, HITL, checkpoints per [backend.md](../project/backend.md).

### Step 6 — Deliverable

- [ ] Crash resume demo documented (screenshot or log snippet)
- [ ] `POST /api/v1/research` returns `thread_id`
- [ ] *(Optional)* `multi_agent_trace.json` from Lab 6

### Step 7 — Close out (~15 min)

- [ ] Mark Day 6 in [progress.md](../progress.md)

---

## Done when

- [ ] Checkpoint resume demonstrated
- [ ] Project API responds on port 8001
- [ ] Day 6 row checked in `progress.md`

---

## Tomorrow

**→ [Day 7 — Research Agent Studio Capstone](day-07.md)** — start with [agent-observability.md](../theory/agent-observability.md)
