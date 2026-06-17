# Day 1 — AI Hierarchy, Transformers, Tokenization

> **You are here:** Day 1 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Start Here](../START-HERE.md) (setup once) |
| **Today's outcome** | Understand where LLMs sit in the AI stack; count tokens and estimate cost |
| **Time** | 3–4h (hard cap 5h) |
| **Work dir** | `week-01-work/` in this repo (or `~/ai-learning/week-01-work/`) |
| **Stop when** | `token_cost_report.csv` exists in work dir |

**Normal order:** follow steps below top to bottom. **Catch-up:** skip to Step 6 (lab) if needed; skim theory Concepts only.

---

## Steps

### Step 1 — Theory: AI hierarchy (~20 min)

Read [ai-vs-ml.md](../theory/ai-vs-ml.md)

- Focus: **Concepts**, **Checkpoint**, optional appendix links only if curious
- Skip: Go Deeper unless you have extra time

### Step 2 — Theory: Transformers (~20 min)

Read [transformers.md](../theory/transformers.md)

- Focus: Concepts + architecture diagram
- This is the most important building block of the week

### Step 3 — Theory: Tokenization (~15 min)

Read [tokenization.md](../theory/tokenization.md)

- Focus: why tokens matter for **billing** and **context limits**

### Step 4 — Lab spec (~5 min)

Read [Lab 1](../labs/lab-01-tokenization.md) — instructions only (learning path).

### Step 5 — Code in work dir (~60 min)

```bash
cd week-01-work    # or ~/ai-learning/week-01-work
source .venv/bin/activate
# Create/edit lab01_tokenization.py per lab spec
python lab01_tokenization.py
```

### Step 6 — Deliverable

Confirm in work dir:

- [ ] `token_cost_report.csv`
- [ ] `token_cost_observations.md` (3-sentence note — lab bonus)

### Step 7 — Close out (~15 min)

- [ ] Answer Day 1 checkpoint questions in theory files (self-test, no submission)
- [ ] Mark Day 1 done in [progress.md](../progress.md)

---

## Done when

- [ ] `token_cost_report.csv` in work dir
- [ ] Day 1 row checked in `progress.md`

---

## Tomorrow

**→ [Day 2 — Attention and Embeddings](day-02.md)** — start with [attention.md](../theory/attention.md)
