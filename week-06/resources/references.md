# Week 6 References

> Week 6 · [Glossary](glossary.md) · [Reading List](reading-list.md)

## Official documentation

| Tool | URL | Week 6 use |
|------|-----|------------|
| RAGAS | https://docs.ragas.io/ | RAG metrics baseline |
| DeepEval | https://docs.confident-ai.com/ | pytest CI tests |
| Promptfoo | https://www.promptfoo.dev/docs/ | Regression + red team |
| Langfuse | https://langfuse.com/docs | Traces + scores |
| OpenTelemetry Python | https://opentelemetry.io/docs/languages/python/ | Span export |
| GitHub Actions | https://docs.github.com/en/actions | CI gates |

## GitHub repositories

| Repo | Why |
|------|-----|
| [explodinggradients/ragas](https://github.com/explodinggradients/ragas) | RAGAS source + examples |
| [promptfoo/promptfoo](https://github.com/promptfoo/promptfoo) | Promptfoo CLI |
| [langfuse/langfuse](https://github.com/langfuse/langfuse) | Self-host option |
| [confident-ai/deepeval](https://github.com/confident-ai/deepeval) | DeepEval examples |

## Curriculum cross-links

| Topic | Path |
|-------|------|
| RAGAS intro | [week-03/theory/rag-evaluation-ragas.md](../../week-03/theory/rag-evaluation-ragas.md) |
| Guardrails | [week-02/theory/guardrails.md](../../week-02/theory/guardrails.md) |
| OTel + Langfuse | [week-05/theory/observability.md](../../week-05/theory/observability.md) |
| Master spec | [prompt.md](../../prompt.md) — Week 6 section |

## Report schema quick links

| File | Spec |
|------|------|
| `ragas_baseline_report.json` | [Lab 1](../labs/lab-01-ragas-baseline.md) |
| `full_eval_report.json` | [eval-pipeline-spec.md](../project/eval-pipeline-spec.md) |
| `judge_calibration_report.json` | [Lab 4](../labs/lab-04-llm-judge-calibration.md) |
| `redteam_report.json` | [red-teaming theory](../theory/red-teaming-security-eval.md) |

## Environment variables

See [`.env.example`](../.env.example) for full list.

| Variable | Purpose |
|----------|---------|
| `EVAL_FAITHFULNESS_BASELINE` | Pinned CI baseline |
| `EVAL_REGRESSION_MAX_PCT` | Gate threshold (default 5) |
| `EVAL_JUDGE_MODEL` | Judge LLM for calibration |
| `LANGFUSE_PUBLIC_KEY` / `SECRET_KEY` | Trace export |
