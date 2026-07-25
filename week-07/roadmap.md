# Week 7 Roadmap

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

By end of Week 7 you will:

1. Score prompt vs RAG vs fine-tune vs bigger model for a real use case
2. Run parameter-efficient fine-tuning (LoRA/PEFT) and measure lift vs baseline
3. Deploy or benchmark a distilled/small model against a teacher
4. Integrate **agentic RAG** — agent decides when and how to retrieve
5. Quantify **long context vs RAG** on cost, latency, and quality
6. Harden an **MCP server** for production (auth, rate limits, observability)
7. Ship **Advanced AI Studio** with a documented **ADR**

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

## Model Scope (Week 7)

### Required

| Role | Model | Provider |
|------|-------|----------|
| Baseline / judge | **GPT-4o Mini** | OpenAI API |
| Fine-tune target | **gpt-4o-mini-2024-07-18** (or Azure equivalent) | OpenAI fine-tune API |
| Local small model | **Llama 3.2 3B** or **Phi-3 mini** | Ollama |
| Embeddings (RAG track) | **text-embedding-3-small** | OpenAI |

### Optional

| Model | Use |
|-------|-----|
| GPT-4o | Teacher for distillation comparison |
| Claude 3.5 Sonnet | Second opinion judge |
| GPT-4o with vision | Multimodal preview (Day 6) |

---

## Decision Principles (Week 7)

| Signal | Lean toward | Why |
|--------|-------------|-----|
| Knowledge changes weekly | RAG or agentic RAG | Fine-tune stale quickly |
| Locked tone/format, stable facts | Fine-tune (LoRA) | Cheaper inference at scale |
| One-shot FAQ, small corpus | Prompt + RAG | Simpler ops |
| Multi-hop across docs | Agentic RAG | Iterative retrieval |
| Entire doc fits in context window | Long context (maybe skip RAG) | Measure cost first |
| Need tools + docs | Agentic RAG + MCP | Week 4 patterns extended |

---

## Core Knowledge Objectives

| # | Objective | Theory |
|---|-----------|--------|
| 1 | Fine-tune vs RAG vs prompt vs bigger model | [decision-framework.md](theory/decision-framework.md) |
| 2 | LoRA / PEFT fine-tuning | [lora-peft-finetuning.md](theory/lora-peft-finetuning.md) |
| 3 | Distillation and small-model deployment | [distillation-small-models.md](theory/distillation-small-models.md) |
| 4 | Agentic RAG full integration | [agentic-rag.md](theory/agentic-rag.md) |
| 5 | GraphRAG overview | [graphrag-overview.md](theory/graphrag-overview.md) *(optional)* |
| 6 | Long context vs RAG tradeoffs | [long-context-vs-rag.md](theory/long-context-vs-rag.md) |
| 7 | Multimodal preview | [multimodal-preview.md](theory/multimodal-preview.md) |
| 8 | MCP production patterns | [mcp-production-patterns.md](theory/mcp-production-patterns.md) |

---

## Build Objective

Ship [Advanced AI Studio](project/overview.md) — **Track A** (fine-tuned assistant) **or** **Track B** (agentic RAG module) — with [ADR](project/adr-template.md).

---

## Daily Index

| Day | Focus | Hours (max) |
|-----|-------|-------------|
| [Day 1](daily/day-01.md) | Decision framework + baseline eval | 3–4h |
| [Day 2](daily/day-02.md) | LoRA / PEFT fine-tuning | 4–5h |
| [Day 3](daily/day-03.md) | Distillation + small model deploy | 4h |
| [Day 4](daily/day-04.md) | Agentic RAG integration | 4–5h |
| [Day 5](daily/day-05.md) | Long context vs RAG (+ GraphRAG optional) | 4h |
| [Day 6](daily/day-06.md) | Multimodal preview + MCP production | 4h |
| [Day 7](daily/day-07.md) | Capstone + ADR + validation | 4–5h |

---

## Cost Budget

| Category | Spend |
|----------|-------|
| Fine-tune job (Lab 2 + capstone) | $5–15 |
| Eval / judge calls (Labs 1, 4, 5) | $2–5 |
| Agentic RAG retrieval loops | $1–3 |
| Ollama local | $0 |
| **Total** | **$8–25** |

Fine-tune on the smallest viable dataset (50–200 examples) to stay in budget.
