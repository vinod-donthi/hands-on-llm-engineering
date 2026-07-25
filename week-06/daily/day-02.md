# Day 2 — RAGAS Deep Dive + DeepEval pytest

> **You are here:** Day 2 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 1](day-01.md) — RAGAS baseline |
| **Today's outcome** | DeepEval pytest suite with pass/fail thresholds |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-06-work/` or `~/ai-learning/week-06-work/` |
| **Stop when** | `pytest tests/test_llm_eval.py` passes |

**Catch-up:** skip to Step 5 (lab) if needed.

---

## Steps

### Step 1 — Theory: RAGAS metrics (~40 min)

Read [ragas-metrics.md](../theory/ragas-metrics.md) — per-metric intuition, when to tune retrieval vs prompt.

### Step 2 — Theory: DeepEval + pytest (~35 min)

Read [deepeval-pytest.md](../theory/deepeval-pytest.md) — GEval, assert thresholds, CI integration pattern.

### Step 3 — Lab spec (~15 min)

Read [Lab 2](../labs/lab-02-deepeval-tests.md).

### Step 4 — Expand golden dataset (~30 min)

Add ≥10 more golden pairs (target 30 by Day 5). Each pair must cite source text — no LLM-generated ground truth.

### Step 5 — Code: DeepEval tests (~120 min)

Create `tests/test_llm_eval.py` with at least:

- Faithfulness threshold test on 5 samples
- Answer relevancy test on 3 samples
- Custom GEval rubric for citation format

```bash
pytest tests/test_llm_eval.py -v
```

### Step 6 — Deliverable

- [ ] `tests/test_llm_eval.py` — ≥3 test cases, all green locally
- [ ] `deepeval_results.json` exported (optional DeepEval report)
- [ ] Compare RAGAS vs DeepEval scores on same 5 samples — note any disagreement

### Step 7 — Close out (~15 min)

- [ ] Mark Day 2 in [progress.md](../progress.md)

---

## Done when

- [ ] `pytest tests/test_llm_eval.py` passes
- [ ] Day 2 row checked in `progress.md`

---

## Tomorrow

**→ [Day 3 — Promptfoo + Layered Pipeline](day-03.md)** — start with [promptfoo-regression.md](../theory/promptfoo-regression.md)
