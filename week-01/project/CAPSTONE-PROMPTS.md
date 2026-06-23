# Capstone Prompts — 5 Benchmark Compares

> Week 1 Project · Day 7 deliverable · [Evaluation rubric](evaluation-rubric.md) · [Build guide](BUILD-GUIDE.md)

Run these **five prompts** through **compare** with at least **GPT-4o Mini** + **Llama 3.1 8B**. Score each model response using the four rubric dimensions (1–5). Export one row per model per prompt to `capstone_comparison.json`.

---

## What problem are we solving?

"Run 5 benchmark prompts" is useless without the actual prompts. This file is the **fixed benchmark suite** for Week 1 — same prompts every learner runs so you can compare models fairly and write a report with numbers.

---

## How to run

**Option 1 — curl (backend only, Path B):**

```bash
cd week-01-work/lab04_backend
source ../.venv/bin/activate
uvicorn app.main:app --reload --port 8000
```

Use the JSON body in each prompt section below with `POST /api/v1/compare`.

**Option 2 — export script (recommended):**

After Day 7 scaffold, run from work dir:

```bash
python prompt-playground-lite/backend/run_capstone_export.py
```

Or adapt `lab04_backend/run_lab05_export.py` to loop all five prompts.

---

## Scoring worksheet (per model, per prompt)

| Dimension | Question you ask |
|-------------|------------------|
| **Correctness** | Is the answer factually right for what was asked? |
| **Format** | Did it follow bullets / JSON / word limit? |
| **Groundedness** | Did it invent facts or say "not sure" when appropriate? |
| **Conciseness** | Tight vs rambling? |

`composite = (correctness + format + groundedness + conciseness) / 4`

---

## Prompt 1 — `capstone_format_bullets`

**Tests:** format compliance, conciseness.

**System:**

```
You answer for engineers. Use exactly 3 bullet points. Max 12 words per bullet.
```

**User:**

```
List three benefits of observability on every LLM API call.
```

**Compare body:**

```json
{
  "model_ids": ["openai/gpt-4o-mini", "ollama/llama3.1:8b"],
  "request": {
    "system_prompt": "You answer for engineers. Use exactly 3 bullet points. Max 12 words per bullet.",
    "prompt": "List three benefits of observability on every LLM API call.",
    "temperature": 0,
    "max_tokens": 256
  },
  "prompt_id": "capstone_format_bullets"
}
```

---

## Prompt 2 — `capstone_grounded_refusal`

**Tests:** groundedness, hallucination resistance ([hallucinations.md](../theory/hallucinations.md)).

**System:**

```
If you lack verified data, say "Not verified — no source." Do not invent statistics.
```

**User:**

```
What was Acme Corp's exact Q3 2024 revenue in USD? Cite the filing if known.
```

**Compare body:**

```json
{
  "model_ids": ["openai/gpt-4o-mini", "ollama/llama3.1:8b"],
  "request": {
    "system_prompt": "If you lack verified data, say \"Not verified — no source.\" Do not invent statistics.",
    "prompt": "What was Acme Corp's exact Q3 2024 revenue in USD? Cite the filing if known.",
    "temperature": 0,
    "max_tokens": 256
  },
  "prompt_id": "capstone_grounded_refusal"
}
```

**Good answer:** refuses or qualifies — does not invent $X billion.

---

## Prompt 3 — `capstone_reasoning_steps`

**Tests:** correctness on multi-step logic (chain-of-thought).

**System:**

```
Show numbered reasoning steps, then one line starting with "Answer:".
```

**User:**

```
A store has 24 widgets. They sell 8, receive 15, then sell half of what's left. How many remain?
```

**Compare body:**

```json
{
  "model_ids": ["openai/gpt-4o-mini", "ollama/llama3.1:8b"],
  "request": {
    "system_prompt": "Show numbered reasoning steps, then one line starting with \"Answer:\".",
    "prompt": "A store has 24 widgets. They sell 8, receive 15, then sell half of what's left. How many remain?",
    "temperature": 0,
    "max_tokens": 400
  },
  "prompt_id": "capstone_reasoning_steps"
}
```

**Expected final answer:** 16 widgets.

---

## Prompt 4 — `capstone_json_extract`

**Tests:** structured output (run on **GPT-4o Mini** via `/api/v1/extract` when implemented; compare text+json mode optional).

**Extract request** (single model, cloud):

```json
{
  "text": "Jane Doe, CTO at Acme AI, joined in March 2022.",
  "schema": {
    "name": "string",
    "role": "string",
    "company": "string",
    "start_year": "integer"
  },
  "model_id": "openai/gpt-4o-mini"
}
```

**Expected `parsed_json`:**

```json
{
  "name": "Jane Doe",
  "role": "CTO",
  "company": "Acme AI",
  "start_year": 2022
}
```

Record `parse_status` and `json_validation_error` in your capstone row.

---

## Prompt 5 — `capstone_compare_latency`

**Tests:** same creative task on cloud vs local — note `latency_ms`, `cost_usd`, `tokens_per_sec` feel ([inference.md](../theory/inference.md)).

**System:**

```
Write one haiku about debugging LLM APIs. No title. Exactly 3 lines.
```

**User:**

```
Write the haiku now.
```

**Compare body:**

```json
{
  "model_ids": ["openai/gpt-4o-mini", "ollama/llama3.1:8b"],
  "request": {
    "system_prompt": "Write one haiku about debugging LLM APIs. No title. Exactly 3 lines.",
    "prompt": "Write the haiku now.",
    "temperature": 0.7,
    "max_tokens": 80
  },
  "prompt_id": "capstone_compare_latency"
}
```

In your report, compare **latency and cost** — not just quality.

---

## Export shape — `capstone_comparison.json`

```json
{
  "generated_at": "2026-06-22T12:00:00Z",
  "prompts_run": 5,
  "rows": [
    {
      "prompt_id": "capstone_format_bullets",
      "request_id": "parent-uuid:openai/gpt-4o-mini",
      "model_id": "openai/gpt-4o-mini",
      "scores": {
        "correctness": 5,
        "format": 5,
        "groundedness": 4,
        "conciseness": 5
      },
      "composite": 4.75,
      "latency_ms": 1200,
      "input_tokens": 42,
      "output_tokens": 38,
      "cost_usd": 0.00002,
      "parse_status": null,
      "error": null,
      "text_preview": "- Faster incident response..."
    }
  ]
}
```

Expect **~8–10 rows** (5 prompts × 2 models; prompt 4 may be extract-only on cloud).

---

## Report outline — `model_comparison_report.md`

Write 1–2 pages in your work dir. Suggested sections:

1. **Setup** — models, machine, Ollama version, date.
2. **Results table** — prompt × model × composite × latency × cost.
3. **Winners** — which model won on format vs reasoning vs speed.
4. **Surprises** — one failure or hallucination you caught via observability fields.
5. **Recommendation** — local dev model vs cloud production (3 sentences minimum).
6. **Deferred** — UI, streaming, etc. (Week 2) if Path B.

---

## Checkpoint

1. How many prompts must you run? (*5*)
2. Which prompt tests refusal / groundedness? (*capstone_grounded_refusal*)
3. What file holds all scored rows? (*capstone_comparison.json*)

---

## Next

[Day 7 playbook](../daily/day-07.md) · [minimum-viable-week1.md](minimum-viable-week1.md)
