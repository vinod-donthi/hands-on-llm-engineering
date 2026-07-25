# Day 1 — Why Eval Matters + RAGAS Baseline

> **You are here:** Day 1 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Start Here](../START-HERE.md) (setup once) |
| **Today's outcome** | RAGAS baseline report on golden dataset |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-06-work/` or `~/ai-learning/week-06-work/` |
| **Stop when** | `ragas_baseline_report.json` exists |

**Catch-up:** skip to Step 5 (lab) if needed; skim theory Concepts only.

---

## Steps

### Step 1 — Setup (~25 min)

```bash
cd Learning/week-06
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
cd ~/ai-learning/week-06-work
source .venv/bin/activate
mkdir -p eval tests reports
# Copy Week 3 golden dataset if available:
cp ~/ai-learning/week-03-work/eval/golden_dataset.json eval/ 2>/dev/null || true
```

Add `OPENAI_API_KEY` and Langfuse keys to `.env`.

### Step 2 — Theory: why evaluation matters (~35 min)

Read [why-eval-matters.md](../theory/why-eval-matters.md) — offline vs online eval, production readiness signal, checkpoint.

### Step 3 — Lab spec (~15 min)

Read [Lab 1](../labs/lab-01-ragas-baseline.md).

### Step 4 — Theory skim: RAGAS metrics (~20 min)

Skim [ragas-metrics.md](../theory/ragas-metrics.md) Concepts + metric table (full read tomorrow).

### Step 5 — Code: RAGAS baseline (~150 min)

Implement `lab01_ragas_baseline.py` that runs your RAG pipeline (or stub) against golden dataset:

```bash
python lab01_ragas_baseline.py --golden eval/golden_dataset.json --out reports/ragas_baseline_report.json
```

If no Week 3 dataset yet, create ≥10 pairs today from your docs.

### Step 6 — Deliverable

- [ ] `reports/ragas_baseline_report.json` with faithfulness, context precision/recall, answer relevancy
- [ ] Note baseline faithfulness score — this becomes CI baseline on Day 5
- [ ] Worst 3 samples identified with likely failure layer (retrieval vs generation)

### Step 7 — Close out (~15 min)

- [ ] Self-test checkpoint questions in theory file
- [ ] Mark Day 1 in [progress.md](../progress.md)

---

## Done when

- [ ] `ragas_baseline_report.json` in work dir
- [ ] Day 1 row checked in `progress.md`

---

## Tomorrow

**→ [Day 2 — DeepEval pytest](day-02.md)** — start with [ragas-metrics.md](../theory/ragas-metrics.md)
