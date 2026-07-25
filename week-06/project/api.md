# Eval Pipeline Studio — API

> Week 6 Project · [Backend](backend.md) · [Eval Spec](eval-pipeline-spec.md)

Base URL: `http://localhost:8006/api/v1`

## Endpoints

### POST `/eval/run`

Trigger eval suite (async background task acceptable).

**Request:**

```json
{
  "suite": "fast",
  "golden_path": "eval/golden_dataset.json"
}
```

`suite`: `fast` | `full` | `security` | `agent`

**Response (202):**

```json
{
  "run_id": "eval_20260725_180000",
  "status": "running",
  "suite": "fast"
}
```

### GET `/eval/status/{run_id}`

**Response:**

```json
{
  "run_id": "eval_20260725_180000",
  "status": "completed",
  "suite": "full",
  "layers": {
    "deepeval": {"passed": true, "tests": 5},
    "ragas": {"faithfulness": 0.79, "passed_gate": true},
    "promptfoo": {"pass_rate": 0.9}
  },
  "report_path": "reports/full_eval_report.json"
}
```

### GET `/eval/reports`

List available reports.

**Response:**

```json
{
  "reports": [
    {
      "name": "full_eval_report.json",
      "modified_at": "2026-07-25T18:00:00Z",
      "faithfulness": 0.79,
      "ci_passed": true
    }
  ]
}
```

### GET `/eval/baseline`

**Response:**

```json
{
  "faithfulness": 0.78,
  "pinned_at": "2026-07-25",
  "max_regression_pct": 5.0,
  "floor": 0.741
}
```

### GET `/health`

```json
{"status": "ok", "langfuse": "connected"}
```

## Error responses

```json
{
  "detail": "Eval regression: faithfulness 0.72 < floor 0.741",
  "error_code": "EVAL_REGRESSION"
}
```

HTTP 422 for regression failure on synchronous full run.

## SSE (optional stretch)

`GET /eval/stream/{run_id}` — progress events for dashboard:

```
event: layer_complete
data: {"layer": "deepeval", "passed": true}
```

## Next

→ [eval-pipeline-spec.md](eval-pipeline-spec.md) · [ci-spec.md](ci-spec.md)
