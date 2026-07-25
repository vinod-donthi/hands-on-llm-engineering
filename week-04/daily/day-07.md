# Day 7 — Research Agent Studio Capstone

> **You are here:** Day 7 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 6](day-06.md) |
| **Today's outcome** | Full research run with citations, HITL, trace; exit validation |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-04-work/` or `~/ai-learning/week-04-work/` |
| **Stop when** | All [acceptance criteria](../project/acceptance-criteria.md) checked |

**Catch-up:** Run capstone research query + acceptance checklist; skip portfolio unless interviewing.

---

## Steps

### Step 1 — Theory: Observability (~20 min)

Read [agent-observability.md](../theory/agent-observability.md) — trace schema, redaction.

### Step 2 — Project spec review (~15 min)

Read [acceptance-criteria.md](../project/acceptance-criteria.md) and [architecture.md](../project/architecture.md).

### Step 3 — Capstone research run (~2h)

Run the standard benchmark query (see project spec):

```bash
curl -X POST http://localhost:8001/api/v1/research \
  -H "Content-Type: application/json" \
  -d '{"question": "Compare EU AI Act GPAI obligations with our internal AI policy doc. Cite web and doc sources."}'
```

Approve HITL when prompted for risky `fetch_url`. Export:

- [ ] `research_report.json`
- [ ] `research_trace.jsonl`

### Step 4 — Validation (~45 min)

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 12/15
- [ ] [Interview self-assessment](../checkpoints/progress-tracker.md)
- [ ] [Coding assignment](../interview/coding.md) (optional timed)

### Step 5 — Portfolio (optional, ~30 min)

Update [week-04-showcase.md](../portfolio/week-04-showcase.md) and resume bullets.

### Step 6 — Close out (~15 min)

- [ ] All [exit criteria](../checkpoints/exit-criteria.md) checked
- [ ] Mark Day 7 in [progress.md](../progress.md)

---

## Done when

- [ ] `research_report.json` with ≥ 3 citations (mix of web + doc)
- [ ] HITL demonstrated on high-risk tool
- [ ] Checkpoint resume documented
- [ ] Week 4 exit criteria complete

---

## Next week

**→ Week 5 — Production AI Systems** (when exit criteria pass) · [prompt.md](../../prompt.md)
