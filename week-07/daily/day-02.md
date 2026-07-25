# Day 2 — LoRA / PEFT Fine-Tuning

> **You are here:** Day 2 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 1 — Decision Framework](day-01.md) |
| **Today's outcome** | Fine-tune job submitted or local LoRA run; eval vs baseline |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-07-work/` or `~/ai-learning/week-07-work/` |
| **Stop when** | `finetune_eval_report.json` exists |

**Catch-up:** run OpenAI fine-tune API path only (skip local GPU LoRA).

---

## Steps

### Step 1 — Theory: LoRA / PEFT (~40 min)

Read [lora-peft-finetuning.md](../theory/lora-peft-finetuning.md) — focus on when fine-tune beats RAG.

### Step 2 — Lab spec (~10 min)

Read [Lab 2](../labs/lab-02-lora-finetune.md).

### Step 3 — Prepare training JSONL (~45 min)

Build 50–200 `{messages: [...]}` examples for your domain (support triage, release notes tone, etc.):

```bash
python lab02_prepare_finetune_dataset.py --input data/golden/ --output data/finetune/train.jsonl
```

### Step 4 — Run fine-tune (~60–120 min wall clock)

**Cloud (recommended):**

```bash
python lab02_submit_finetune.py --file data/finetune/train.jsonl
# Poll until complete; set OPENAI_FINE_TUNED_MODEL in .env
```

**Local GPU (optional):** follow Lab 2 Unsloth section.

### Step 5 — Eval vs baseline (~60 min)

```bash
python lab02_eval_finetune.py --golden data/golden/eval.jsonl
```

### Step 6 — Deliverable

- [ ] `data/finetune/train.jsonl` (≥50 examples)
- [ ] Fine-tune job ID or local adapter checkpoint path recorded
- [ ] `finetune_eval_report.json` — win rate vs baseline on golden set

### Step 7 — Close out (~15 min)

- [ ] Checkpoint questions in lora-peft theory
- [ ] Mark Day 2 in [progress.md](../progress.md)

---

## Done when

- [ ] `finetune_eval_report.json` in work dir
- [ ] Day 2 row checked in `progress.md`

---

## Tomorrow

**→ [Day 3 — Distillation & Small Models](day-03.md)** — start with [distillation-small-models.md](../theory/distillation-small-models.md)
