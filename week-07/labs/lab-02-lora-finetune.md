# Lab 2: LoRA / PEFT Fine-Tune

> Week 7 Labs · [← README](README.md) · [LoRA Theory](../theory/lora-peft-finetuning.md)

> **Learning path:** This file — specs only.  
> **Work dir:** `~/ai-learning/week-07-work/`

## Setup

```bash
cd ~/ai-learning/week-07-work
source .venv/bin/activate
export OPENAI_API_KEY=sk-...
```

**Estimated cost:** $5–15 (OpenAI fine-tune job on 50–200 examples)

**Goal:** Submit a fine-tune job, deploy model ID, beat prompt baseline on golden set.

---

## Task

### Part A — Dataset (`lab02_prepare_finetune_dataset.py`)

Convert golden examples to OpenAI JSONL:

```bash
python lab02_prepare_finetune_dataset.py \
  --input data/golden/train_source.jsonl \
  --output data/finetune/train.jsonl \
  --system "You are Acme Corp support. Classify and draft replies."
```

Minimum **50 rows**. Hold out `data/golden/eval.jsonl` for eval only.

### Part B — Submit job (`lab02_submit_finetune.py`)

```bash
python lab02_submit_finetune.py \
  --file data/finetune/train.jsonl \
  --suffix advanced-studio-v1 \
  --poll
```

On success, set in `.env`:

```
OPENAI_FINE_TUNED_MODEL=ft:gpt-4o-mini-2024-07-18:org:advanced-studio-v1:xxxxx
```

### Part C — Eval (`lab02_eval_finetune.py`)

```bash
python lab02_eval_finetune.py \
  --baseline gpt-4o-mini \
  --finetuned $OPENAI_FINE_TUNED_MODEL \
  --golden data/golden/eval.jsonl \
  --output finetune_eval_report.json
```

### Expected output: `finetune_eval_report.json`

```json
{
  "baseline_model": "gpt-4o-mini",
  "finetuned_model": "ft:gpt-4o-mini-...",
  "eval_count": 20,
  "baseline_win_rate": 0.35,
  "finetune_win_rate": 0.65,
  "finetune_avg_latency_ms": 920,
  "recommendation": "Deploy fine-tuned for production triage route"
}
```

---

## Optional: Local GPU LoRA (Unsloth)

**Optional — not required for exit criteria.**

```bash
pip install unsloth  # CUDA required
python lab02_local_lora.py --base unsloth/Llama-3.2-3B-Instruct --epochs 1
```

Produces adapter in `checkpoints/lora-advanced-studio/`.

---

## Acceptance

- [ ] `train.jsonl` ≥50 valid message rows
- [ ] Fine-tune job completed or local adapter saved
- [ ] `finetune_eval_report.json` shows comparison vs baseline
- [ ] Fine-tuned model wins on ≥55% of eval pairs OR documented why not

---

## Next

[Day 3](../daily/day-03.md) → [Lab 3](lab-03-distillation-deploy.md)
