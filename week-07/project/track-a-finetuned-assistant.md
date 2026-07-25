# Track A — Fine-Tuned Domain Assistant

> Week 7 Project · [← Overview](overview.md) · [ADR Template](adr-template.md)

**Choose Track A when** Day 1 decision matrix favors fine-tune: stable domain, locked format/tone, high volume, infrequent knowledge changes.

---

## Build scope

1. **Fine-tuned model** from Lab 2 deployed via `OPENAI_FINE_TUNED_MODEL`
2. **Router** — fine-tuned primary; fallback to `gpt-4o-mini` on error or low confidence
3. **Optional RAG** — attach handbook retrieval if decision matrix was hybrid
4. **Distillation route** (Day 3) — optional local 3B for draft step

---

## Router logic

```python
async def complete(request: ChatRequest) -> ChatResponse:
    if settings.use_finetuned and request.task_type in FINETUNE_TASKS:
        try:
            return await finetuned_provider.complete(request)
        except OpenAIError:
            logger.warning("finetune_fallback", exc_info=True)
    return await baseline_provider.complete(request)
```

**Confidence gate (optional):** if classification entropy high, escalate to baseline.

---

## API surface

| Endpoint | Purpose |
|----------|---------|
| `POST /api/v1/chat` | Primary chat — uses fine-tuned model |
| `POST /api/v1/chat/baseline` | A/B compare for demo |
| `GET /api/v1/models` | Lists active + fallback model IDs |

---

## Eval requirements (Day 7)

`capstone_eval_report.json` must show:

- Fine-tuned win rate ≥ Day 1 baseline + 10% **or**
- Documented tradeoff (cost saved at equal quality)

---

## ADR sections to emphasize

- Why knowledge stability justified fine-tune over RAG
- Training set size and hold-out methodology
- Retrain cadence and versioning (`advanced-studio-v1`)

[← Overview](overview.md) · [Backend](backend.md)
