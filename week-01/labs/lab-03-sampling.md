# Lab 3: Sampling Parameters Grid

> Week 1 Labs · [← README](../README.md) · [Project](../project/overview.md)

**Learning path:** `Learning/week-01/labs/lab-03-sampling.md` (this file — instructions only)

**Work path:** `~/ai-learning/week-01-work/` (your `.venv`, scripts, `.env`)

**Setup:**

```bash
cd ~/ai-learning/week-01-work && source .venv/bin/activate
```

First time? Run `./scripts/setup-work.sh` from `Learning/week-01/`. Copy `.env.example` → `.env` and set `OPENAI_API_KEY` (cloud) and/or `OLLAMA_BASE_URL` (local).

**Goal:** Observe how temperature and top-p affect output variance and hallucination tendency.

**File:** `lab03_sampling_grid.py`

**Models:** **GPT-4o Mini** (cloud) or **Ollama Llama 3.1 8B** (free, local).

**Cost notes:**

| Model | Estimated cost | Cap |
|-------|----------------|-----|
| GPT-4o Mini | ~$0.10–0.30 for the full 10-run grid | **Hard cap: 10 runs** — matches the grid below; do not add extra API calls |
| Ollama Llama 3.1 8B | $0 | Unlimited — use for extra repeats after the capped cloud run |

The grid is sized so one GPT-4o Mini pass completes the lab. If you hit the cap mid-grid, finish remaining cells on Ollama and note the provider in your log.

**Fixed prompt (use exactly):**

```
You are a precise assistant. Answer in exactly 3 bullet points.
Question: What were the top 3 AI model releases in January 2025, with release dates and parameter counts?
If uncertain, say "I am not certain."
```

**Grid:** Run the same prompt with:

| Run | temperature | top_p |
|-----|-------------|-------|
| 1–3 | 0.0 | 1.0 |
| 4–6 | 0.7 | 1.0 |
| 7–9 | 1.2 | 1.0 |
| 10 | 0.7 | 0.5 |

**Tasks:**

1. Log each response to `sampling_grid_results.jsonl`.
2. For each run, note: fabricated specifics (Y/N), refusal/uncertainty (Y/N), format compliance (Y/N).
3. Summarize: which setting produced the most hallucinations? The most consistent format?

**Expected Output:** Temperature 0.0 runs produce near-identical formatting; high temperature runs show more varied (and likely more fabricated) specifics.

**Deliverable:** `sampling_analysis.md` (half page).

---
