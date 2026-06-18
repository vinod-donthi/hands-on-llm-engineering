# Backend

> Week 2 Project · [Architecture](architecture.md)

## Provider interface

Extend Week 1 `BaseLLMProvider`:

```python
class BaseLLMProvider(ABC):
    provider_id: str

    @abstractmethod
    async def complete(self, request: CompletionRequest, model_id: str) -> LLMResponse: ...

    @abstractmethod
    async def stream(self, request: CompletionRequest, model_id: str) -> AsyncIterator[StreamChunk]: ...

    @abstractmethod
    def supports(self, capability: str, model_id: str) -> bool: ...
```

## Provider factory

```python
def get_provider(provider_id: str) -> BaseLLMProvider:
    return {"openai": OpenAIProvider(), "anthropic": AnthropicProvider(), "ollama": OllamaProvider()}[provider_id]
```

## Services

| Service | Responsibility |
|---------|----------------|
| `registry` | Load `models.yaml` |
| `extraction` | JSON ladder cross-provider |
| `tool_router` | Tool loop, max rounds |
| `cost_guard` | Per-request + daily budget |
| `run_store` | Persist to Postgres |
| `observability` | `request_id`, timing, envelope |

## Required tests

| Test | Validates |
|------|-----------|
| `test_model_registry.py` | YAML load |
| `test_context_budget.py` | Tail-keep trim |
| `test_guardrails.py` | Empty prompt block |
| `test_tool_router.py` | Tool execution |
| `test_compare_partial_failure.py` | Week 1 resiliency (keep) |
| `test_stream_ttft.py` | TTFT recorded |

## Cost helper

```python
def compute_cost(model: ModelConfig, input_tokens: int, output_tokens: int) -> float:
    return (
        input_tokens / 1e6 * model.cost_per_million_input
        + output_tokens / 1e6 * model.cost_per_million_output
    )
```

## Makefile targets

```makefile
run:
\tuvicorn app.main:app --reload --port 8000

test:
\tpytest -v

benchmark:
\tpython -m scripts.run_benchmark --prompts ../config/benchmark_prompts.yaml
```
