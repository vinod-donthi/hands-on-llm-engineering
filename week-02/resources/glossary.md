# Week 2 Glossary

> [← README](../README.md) · [Appendix](../../appendix/README.md)

| Term | Definition |
|------|------------|
| **Anthropic Messages API** | Claude's HTTP API; system prompt is a top-level parameter, not a message role. [Theory →](../theory/anthropic-api.md) |
| **Capability** | Feature flag per model: `chat`, `stream`, `tools`, `json_schema`. Stored in `models.yaml`. |
| **Content block** | Anthropic response unit (`text`, `tool_use`); adapter flattens to string or tool calls. |
| **Cost guard** | Service rejecting requests over per-request or daily USD caps. [Theory →](../theory/cost-optimization.md) |
| **Function calling** | Model emits structured tool invocation; app executes. Same family as **tool use**. [Theory →](../theory/function-calling.md) |
| **Model registry** | YAML file listing models, providers, pricing, context windows. [Lab 2 →](../labs/lab-02-model-registry.md) |
| **Provider adapter** | Class implementing `BaseLLMProvider` for one vendor. |
| **SSE** | Server-Sent Events — HTTP push stream for tokens. [Theory →](../theory/streaming.md) |
| **Tail-keep trim** | Context strategy: drop oldest chat turns, keep system + recent messages. |
| **Tool loop** | Multi-turn cycle: model → tool call → result → model final answer. |
| **TTFT** | Time to first token — primary streaming UX metric. |
| **TPS** | Tokens per second after first token. |
| **YAML registry** | Week 2 config pattern for models — see **Model registry**. |

### Week 1 terms still used

| Term | Link |
|------|------|
| JSON reliability ladder | [Week 1 theory](../../week-01/theory/structured-output.md) |
| Observability envelope | [Week 1 theory](../../week-01/theory/observability.md) |
| parse_status | [Week 1 theory](../../week-01/theory/structured-output.md) |
