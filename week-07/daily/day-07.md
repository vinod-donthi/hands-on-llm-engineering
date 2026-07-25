# Day 7 — Capstone, ADR & Validation

> **You are here:** Day 7 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 6 — MCP Production](day-06.md) |
| **Today's outcome** | Advanced AI Studio shipped + ADR signed |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-07-work/` or `~/ai-learning/week-07-work/` |
| **Stop when** | All [acceptance criteria](../project/acceptance-criteria.md) checked |

**Catch-up:** minimum viable capstone for your track only; full ADR required.

---

## Steps

### Step 1 — Review track spec (~20 min)

- **Track A:** [track-a-finetuned-assistant.md](../project/track-a-finetuned-assistant.md)
- **Track B:** [track-b-agentic-rag.md](../project/track-b-agentic-rag.md)

### Step 2 — Integration build (~120 min)

Wire capstone path into `advanced-ai-studio/`:

```bash
cd advanced-ai-studio/backend
uvicorn app.main:app --reload --port 8000
```

Track A: route `/chat` to fine-tuned model when confidence high.  
Track B: expose `/agent/query` with agentic RAG graph + MCP tools.

### Step 3 — Write ADR (~45 min)

Copy [adr-template.md](../project/adr-template.md) → `docs/adr/0001-advanced-ai-studio.md`. Fill all sections with your Day 1–6 evidence.

### Step 4 — Final eval (~45 min)

```bash
python capstone_eval.py --track $ADVANCED_STUDIO_TRACK --output capstone_eval_report.json
```

Must show improvement or documented tradeoff vs Day 1 baseline.

### Step 5 — Validation (~30 min)

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 12/15
- [ ] [Interview checkpoint](../checkpoints/progress-tracker.md) self-assessment
- [ ] [Exit criteria](../checkpoints/exit-criteria.md)

### Step 6 — Portfolio (~30 min, optional)

Update [portfolio/week-07-showcase.md](../portfolio/week-07-showcase.md) with ADR excerpt and metrics.

### Step 7 — Close out

- [ ] Mark Day 7 + week complete in [progress.md](../progress.md)

---

## Done when

- [ ] Advanced AI Studio runs end-to-end for chosen track
- [ ] `docs/adr/0001-advanced-ai-studio.md` complete
- [ ] `capstone_eval_report.json` shows baseline comparison
- [ ] Exit criteria checked
- [ ] Week 7 complete in `progress.md`

---

## Next week

**→ [Week 8 — AI Radar Capstone](../../prompt.md)** *(when published)*

Review [Week 7 exit criteria](../checkpoints/exit-criteria.md) before starting Week 8.
