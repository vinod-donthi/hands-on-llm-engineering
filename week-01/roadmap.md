# Week 1 Roadmap

> [← README](README.md) · [Progress Tracker](progress.md)

## Learning Path

**Default:** Follow [daily/day-XX.md](daily/) numbered steps in order (theory → lab → deliverable).

**Catch-up** (behind schedule): On each daily page, do lab/build steps + deliverables only; skim theory Concepts + takeaway.

```
Daily playbook (driver) → theory (linked steps) → lab/build → deliverable → progress.md → Tomorrow link
```

**Rule:** Good enough to continue > perfect completion.

---

## Weekly Outcomes

By end of Week 1 you will:

1. Explain transformers, attention, tokens, inference, and the training lifecycle
2. Run 6 hands-on labs (5 required + 1 optional skippable)
3. Ship **Prompt Playground Lite** — multi-model compare with observability and eval scores
4. Pass exit criteria in [checkpoints/exit-criteria.md](checkpoints/exit-criteria.md)

---

## Time Budget (Anti-Burnout)

| Constraint | Limit |
|------------|-------|
| Max per day | **5 hours** |
| Max per week | **25 hours** |
| Optional skip | **ONE** lab (recommend skipping Lab 2 or Lab 6 if behind) |

### Priority Order (catch-up only — when behind)

1. **Today's deliverable** from [daily/](daily/) playbook
2. **Labs / build** steps on that day
3. **Theory** — Concepts + AI engineer takeaway only
4. **Go Deeper / appendix** — skip unless interviewing

Normal days: follow the daily playbook in order (theory before lab is fine at 3–4h/day).

---

## Model Scope (Week 1)

### Required

| Role | Model | Provider |
|------|-------|----------|
| Cloud | **GPT-4o Mini** | OpenAI API or OpenRouter |
| Local | **Llama 3.1 8B** | Ollama |

### Optional

| Model | Use |
|-------|-----|
| Mistral 7B (Ollama) | Second local comparison in benchmarks |

> Claude, Gemini, and larger models are **not required** in Week 1. Add in Week 2 when building the full abstraction layer.

---

## Model Selection Principles

Choose models by **task type**, not hype.

| Task Type | Recommended (Week 1) | Why |
|-----------|---------------------|-----|
| **Extraction / JSON** | GPT-4o Mini, temp=0, structured output ladder | Schema compliance matters more than creativity |
| **Chat** | Llama 3.1 8B local for dev; GPT-4o Mini for quality check | Balance cost vs. fluency |
| **Code** | GPT-4o Mini or Llama 3.1 8B | Compare both; note format compliance |
| **Evaluation / judging** | GPT-4o Mini (cloud) | Consistent rubric scoring; local for cost-free drafts |
| **Agent workflows (preview)** | GPT-4o Mini for reasoning steps; local for tool-free dry runs | Agents amplify cost — start small (Week 4) |

### Decision Factors

| Factor | Question to Ask |
|--------|-----------------|
| **Cost** | What is $/1M tokens × expected volume? |
| **Latency** | Is TTFT acceptable for UX? (see [theory/inference.md](theory/inference.md)) |
| **Quality** | Does the task need reasoning depth or just format compliance? |
| **Privacy** | Can data leave the machine? → Ollama |
| **Reliability** | Is structured output required? → cloud + structured output API |

---

## Core Knowledge Objectives

| # | Objective | Theory |
|---|-----------|--------|
| 1 | AI vs ML vs DL vs GenAI | [ai-vs-ml.md](theory/ai-vs-ml.md) |
| 2 | Transformers | [transformers.md](theory/transformers.md) |
| 3 | Attention | [attention.md](theory/attention.md) |
| 4 | Embeddings | [embeddings.md](theory/embeddings.md) |
| 5 | Tokenization + cost | [tokenization.md](theory/tokenization.md) |
| 6 | Context window | [context-window.md](theory/context-window.md) |
| 7 | Inference | [inference.md](theory/inference.md) |
| 8 | Training lifecycle | [training-vs-finetuning.md](theory/training-vs-finetuning.md) |
| 9 | Prompt engineering | [prompt-engineering.md](theory/prompt-engineering.md) |
| 10 | Temperature / top-p | [temperature-top-p.md](theory/temperature-top-p.md) |
| 11 | Hallucinations | [hallucinations.md](theory/hallucinations.md) |
| 12 | Structured output | [structured-output.md](theory/structured-output.md) |
| 13 | Observability | [observability.md](theory/observability.md) |
| 14 | RSS / ingestion preview | [rss-ingestion-primer.md](theory/rss-ingestion-primer.md) |

---

## Build Objective

Ship [Prompt Playground Lite](project/overview.md): compare GPT-4o Mini + Llama 3.1 8B (and optionally Mistral), with observability envelope, JSON extraction ladder, and evaluation scores.

---

## Daily Index

| Day | Focus | Hours (max) |
|-----|-------|-------------|
| [Day 1](daily/day-01.md) | AI hierarchy, transformers, tokenization | 3–4h |
| [Day 2](daily/day-02.md) | Attention, embeddings | 3–4h |
| [Day 3](daily/day-03.md) | Context, inference, sampling | 3–4h |
| [Day 4](daily/day-04.md) | Training, RLHF, hallucinations, structured output | 3–4h |
| [Day 5](daily/day-05.md) | Observability + backend | 4–5h |
| [Day 6](daily/day-06.md) | Compare, benchmark, RSS | 4–5h |
| [Day 7](daily/day-07.md) | Playground Lite + capstone | 4–5h |

---

## Cost Budget

| Category | Spend |
|----------|-------|
| GPT-4o Mini (labs + capstone) | $1–3 |
| Ollama | $0 |
| **Total** | **$1–4** |
