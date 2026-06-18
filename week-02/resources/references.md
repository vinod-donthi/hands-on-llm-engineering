# Week 2 References

> [← README](../README.md)

## Provider docs

| Link | Topic |
|------|-------|
| https://platform.openai.com/docs/api-reference/chat | OpenAI Chat Completions |
| https://platform.openai.com/docs/guides/function-calling | OpenAI tools |
| https://platform.openai.com/docs/guides/structured-outputs | Structured JSON schema |
| https://docs.anthropic.com/en/api/messages | Anthropic Messages |
| https://docs.anthropic.com/en/docs/build-with-claude/tool-use | Claude tools |
| https://github.com/ollama/ollama/blob/main/docs/api.md | Ollama HTTP API |

## Libraries (Week 2 stack)

| Package | Use |
|---------|-----|
| `openai` | OpenAI SDK |
| `anthropic` | Anthropic SDK |
| `sse-starlette` | SSE in FastAPI |
| `pyyaml` | Model registry |
| `sqlalchemy` + `asyncpg` | Postgres runs |
| `tiktoken` | Token counting |

## Pricing (verify before benchmark)

| Link | Provider |
|------|----------|
| https://openai.com/api/pricing/ | OpenAI |
| https://www.anthropic.com/pricing | Anthropic |

## Internal cross-links

| Topic | Path |
|-------|------|
| Week 1 JSON ladder | [structured-output.md](../../week-01/theory/structured-output.md) |
| Week 1 observability | [observability.md](../../week-01/theory/observability.md) |
| Benchmark spec | [benchmarking-spec.md](../project/benchmarking-spec.md) |
