# Lab 5: Context Budget & Cost Guards

> Week 2 Labs · [← README](README.md) · [Context Management](../theory/context-management.md)

> **Work dir:** `~/ai-learning/week-02-work/model-benchmark-studio/backend/`

**Goal:** Middleware trims history; cost cap rejects expensive requests; guardrails block empty prompts.

---

## `app/middleware/context_budget.py`

```python
def trim_messages_to_budget(
    messages: list[dict],
    model_config: ModelConfig,
    max_output_tokens: int,
    counter: TokenCounter,
) -> tuple[list[dict], int]:
    """Tail-keep: drop oldest user/assistant pairs until under budget.
    Returns (trimmed_messages, dropped_count)."""
```

Never drop `system` message.

---

## `app/services/cost_guard.py`

```python
class CostGuard:
    def __init__(self, max_per_request: float, daily_budget: float): ...

    def check_estimate(self, estimated_cost: float) -> None:
        """Raise BudgetExceeded if over cap."""

    def record_actual(self, cost: float) -> None: ...
```

Load limits from `.env`: `MAX_COST_USD_PER_REQUEST`, `DAILY_BUDGET_USD`.

---

## Guardrails: `app/guardrails.py`

| Rule | Action |
|------|--------|
| `prompt.strip() == ""` | HTTP 422 |
| `len(prompt) > 100_000` chars | HTTP 422 |
| Output matches `sk-[a-zA-Z0-9]{20,}` | Redact + log `secret_leak` |

---

## `lab05_context_demo.py`

Build a 50-turn fake history; run trim; output `context_budget_demo.json`:

```json
{
  "original_message_count": 50,
  "trimmed_message_count": 12,
  "dropped_count": 38,
  "estimated_input_tokens": 118000,
  "fits_budget": true
}
```

---

## Tests

- `tests/test_context_budget.py` — trim drops oldest first
- `tests/test_guardrails.py` — empty prompt rejected

---

## Acceptance

- [ ] Trim + guardrail tests pass
- [ ] Every `LLMResponse` includes `cost_usd`
- [ ] Demo JSON saved

---

## Next

[Day 6 playbook](../daily/day-06.md)
