# Day 3 — Promptfoo Regression + Layered Pipeline

> **You are here:** Day 3 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 2](day-02.md) — DeepEval pytest |
| **Today's outcome** | Promptfoo config + layered eval architecture doc |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-06-work/` or `~/ai-learning/week-06-work/` |
| **Stop when** | `promptfoo_results.json` exists |

**Catch-up:** skip to Step 5 (lab) if needed.

---

## Steps

### Step 1 — Theory: Promptfoo (~40 min)

Read [promptfoo-regression.md](../theory/promptfoo-regression.md) — prompt diff testing, model comparison, assertions.

### Step 2 — Theory: layered eval pipeline (~35 min)

Read [layered-eval-pipeline.md](../theory/layered-eval-pipeline.md) — fast → slow layers, cost/latency tradeoffs.

### Step 3 — Lab spec (~15 min)

Read [Lab 3](../labs/lab-03-promptfoo-regression.md).

### Step 4 — Install Promptfoo (~10 min)

```bash
npm install -g promptfoo@latest
# or: npx promptfoo --version
```

### Step 5 — Code: Promptfoo config (~150 min)

Create `promptfoo/promptfooconfig.yaml` with:

- System prompt variants (v1 baseline, v2 improved)
- ≥10 test cases from golden dataset
- Assertions: contains, llm-rubric, cost/latency limits

```bash
cd promptfoo
promptfoo eval -c promptfooconfig.yaml -o ../reports/promptfoo_results.json
promptfoo view   # optional local UI
```

### Step 6 — Deliverable

- [ ] `promptfoo/promptfooconfig.yaml` committed to work dir
- [ ] `reports/promptfoo_results.json` with pass/fail per case
- [ ] One-page notes: where Promptfoo vs RAGAS vs DeepEval each fit (layer diagram)

### Step 7 — Close out (~15 min)

- [ ] Mark Day 3 in [progress.md](../progress.md)

---

## Done when

- [ ] `promptfoo_results.json` exists with ≥10 cases evaluated
- [ ] Day 3 row checked in `progress.md`

---

## Tomorrow

**→ [Day 4 — LLM-as-Judge + Golden Traces](day-04.md)** — start with [llm-as-judge-calibration.md](../theory/llm-as-judge-calibration.md)
