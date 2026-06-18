# Week 2 Portfolio Showcase

> [← README](../README.md) · [Resume Bullets](resume-bullets.md)

## Artifact: Model Benchmark Studio

**One-liner for GitHub README:**

> Multi-provider LLM benchmark tool — OpenAI, Anthropic, and Ollama behind a unified API with SSE streaming, tool calling, cost guards, and Postgres run history.

## What to publish

| Asset | Path |
|-------|------|
| Benchmark report | `benchmark_report.json` (redact prompts if sensitive) |
| Summary | `benchmark_summary.md` |
| Architecture diagram | From [architecture.md](../project/architecture.md) |
| Demo | 30s screen recording: stream + compare + history |

## README sections to include

1. Problem — why multi-model benchmarking matters
2. Architecture (Mermaid)
3. Setup — Docker + API keys
4. Sample benchmark table from `benchmark_summary.md`
5. Cost note — total spend for benchmark run
6. Lessons learned — 3 bullets from your data

## Talking points (interviews)

1. "We normalized three different APIs behind one `LLMResponse` contract."
2. "TTFT data drove our streaming UX decision — local won latency, cloud won JSON."
3. "Cost guards prevented runaway spend during benchmark sweeps."

## Do not publish

- `.env` or API keys
- Full Postgres dumps with user prompts (use previews only)
