# Day 5 — Context, Guardrails & Cost

> **You are here:** Day 5 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 4](day-04.md) |
| **Today's outcome** | Context trim + cost caps enforced; guardrails block bad input |
| **Time** | 4h |
| **Work dir** | `week-02-work/` |
| **Stop when** | `context_budget_demo.json` + guardrail tests pass |

---

## Steps

### Step 1 — Theory (~45 min)

Read in order:

1. [context-management.md](../theory/context-management.md)
2. [guardrails.md](../theory/guardrails.md)
3. [cost-optimization.md](../theory/cost-optimization.md)

### Step 2 — Lab spec (~10 min)

Read [Lab 5](../labs/lab-05-context-cost.md)

### Step 3 — ContextBudgetMiddleware (~90 min)

Token count → tail-keep trim → reject if still over budget.

### Step 4 — CostGuard + input guardrails (~60 min)

Wire `MAX_COST_USD_PER_REQUEST` and empty/oversized prompt rejection.

### Step 5 — Tests (~30 min)

```bash
pytest tests/test_context_budget.py tests/test_guardrails.py -v
python lab05_context_demo.py
```

### Step 6 — Deliverable

- [ ] `context_budget_demo.json` showing trim stats
- [ ] Guardrail unit tests pass
- [ ] Cost logged on every `LLMResponse`

### Step 7 — Close out

- [ ] Mark Day 5 in [progress.md](../progress.md)

---

## Done when

- [ ] Demo JSON + tests green
- [ ] Day 5 checked in `progress.md`

---

## Tomorrow

**→ [Day 6 — Postgres & Docker](day-06.md)** — [project/docker.md](../project/docker.md)
