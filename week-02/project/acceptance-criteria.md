# Week 2 Acceptance Criteria

> [← Overview](overview.md) · [Benchmarking Spec](benchmarking-spec.md)

## Providers

- [ ] `OpenAIProvider`, `AnthropicProvider`, `OllamaProvider` implement `complete` + `stream`
- [ ] `GET /api/v1/models` lists YAML registry
- [ ] Unknown `model_id` returns 404 with clear error

## Streaming

- [ ] `POST /api/v1/stream` returns SSE `token` events
- [ ] `done` event includes `ttft_ms` and `cost_usd`
- [ ] UI displays streaming text for ≥ 2 providers

## Tools & extraction

- [ ] `POST /api/v1/chat/tools` completes one tool round-trip on OpenAI
- [ ] `/extract` returns `parse_status` for cloud models
- [ ] `schema_ladder_step` logged on extraction responses

## Context, guardrails, cost

- [ ] Context trim drops oldest messages; never drops system
- [ ] Empty prompt returns 422
- [ ] `MAX_COST_USD_PER_REQUEST` enforced
- [ ] Every response includes `cost_usd`

## Persistence (or documented skip)

- [ ] Postgres `runs` table populated **or** Lab 6 skip noted in progress.md
- [ ] `GET /api/v1/runs` returns recent history

## Docker

- [ ] `docker compose up` starts postgres + backend healthy

## Benchmark capstone

- [ ] `benchmark_report.json` — ≥ 3 models × 5 prompts
- [ ] `benchmark_summary.md` with model recommendations
- [ ] Aggregates include cost and parse success rate

## Tests

- [ ] `pytest` passes (registry, guardrails, context, tool router, partial failure)
- [ ] `Makefile` with `run`, `test`, `benchmark` targets

## Repo hygiene

- [ ] `.gitignore` covers `.env`, `.venv`, `pgdata`
- [ ] README documents setup, cost budget, and model list

**Ship rule:** All required boxes checked before Week 3.
