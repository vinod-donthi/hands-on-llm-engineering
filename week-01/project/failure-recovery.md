# Failure Recovery

> Week 1 Project · [Overview](overview.md) · [API](api.md) · [Lab 5](../labs/lab-05-model-comparison.md)

> **Your code today:** partial failure handled in `lab04_backend/app/services/comparison.py`.  
> **Work path:** `Learning/week-01-work/` or `~/ai-learning/week-01-work/`.

---

## What problem are we solving?

Real systems have slow GPUs, downed Ollama, and models that return garbage JSON. This page describes **what users see** and **what your API returns** — never a full-batch crash because one provider failed.

**Proof:** `test_compare_partial_failure()` in Lab 5.

---

## Provider timeout

| | |
|---|---|
| **Detection** | `asyncio.TimeoutError`; `latency_ms` ≥ threshold; `error: "timeout after 30s"` |
| **Fallback** | Return failed envelope; other models in compare continue |
| **Logging** | `{"request_id", "model_id", "error", "latency_ms"}` |
| **UX** | Amber badge "Timed out"; show sibling model results |

**Example:** Compare GPT + Llama + Mistral; Llama hangs → GPT and Mistral panels still populate.

---

## Malformed JSON

| | |
|---|---|
| **Detection** | Pydantic `ValidationError`; `parse_status: parse_failure` |
| **Fallback** | Run [JSON reliability ladder](../theory/structured-output.md); one retry; else return raw `text` + error fields |
| **Logging** | `json_validation_error` + `request_id` |
| **UX** | Show raw output in collapsible panel; badge "Parse failed" |

---

## Model unavailable

| | |
|---|---|
| **Detection** | HTTP 503, connection refused (Ollama down), `error` populated |
| **Fallback** | Skip model; suggest `ollama serve` or check API key |
| **Logging** | Provider + model_id + HTTP status |
| **UX** | Red error badge per model; "Retry" button on compare |

**Example:** `mistral:7b` not pulled → 404 in envelope, other models unaffected.

---

## Token overflow

| | |
|---|---|
| **Detection** | API 400 context length exceeded; or pre-flight token count > budget |
| **Fallback** | Reject before call with clear message; truncate input per [context-window](../theory/context-window.md) |
| **Logging** | `input_tokens`, `context_limit`, `request_id` |
| **UX** | "Prompt too long — remove N tokens" with estimate |

---

## Budget exceeded

| | |
|---|---|
| **Detection** | Session `total_cost_usd` > user-defined cap (Week 1: manual tracking ok) |
| **Fallback** | Block cloud calls; allow Ollama only |
| **Logging** | Cumulative cost per `parent_request_id` |
| **UX** | Banner: "Cloud budget reached — local models only" |

---

**Principle:** Never fail the entire compare batch for one model failure.

---

## Next

[acceptance-criteria.md](acceptance-criteria.md) · [theory/observability.md](../theory/observability.md)
