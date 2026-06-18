# Day 7 — Benchmark Capstone & Validation

> **You are here:** Day 7 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 6](day-06.md) |
| **Today's outcome** | Full benchmark report; week exit criteria met |
| **Time** | 4–5h |
| **Work dir** | `week-02-work/` |
| **Stop when** | Quiz done; acceptance criteria checked |

---

## Steps

### Step 1 — Benchmark spec (~30 min)

Read [benchmarking-spec.md](../project/benchmarking-spec.md) and [acceptance-criteria.md](../project/acceptance-criteria.md)

### Step 2 — Run benchmark suite (~90 min)

```bash
cd model-benchmark-studio/backend
python -m scripts.run_benchmark --prompts config/benchmark_prompts.yaml --out ../../benchmark_report.json
python -m scripts.summarize_benchmark ../../benchmark_report.json ../../benchmark_summary.md
```

### Step 3 — Fix gaps (~60 min)

Re-run until ≥ 3 models × 5 prompts with observability on every row.

### Step 4 — Validation (~60 min)

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 12/15
- [ ] [Coding assignment](../interview/coding.md)
- [ ] [Interview self-assessment](../checkpoints/progress-tracker.md)
- [ ] All [acceptance criteria](../project/acceptance-criteria.md)

### Step 5 — Portfolio (optional ~30 min)

[week-02-showcase.md](../portfolio/week-02-showcase.md) · [resume-bullets.md](../portfolio/resume-bullets.md)

### Step 6 — Close out

- [ ] Mark Day 7 and week complete in [progress.md](../progress.md)
- [ ] Week 1 + 2 artifacts ready for GitHub (you commit locally)

---

## Done when

- [ ] `benchmark_report.json` + `benchmark_summary.md`
- [ ] Exit criteria pass
- [ ] Ready for [Week 3](../../prompt.md) (RAG)

---

## Next week

**→ Week 3 — RAG** (curriculum TBD) · Prerequisite: this week's [exit criteria](../checkpoints/exit-criteria.md)
