# Day 4 — LLM-as-Judge Calibration + Trace Regression

> **You are here:** Day 4 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 3](day-03.md) — Promptfoo |
| **Today's outcome** | Calibrated judge + trace regression baseline |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-06-work/` or `~/ai-learning/week-06-work/` |
| **Stop when** | `judge_calibration_report.json` + trace baseline stored |

**Catch-up:** skip to Step 5 (lab) if needed.

---

## Steps

### Step 1 — Theory: LLM-as-judge (~40 min)

Read [llm-as-judge-calibration.md](../theory/llm-as-judge-calibration.md) — pointwise vs pairwise, bias, calibration workflow.

### Step 2 — Theory: golden datasets + trace regression (~35 min)

Read [golden-datasets-trace-regression.md](../theory/golden-datasets-trace-regression.md) — stored traces, span diffing, regression detection.

### Step 3 — Lab spec (~15 min)

Read [Lab 4](../labs/lab-04-llm-judge-calibration.md).

### Step 4 — Human labels (~30 min)

Manually label 15 golden samples: `good` / `bad` / `partial`. Store in `eval/human_labels.json`.

### Step 5 — Code: judge calibration (~120 min)

Implement `lab04_judge_calibration.py`:

- Run pointwise judge on 15 labeled samples
- Compute agreement rate vs human labels
- Tune rubric if agreement < 80%

```bash
python lab04_judge_calibration.py --labels eval/human_labels.json --out reports/judge_calibration_report.json
```

Export 5 golden traces to `eval/traces/baseline/` (JSON span trees from Langfuse export or manual).

### Step 6 — Deliverable

- [ ] `judge_calibration_report.json` — agreement ≥ 75% or documented rubric fix
- [ ] `eval/traces/baseline/` — ≥5 trace snapshots
- [ ] Golden dataset now ≥ 25 pairs

### Step 7 — Close out (~15 min)

- [ ] Mark Day 4 in [progress.md](../progress.md)

---

## Done when

- [ ] Judge calibration report + trace baseline exist
- [ ] Day 4 row checked in `progress.md`

---

## Tomorrow

**→ [Day 5 — CI Gates + Observability](day-05.md)** — start with [ci-cd-eval-gates.md](../theory/ci-cd-eval-gates.md)
