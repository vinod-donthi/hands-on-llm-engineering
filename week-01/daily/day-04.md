# Day 4 — Training, RLHF, Hallucinations, Structured Output

> **You are here:** Day 4 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 3](day-03.md) — sampling + Lab 3 |
| **Today's outcome** | Know when to prompt vs RAG vs fine-tune; mitigate hallucinations; understand structured outputs |
| **Time** | 3–4h (hard cap 5h) |
| **Work dir** | `week-01-work/` |
| **Stop when** | `rlhf_hallucination_summary.md` exists |

**No new lab today** — theory + writing day.

---

## Steps

### Step 1 — Theory: Training lifecycle (~25 min)

Read [training-vs-finetuning.md](../theory/training-vs-finetuning.md)

- Memorize the decision tree: prompt → RAG → LoRA

### Step 2 — Theory: Hallucinations (~20 min)

Read [hallucinations.md](../theory/hallucinations.md)

### Step 3 — Theory: Structured output (~25 min)

Read [structured-output.md](../theory/structured-output.md)

- Focus: JSON reliability ladder (used in Labs 4–5 and project)

### Step 4 — Writing (~60 min)

In work dir, create `rlhf_hallucination_summary.md` (1 page):

- When would you **not** fine-tune?
- Three ways to reduce hallucinations in production
- JSON mode vs structured outputs — one paragraph

### Step 5 — Close out

- [ ] Self-test checkpoint questions in all three theory files
- [ ] Mark Day 4 in [progress.md](../progress.md)

---

## Done when

- [ ] `rlhf_hallucination_summary.md` in work dir
- [ ] Day 4 row checked in `progress.md`

---

## Tomorrow

**→ [Day 5 — Observability + Backend](day-05.md)** — start with [observability.md](../theory/observability.md)
