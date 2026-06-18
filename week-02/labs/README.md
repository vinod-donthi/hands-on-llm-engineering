# Week 2 Labs

> [← README](../README.md) · [Project](../project/overview.md)

> **Learning path:** Specs in `Learning/week-02/labs/`  
> **Work dir:** `~/ai-learning/week-02-work/` — all code and deliverables

## Prerequisites

```bash
cd ~/ai-learning/week-02-work
source .venv/bin/activate
ollama pull llama3.1:8b
ollama serve   # separate terminal
```

`.env` must include `OPENAI_API_KEY` and `ANTHROPIC_API_KEY`.

## Lab Index

| Lab | Topic | Required | Deliverable |
|-----|-------|----------|-------------|
| [Lab 1](lab-01-provider-apis.md) | OpenAI + Anthropic + Ollama smoke test | Yes | `provider_smoke_results.json` |
| [Lab 2](lab-02-model-registry.md) | YAML model registry | Yes | `models.yaml`, tests |
| [Lab 3](lab-03-streaming-sse.md) | SSE streaming + TTFT | Yes | `stream_metrics.json` |
| [Lab 4](lab-04-function-calling.md) | Tool router | Yes | `tool_call_trace.json` |
| [Lab 5](lab-05-context-cost.md) | Context trim + cost caps | Yes | `context_budget_demo.json` |
| [Lab 6](lab-06-run-history.md) | Postgres run history | Optional* | Rows in `runs` table |

*Skip Lab 6 if behind — document in [progress.md](../progress.md).

## Cost Notes

| Lab | Est. spend |
|-----|------------|
| Lab 1 | $0.10–0.30 |
| Lab 3–5 | $0.50–1.50 |
| Full week | $3–8 total |

Ollama calls are always $0.
