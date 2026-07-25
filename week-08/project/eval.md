# AI Radar — Evaluation Pipeline

> Week 8 Capstone · [Testing strategy](testing-strategy.md) · [Theory: eval-ci-gates](../theory/eval-ci-gates.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/backend/`

RAGAS measures whether your agentic RAG answers are **faithful** to retrieved context, **precise** in retrieval, and **relevant** to the question. The CI gate blocks merges when scores drop more than 5% vs baseline.

---

## Golden dataset

File: `config/eval_golden.yaml`

```yaml
samples:
  - question: "What LLM releases were announced in the last 7 days?"
    ground_truth: "Answer must cite at least one model release from ingested corpus."
    category: model
  - question: "Summarize trending AI agent frameworks on GitHub."
    ground_truth: "Must mention at least two repos with URLs."
    category: github
  # ... minimum 10 samples for capstone
```

Generate ground truth from your actual corpus weekly — stale golden sets cause false CI failures.

---

## RAGAS metrics

| Metric | What it checks | Minimum (`.env`) |
|--------|----------------|-------------------|
| **Faithfulness** | Answer claims supported by context | `RAGAS_FAITHFULNESS_MIN=0.75` |
| **Context precision** | Retrieved chunks relevant to question | `RAGAS_CONTEXT_PRECISION_MIN=0.70` |
| **Answer relevance** | Answer addresses the question | `0.70` (recommended) |

---

## Local run

```bash
cd ~/ai-learning/week-08-work/ai-radar/backend
source ../.venv/bin/activate
python -m app.eval.run_ragas --output ../artifacts/rag_eval_report.json
```

**Expected output shape:**

```json
{
  "run_id": "eval_20260725",
  "samples": 10,
  "metrics": {
    "faithfulness": 0.82,
    "context_precision": 0.76,
    "answer_relevance": 0.79
  },
  "passed": true,
  "failures": []
}
```

---

## CI gate (GitHub Actions)

File: `.github/workflows/eval-gate.yml`

```yaml
name: RAG Eval Gate
on: [pull_request]
jobs:
  ragas:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: pgvector/pgvector:pg16
        env:
          POSTGRES_USER: radar
          POSTGRES_PASSWORD: radar
          POSTGRES_DB: ai_radar
        ports: ["5432:5432"]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: "3.12" }
      - run: pip install -r backend/requirements.txt
      - run: alembic upgrade head
        working-directory: backend
      - run: python -m app.eval.run_ragas --compare-baseline
        env:
          OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
          DATABASE_URL: postgresql+asyncpg://radar:radar@localhost:5432/ai_radar
```

`--compare-baseline` fails if any metric drops > `EVAL_REGRESSION_MAX_PCT` (default 5) vs committed `artifacts/rag_eval_baseline.json`.

---

## Baseline workflow

1. On first green eval on `main`, commit `artifacts/rag_eval_baseline.json`
2. PRs compare against baseline
3. Intentional improvements: update baseline in same PR with note in README

---

## Cost note

10 golden questions × agent path ≈ **$0.50–1.50** per CI run. Use `mode: rag_only` in CI for cheaper gate; full agentic eval nightly (optional).

---

## Optional — DeepEval + Langfuse

**Optional — not required for Week 8:**

- DeepEval pytest wrappers for unit-style LLM tests
- Langfuse trace export for agent trajectories

Week 6 patterns apply if you want extra depth.

---

## Next

[Testing strategy](testing-strategy.md) · [Lab 7](../labs/lab-07-eval-ci-gate.md)
