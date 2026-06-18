# Lab 4: Function Calling

> Week 2 Labs · [← README](README.md) · [Function Calling Theory](../theory/function-calling.md)

> **Work dir:** `~/ai-learning/week-02-work/model-benchmark-studio/backend/`

**Estimated cost:** $0.15–0.40

**Goal:** Tool loop with one deterministic tool; trace logged to JSON.

---

## Tool: `calculate`

```python
from pydantic import BaseModel, Field

class CalculateArgs(BaseModel):
    expression: str = Field(description="Math expression e.g. 2+2")

def run_calculate(args: CalculateArgs) -> str:
    # Safe eval: only digits and +-*/().  OR use numexpr.
    ...
```

Register tool schema with OpenAI `tools=` and Anthropic `tools=`.

---

## `app/services/tool_router.py`

```python
async def run_tool_loop(
    provider: BaseLLMProvider,
    model_id: str,
    user_message: str,
    tools: list[ToolDef],
    max_rounds: int = 3,
) -> ToolLoopResult:
    ...
```

Flow: LLM → if `tool_calls` → execute → append result → LLM again → final text.

---

## Endpoint

`POST /api/v1/chat/tools`

```json
{
  "model_id": "gpt-4o-mini",
  "message": "What is 127 * 49? Use the calculator tool."
}
```

---

## Tests: `tests/test_tool_router.py`

- Mock provider returning a tool call → verify execution
- `max_rounds` prevents infinite loop

---

## Deliverable: `tool_call_trace.json`

Run once against live API; save trace with `tool_name`, `arguments`, `result`, `rounds`, `latency_ms`.

---

## Acceptance

- [ ] Successful calculate via tool on OpenAI
- [ ] Anthropic tool path attempted (document if model refuses)
- [ ] Trace JSON saved

---

## Next

[Day 5 playbook](../daily/day-05.md)
