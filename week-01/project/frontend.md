# Frontend

> Week 1 Project · [Overview](overview.md) · [API](api.md)

> **Work dir:** All implementation code lives in `~/ai-learning/week-01-work/prompt-playground-lite/`

Single-page Next.js app — no history page in Week 1.

## Components

| Component | Responsibility |
|-----------|----------------|
| `PromptInput.tsx` | System + user prompt, temperature |
| `ModelSelector.tsx` | GPT-4o Mini, Llama 3.1 8B, optional Mistral |
| `ComparisonGrid.tsx` | Side-by-side results (blocking load) |
| `MetricsBar.tsx` | `request_id`, tokens, cost, latency, error badge |
| `ScorePanel.tsx` | 4 evaluation sliders → composite |
| `ExportButton.tsx` | Client-side JSON download |

## Output Mode Toggle

- `text` — standard completion
- `json` — calls `/api/v1/extract` with ladder (cloud only)

Display `parse_status` and `json_validation_error` when present.

## UX for Partial Failure

When one model in compare fails, show other panels normally. Failed panel: red border + `error` message. Do not clear successful results.
