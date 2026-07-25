# Day 7 — Capstone Eval & Validation

> **You are here:** Day 7 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 6](day-06.md) |
| **Today's outcome** | 50+ golden pairs, final eval report, week exit criteria |
| **Time** | 4–5h |
| **Work dir** | `week-03-work/` |
| **Stop when** | Quiz done; acceptance criteria checked |

---

## Steps

### Step 1 — Eval spec (~30 min)

Read [eval-spec.md](../project/eval-spec.md) and [acceptance-criteria.md](../project/acceptance-criteria.md).

### Step 2 — Complete golden dataset (~60 min)

Expand to **≥50** pairs in `eval/golden_dataset.json`. Include 5 negative (unanswerable) questions.

### Step 3 — Full RAGAS run (~90 min)

```bash
cd doc-qa-studio/backend
python -m scripts.run_ragas_eval --golden ../../eval/golden_dataset.json --out ../../rag_eval_report.json
```

Target: **faithfulness ≥ 0.75**. If below, apply [failure-mode tuning order](../theory/rag-failure-modes.md) and re-run.

### Step 4 — Fix gaps (~60 min)

Re-run until acceptance criteria pass — hybrid, rerank, citations, eval gate.

### Step 5 — Validation (~60 min)

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 12/15
- [ ] [Coding assignment](../interview/coding.md)
- [ ] [Interview self-assessment](../checkpoints/progress-tracker.md)
- [ ] All [acceptance criteria](../project/acceptance-criteria.md)

### Step 6 — Portfolio (optional ~30 min)

[week-03-showcase.md](../portfolio/week-03-showcase.md) · [resume-bullets.md](../portfolio/resume-bullets.md)

### Step 7 — Close out

- [ ] Mark Day 7 and week complete in [progress.md](../progress.md)
- [ ] Artifacts ready for your portfolio repo (you commit locally)

---

## Done when

- [ ] `rag_eval_report.json` with ≥50 samples, faithfulness ≥ 0.75
- [ ] Exit criteria pass
- [ ] Ready for Week 4 (AI Agents)

---

## Next week

**→ Week 4 — AI Agents** · [prompt.md](../../prompt.md) · Prerequisite: [exit criteria](../checkpoints/exit-criteria.md)
