# Day 1 — Decision Framework & Baseline Eval

> **You are here:** Day 1 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Start Here](../START-HERE.md) (setup once) |
| **Today's outcome** | Scored decision matrix; capstone track A or B chosen |
| **Time** | 3–4h (hard cap 5h) |
| **Work dir** | `week-07-work/` or `~/ai-learning/week-07-work/` |
| **Stop when** | `decision_matrix.json` exists + track marked in progress.md |

**Catch-up:** skip to Step 4 (lab) if needed; skim theory Concepts only.

---

## Steps

### Step 1 — Theory: Decision framework (~35 min)

Read [decision-framework.md](../theory/decision-framework.md) — Concepts, worked scenario, checkpoint.

### Step 2 — Pick capstone track (~15 min)

Using the framework, choose **Track A** (fine-tuned assistant) or **Track B** (agentic RAG). Document one sentence why in [progress.md](../progress.md).

### Step 3 — Lab spec (~10 min)

Read [Lab 1](../labs/lab-01-decision-matrix.md).

### Step 4 — Scaffold Advanced AI Studio (~20 min)

```bash
cd ~/ai-learning/week-07-work
source .venv/bin/activate
mkdir -p advanced-ai-studio/backend/app advanced-ai-studio/docs/adr data/golden
```

Copy Week 3 retrieval or Week 4 graph code if available (see [README](../README.md)).

### Step 5 — Code: decision matrix + baseline eval (~90 min)

Run:

```bash
python lab01_decision_matrix.py --use-case support_triage
```

Produces scored options: prompt-only, RAG, fine-tune, bigger model.

### Step 6 — Deliverable

- [ ] `decision_matrix.json` — four options scored on quality, cost, latency, ops burden
- [ ] `baseline_eval.json` — 10 golden Q&A pairs against prompt-only and RAG (if corpus exists)
- [ ] Track A or B checked in `progress.md`

### Step 7 — Close out (~15 min)

- [ ] Self-test checkpoint questions in decision-framework theory
- [ ] Mark Day 1 in [progress.md](../progress.md)

---

## Done when

- [ ] `decision_matrix.json` in work dir
- [ ] Capstone track chosen
- [ ] Day 1 row checked in `progress.md`

---

## Tomorrow

**→ [Day 2 — LoRA / PEFT Fine-Tuning](day-02.md)** — start with [lora-peft-finetuning.md](../theory/lora-peft-finetuning.md)
