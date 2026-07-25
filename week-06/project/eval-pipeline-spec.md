# Eval Pipeline Spec

> Week 6 Project · [Overview](overview.md) · [CI Spec](ci-spec.md)

Defines report schemas, layer orchestration, and regression rules for **Eval Pipeline Studio**.

## Suite definitions

| Suite | Layers | Max duration | Max cost |
|-------|--------|--------------|----------|
| `fast` | DeepEval (5–10 samples) | 3 min | $0.20 |
| `full` | DeepEval + RAGAS (30+) + Promptfoo + gate | 25 min | $5.00 |
| `security` | Promptfoo red team (12+ plugins) | 30 min | $5.00 |
| `agent` | Trajectory eval (5–10 golden agents) | 10 min | $1.00 |

Short-circuit: if DeepEval fails, do not run RAGAS.

## full_eval_report.json schema

```json
{
  "run_id": "eval_20260725_180000",
  "git_sha": "abc1234",
  "pipeline_version": "hybrid_v1",
  "suite": "full",
  "started_at": "2026-07-25T18:00:00Z",
  "completed_at": "2026-07-25T18:22:00Z",
  "ci_passed": true,
  "layers": {
    "deepeval": {
      "passed": true,
      "tests_run": 5,
      "tests_failed": 0,
      "duration_sec": 98
    },
    "ragas": {
      "num_samples": 32,
      "metrics": {
        "faithfulness": 0.791,
        "context_precision": 0.74,
        "context_recall": 0.71,
        "answer_relevancy": 0.82
      },
      "duration_sec": 840,
      "cost_usd": 1.28
    },
    "promptfoo": {
      "pass_rate": 0.9,
      "successes": 9,
      "failures": 1,
      "duration_sec": 420
    },
    "gate": {
      "baseline_faithfulness": 0.78,
      "floor": 0.741,
      "current": 0.791,
      "passed": true
    }
  },
  "worst_samples": ["g014", "g022"],
  "total_cost_usd": 2.15
}
```

## Regression rules

Primary gate metric: **faithfulness** (RAGAS).

```
floor = baseline_faithfulness × (1 - max_regression_pct / 100)
PASS if current_faithfulness >= floor
FAIL otherwise
```

Default: baseline `0.78`, max regression `5%` → floor `0.741`.

Secondary warnings (log, do not block Week 6):

- Context recall drop > 8%
- Promptfoo pass rate < 85%
- Agent trajectory efficiency fail

## Golden dataset requirements

| Field | Required |
|-------|----------|
| Week 6 minimum samples | 30 |
| Recommended (reuse Week 3) | 50+ |
| Negative cases | ≥3 |
| Source-verified ground truth | 100% |

Version file: `eval/golden_dataset.json` with `"version": "golden_v1"`.

## Trace regression (subset)

On `full` suite, diff traces for 5 baseline IDs:

- `top_chunk_ids` must match OR be in approved baseline update PR
- `duration_ms` must not exceed 2× baseline
- No `forbidden_tools` in agent traces

## Langfuse score attachment

After each `full` run:

```python
langfuse.score(
    trace_id=run_trace_id,
    name="faithfulness",
    value=report["layers"]["ragas"]["metrics"]["faithfulness"],
)
```

## run_full_eval.py CLI

```bash
python scripts/run_full_eval.py \
  --suite full \
  --golden eval/golden_dataset.json \
  --out reports/full_eval_report.json \
  --fail-on-regression
```

Exit code 1 on gate failure (for CI).

## Next

→ [ci-spec.md](ci-spec.md) · [acceptance-criteria.md](acceptance-criteria.md)
