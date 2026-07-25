# Eval Pipeline Studio — Backend

> Week 6 Project · [Architecture](architecture.md) · [API](api.md)

> **Work dir:** `~/ai-learning/week-06-work/eval-pipeline-studio/backend/`

FastAPI backend orchestrating eval layers and exposing run status to the dashboard.

## Services

| Module | Responsibility |
|--------|----------------|
| `eval/runner.py` | Entry point: `run_eval_suite(suite)` |
| `eval/ragas_runner.py` | RAGAS on golden dataset |
| `eval/gate.py` | Compare metrics vs `eval/baseline.json` |
| `eval/trace_diff.py` | Diff current trace vs baseline spans |
| `observability/langfuse_setup.py` | `@observe`, score attachment |

## runner.py (sketch)

```python
from enum import Enum
from app.eval.ragas_runner import run_ragas
from app.eval.gate import check_regression

class EvalSuite(str, Enum):
    fast = "fast"
    full = "full"
    security = "security"

async def run_eval_suite(suite: EvalSuite) -> dict:
    results = {"suite": suite, "layers": {}}

    if suite in (EvalSuite.fast, EvalSuite.full):
        results["layers"]["deepeval"] = await run_deepeval_subprocess()

    if suite == EvalSuite.full:
        ragas = await run_ragas()
        results["layers"]["ragas"] = ragas
        check_regression(ragas["metrics"]["faithfulness"])
        results["layers"]["promptfoo"] = await run_promptfoo()

    return results
```

## gate.py

```python
import json
from pathlib import Path

def load_baseline() -> dict:
    return json.loads(Path("../eval/baseline.json").read_text())

def check_regression(current_faithfulness: float) -> None:
    baseline = load_baseline()
    floor = baseline["faithfulness"] * (1 - baseline["max_regression_pct"] / 100)
    if current_faithfulness < floor:
        raise EvalRegressionError(
            f"Faithfulness {current_faithfulness:.3f} < floor {floor:.3f}"
        )
```

## Target pipeline adapter

Wrap your RAG service with a stable interface:

```python
class EvalTarget(Protocol):
    async def answer(self, question: str) -> EvalResult: ...

class EvalResult(BaseModel):
    answer: str
    contexts: list[str]
    trace_id: str | None = None
```

Implement `DocQATarget` (Week 3) or `HTTPRAGTarget` (Week 5 service URL).

## Tests

```bash
pytest tests/test_gate.py -v          # unit tests — no API cost
pytest tests/test_llm_eval.py -v      # DeepEval — API cost
```

## Environment

Reads from work dir `.env`:

- `OPENAI_API_KEY`, `EVAL_JUDGE_MODEL`
- `LANGFUSE_PUBLIC_KEY`, `LANGFUSE_SECRET_KEY`
- `EVAL_FAITHFULNESS_BASELINE`, `EVAL_REGRESSION_MAX_PCT`

## Next

→ [api.md](api.md) · [eval-pipeline-spec.md](eval-pipeline-spec.md)
