# Week 2 Roadmap

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

By end of Week 2 you will:

1. Integrate OpenAI, Anthropic, and Ollama behind a unified provider interface
2. Route models from a YAML registry with cost and capability metadata
3. Stream tokens via SSE with time-to-first-token (TTFT) telemetry
4. Execute function calling with structured tool schemas
5. Enforce context budgets, guardrails, and per-request cost caps
6. Persist run history in PostgreSQL and boot the stack with Docker Compose
7. Ship **Model Benchmark Studio** — automated multi-model benchmarking tool

---

## Time Budget (Anti-Burnout)

| Constraint | Limit |
|------------|-------|
| Max per day | **5 hours** |
| Max per week | **28 hours** |
| Optional skip | **ONE** lab (recommend Lab 6 if behind) |

### Priority Order (catch-up only)

1. **Today's deliverable** from [daily/](daily/) playbook
2. **Labs / build** steps on that day
3. **Theory** — Concepts + AI engineer takeaway only
4. **Go Deeper** — skip unless interviewing

---

## Model Scope (Week 2)

### Required

| Role | Model | Provider |
|------|-------|----------|
| Cloud (OpenAI) | **GPT-4o Mini** | OpenAI API |
| Cloud (Anthropic) | **Claude 3.5 Haiku** | Anthropic API |
| Local | **Llama 3.1 8B** | Ollama |

### Optional

| Model | Use |
|-------|-----|
| Mistral 7B (Ollama) | Fourth benchmark target |
| GPT-4o | Quality ceiling comparison (1–2 calls) |

> Gemini and Azure OpenAI are **not required** in Week 2. Add as stretch goals via the registry pattern.

---

## Model Selection Principles

| Task Type | Week 2 Pick | Why |
|-----------|-------------|-----|
| **JSON / extraction** | GPT-4o Mini, structured output | Best schema compliance per dollar |
| **Long reasoning** | Claude 3.5 Haiku | Strong reasoning at lower cost than Sonnet |
| **Private / offline** | Llama 3.1 8B | No data leaves machine |
| **Streaming chat UX** | Any cloud with SSE | Measure TTFT — local often wins latency, cloud wins fluency |
| **Tool use** | GPT-4o Mini or Claude Haiku | Native tool APIs; compare reliability in benchmark |
| **High-volume batch** | Local first, cloud for judge | Cost control pattern for Week 6 evals |

---

## Core Knowledge Objectives

| # | Objective | Theory |
|---|-----------|--------|
| 1 | OpenAI Chat Completions API | [openai-api.md](theory/openai-api.md) |
| 2 | Anthropic Messages API | [anthropic-api.md](theory/anthropic-api.md) |
| 3 | Open-source inference (Ollama, vLLM) | [open-source-models.md](theory/open-source-models.md) |
| 4 | Model selection framework | [model-selection.md](theory/model-selection.md) |
| 5 | SSE streaming + TTFT | [streaming.md](theory/streaming.md) |
| 6 | Function calling / tools | [function-calling.md](theory/function-calling.md) |
| 7 | Cross-provider structured outputs | [structured-outputs-engineering.md](theory/structured-outputs-engineering.md) |
| 8 | Context window management | [context-management.md](theory/context-management.md) |
| 9 | Input/output guardrails | [guardrails.md](theory/guardrails.md) |
| 10 | Cost optimization patterns | [cost-optimization.md](theory/cost-optimization.md) |

---

## Build Objective

Evolve Week 1's playground into [Model Benchmark Studio](project/overview.md): YAML registry, three providers, streaming, tools, Postgres history, Docker, and an automated benchmark export.

---

## Daily Index

| Day | Focus | Hours (max) |
|-----|-------|-------------|
| [Day 1](daily/day-01.md) | OpenAI + Anthropic APIs | 3–4h |
| [Day 2](daily/day-02.md) | Open source models, registry, selection | 3–4h |
| [Day 3](daily/day-03.md) | Streaming (SSE) | 4h |
| [Day 4](daily/day-04.md) | Function calling + structured outputs | 4–5h |
| [Day 5](daily/day-05.md) | Context, guardrails, cost | 4h |
| [Day 6](daily/day-06.md) | PostgreSQL + Docker Compose | 4–5h |
| [Day 7](daily/day-07.md) | Benchmark capstone + validation | 4–5h |

---

## Cost Budget

| Category | Spend |
|----------|-------|
| GPT-4o Mini (labs + benchmark) | $1–4 |
| Claude 3.5 Haiku (labs + benchmark) | $1–3 |
| Ollama | $0 |
| Docker / Postgres (local) | $0 |
| **Total** | **$3–8** |
