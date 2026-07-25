# Week 6 Interview — Coding Exercise

> Week 6 · [Concepts](concepts.md) · Scoring: ≥ 70% to pass exit criteria

## Assignment: Implement eval regression gate

**Time:** 45 minutes  
**Language:** Python 3.11+

### Problem

Given a baseline faithfulness score and a current eval report, determine if CI should pass or fail. Support multiple metrics with primary gate on faithfulness.

### Input

```python
baseline = {
    "faithfulness": 0.78,
    "max_regression_pct": 5.0,
}

current_report = {
    "metrics": {
        "faithfulness": 0.72,
        "context_recall": 0.70,
    }
}
```

### Requirements

1. Compute floor: `baseline_faithfulness * (1 - max_regression_pct / 100)`
2. Return `(passed: bool, details: dict)` with current, baseline, floor
3. If faithfulness below floor → `passed=False`
4. Optional: warn if `context_recall` drops > 8% (don't fail)

### Starter

```python
from dataclasses import dataclass

@dataclass
class GateResult:
    passed: bool
    faithfulness_current: float
    faithfulness_floor: float
    faithfulness_baseline: float
    warnings: list[str]

def check_eval_gate(baseline: dict, current_report: dict) -> GateResult:
    # TODO: implement
    ...
```

### Test cases

```python
def test_gate_pass():
    r = check_eval_gate(
        {"faithfulness": 0.78, "max_regression_pct": 5.0},
        {"metrics": {"faithfulness": 0.79}},
    )
    assert r.passed is True

def test_gate_fail():
    r = check_eval_gate(
        {"faithfulness": 0.78, "max_regression_pct": 5.0},
        {"metrics": {"faithfulness": 0.72}},
    )
    assert r.passed is False
    assert r.faithfulness_floor == pytest.approx(0.741, abs=0.001)

def test_gate_warn_recall():
    r = check_eval_gate(
        {"faithfulness": 0.78, "max_regression_pct": 5.0, "context_recall": 0.75},
        {"metrics": {"faithfulness": 0.80, "context_recall": 0.65}},
    )
    assert r.passed is True
    assert any("context_recall" in w for w in r.warnings)
```

### Solution sketch

```python
def check_eval_gate(baseline: dict, current_report: dict) -> GateResult:
    fb = baseline["faithfulness"]
    floor = fb * (1 - baseline["max_regression_pct"] / 100)
    current = current_report["metrics"]["faithfulness"]
    warnings = []

    if "context_recall" in baseline and "context_recall" in current_report["metrics"]:
        drop = baseline["context_recall"] - current_report["metrics"]["context_recall"]
        if drop > 0.08:
            warnings.append(f"context_recall dropped {drop:.2f}")

    return GateResult(
        passed=current >= floor,
        faithfulness_current=current,
        faithfulness_floor=floor,
        faithfulness_baseline=fb,
        warnings=warnings,
    )
```

### Bonus (+10%)

- Load baseline from JSON file path
- Exit code 1 CLI: `python gate_cli.py --report report.json`
- Format GitHub Actions `::error::` message on failure

### Rubric

| Criteria | Points |
|----------|--------|
| Floor calculation correct | 30 |
| Pass/fail logic | 30 |
| GateResult details | 20 |
| Tests pass | 20 |
| Bonus CLI | +10 |

## Next

→ [Cheat Sheet](cheat-sheet.md) · [Quiz](../checkpoints/quiz.md)
