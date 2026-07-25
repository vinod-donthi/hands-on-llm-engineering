# Day 5 — Human-in-the-Loop Interrupts

> **You are here:** Day 5 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 4](day-04.md) |
| **Today's outcome** | High-risk tool blocked until CLI approval |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-04-work/` or `~/ai-learning/week-04-work/` |
| **Stop when** | `hitl_approval_trace.json` exists |

**Catch-up:** Lab 5 deliverable; skim HITL risk tiers table.

---

## Steps

### Step 1 — Theory: HITL (~30 min)

Read [human-in-the-loop.md](../theory/human-in-the-loop.md) — interrupts, risk tiers, timeout policy.

### Step 2 — Lab spec (~10 min)

Read [Lab 5](../labs/lab-05-hitl-interrupts.md).

### Step 3 — Code: interrupt gate (~2h)

Gate `fetch_url` (and optionally `send_email` stub) with LangGraph `interrupt()`. CLI prompts Approve/Reject.

```bash
python lab05_hitl_interrupts.py --demo-risky-url
```

### Step 4 — Code: checkpoint during wait (~45 min)

Verify same `thread_id` resumes after simulated process restart.

### Step 5 — Deliverable

- [ ] `hitl_approval_trace.json` — pending, approved, and rejected paths demonstrated
- [ ] Timeout defaults to reject (document in trace)

### Step 6 — Close out (~15 min)

- [ ] Mark Day 5 in [progress.md](../progress.md)

---

## Done when

- [ ] `hitl_approval_trace.json` in work dir
- [ ] Day 5 row checked in `progress.md`

---

## Tomorrow

**→ [Day 6 — Multi-Agent & Checkpointing](day-06.md)** — start with [multi-agent-patterns.md](../theory/multi-agent-patterns.md)
