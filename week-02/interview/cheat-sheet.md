# Week 2 Interview Cheat Sheet

> [← README](../README.md)

## API differences

| | OpenAI | Anthropic |
|---|--------|-----------|
| System | `messages` role | `system` param |
| Stream | `delta.content` | `content_block_delta` |
| Tools | `tool_calls` | `tool_use` blocks |

## Metrics

- **TTFT** — first token latency (UX)
- **TPS** — output_tokens / (total - ttft)
- **cost** — (in/1e6 × $in) + (out/1e6 × $out)

## Tool loop

`user → LLM → tool_call → execute → tool_result → LLM → answer`

## Context

`available = window - max_output - margin` → trim tail → reject

## Guardrails

Input before LLM · Output before user · Rule-based first

## Structured output ladder

1. Provider JSON schema → 2. JSON mode → 3. Pydantic → 4. Prompt retry → 5. Fail with `parse_status`

## Benchmark fairness

Same prompts · Same temp policy · Log all observability fields · Compare parse_success_rate

## Week 2 models

- `gpt-4o-mini` — JSON, tools, stream
- `claude-3-5-haiku-20241022` — long context, tools
- `llama3.1:8b` — local, $0

## Red flags in interviews

- "We just use GPT-4 for everything"
- No cost logging
- Tools executed without validation
- Streaming with only total latency metric
