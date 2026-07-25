# Lab 1: Decision Matrix & Baseline Eval

> Week 7 Labs · [← README](README.md) · [Decision Framework Theory](../theory/decision-framework.md)

> **Learning path:** This file — specs only.  
> **Work dir:** `~/ai-learning/week-07-work/`

## Setup

```bash
cd ~/ai-learning/week-07-work
source .venv/bin/activate
```

**Estimated cost:** $0.20–0.50 (baseline eval calls)

**Goal:** Score four architecture options and establish eval baseline for Week 7 capstone.

---

## Task

Create `lab01_decision_matrix.py` that:

1. Loads a use case definition (`support_triage`, `policy_qa`, or custom)
2. Scores **prompt-only**, **RAG**, **fine-tune**, **bigger model** on weighted dimensions
3. Runs `baseline_eval.json` on 10+ golden Q&A pairs (prompt vs RAG minimum)
4. Writes `decision_matrix.json`

### Expected output: `decision_matrix.json`

```json
{
  "use_case": "support_triage",
  "weights": {"quality": 0.4, "cost": 0.25, "latency": 0.15, "ops": 0.1, "risk": 0.1},
  "options": [
    {
      "name": "prompt_only",
      "scores": {"quality": 3, "cost": 5, "latency": 4, "ops": 5, "risk": 4},
      "weighted_total": 3.85,
      "notes": "Fast to ship; 82% on golden set"
    },
    {
      "name": "rag",
      "weighted_total": 4.05,
      "notes": "88% faithfulness; handbook updates weekly"
    },
    {
      "name": "finetune_lora",
      "weighted_total": 4.20,
      "notes": "Best if volume > 50K/mo and taxonomy stable"
    },
    {
      "name": "bigger_model",
      "weighted_total": 3.95,
      "notes": "96% quality; 6x cost vs mini"
    }
  ],
  "recommended": "finetune_lora",
  "capstone_track": "A",
  "baseline_eval_path": "baseline_eval.json"
}
```

### Expected output: `baseline_eval.json`

```json
{
  "golden_count": 10,
  "prompt_only": {"accuracy": 0.80, "avg_latency_ms": 850, "avg_cost_usd": 0.0004},
  "rag": {"faithfulness": 0.88, "avg_latency_ms": 2100, "avg_cost_usd": 0.0012}
}
```

---

## Implementation hints

### Scoring helper

```python
def weighted_score(scores: dict[str, int], weights: dict[str, float]) -> float:
    return sum(scores[k] * weights[k] for k in weights)
```

### Golden set

Place `data/golden/eval.jsonl` — one JSON object per line:

```json
{"question": "How do I reset MFA?", "expected_contains": ["Settings", "Security"], "category": "faq"}
```

Use LLM-as-judge or `expected_contains` substring match for speed.

---

## Acceptance

- [ ] Four options scored with documented weights
- [ ] `recommended` aligns with highest weighted total (or documented override)
- [ ] `capstone_track` set: `A` for finetune path, `B` for rag/agentic path
- [ ] Baseline eval on ≥10 golden rows

---

## Next

Mark Day 1 done → [Day 2 playbook](../daily/day-02.md) → [Lab 2](lab-02-lora-finetune.md)
