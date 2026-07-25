# Day 7 — Capstone: Eval Dashboard + Full Validation

> **You are here:** Day 7 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 6](day-06.md) — red team + build |
| **Today's outcome** | Full eval pipeline + dashboard + week validation |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-06-work/` or `~/ai-learning/week-06-work/` |
| **Stop when** | All exit criteria checked |

**Catch-up:** prioritize acceptance criteria over portfolio polish.

---

## Steps

### Step 1 — Review acceptance criteria (~15 min)

Read [acceptance-criteria.md](../project/acceptance-criteria.md) — tick every item honestly.

### Step 2 — Eval pipeline spec (~20 min)

Read [eval-pipeline-spec.md](../project/eval-pipeline-spec.md) and [ci-spec.md](../project/ci-spec.md) — verify your implementation matches.

### Step 3 — Dashboard (~90 min)

Build minimal dashboard in `eval-pipeline-studio/frontend/`:

- Latest eval run metrics (faithfulness, latency p95, cost)
- Trend chart (last 5 runs from `reports/` JSON files)
- Link to Langfuse project

Or use Langfuse built-in dashboard + export summary to `reports/dashboard_snapshot.json`.

### Step 4 — Full pipeline run (~60 min)

```bash
cd ~/ai-learning/week-06-work/eval-pipeline-studio
python scripts/run_full_eval.py --out reports/full_eval_report.json
pytest tests/test_llm_eval.py -v
cd ../promptfoo && promptfoo eval -c promptfooconfig.yaml
```

Simulate regression (break prompt intentionally) — confirm CI gate fails, then revert.

### Step 5 — Validation (~60 min)

- [ ] [Quiz](../checkpoints/quiz.md) — score ≥ 12/15
- [ ] [Coding assignment](../interview/coding.md) — implement eval gate function
- [ ] [Interview self-assessment](../checkpoints/progress-tracker.md)
- [ ] Golden dataset ≥ 30 pairs

### Step 6 — Portfolio (~30 min, optional)

[week-06-showcase.md](../portfolio/week-06-showcase.md) · [resume-bullets.md](../portfolio/resume-bullets.md)

### Step 7 — Close out (~15 min)

- [ ] All [exit criteria](../checkpoints/exit-criteria.md) checked
- [ ] Mark Day 7 in [progress.md](../progress.md)

---

## Done when

- [ ] `reports/full_eval_report.json` with all layers (RAGAS, DeepEval, Promptfoo)
- [ ] CI gate blocks > 5% regression (demonstrated once)
- [ ] Dashboard or Langfuse snapshot shows latency + cost + faithfulness
- [ ] Quiz ≥ 80% · Ready for Week 7

---

## Week complete

Proceed to [Week 7 — Advanced Topics](../../prompt.md) when [exit criteria](../checkpoints/exit-criteria.md) pass.

**Celebrate:** You shipped a production-grade eval pipeline — the skill hiring managers ask about most after "can you build RAG."
