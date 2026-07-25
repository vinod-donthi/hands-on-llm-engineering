# Week 4 Interview — Coding

> [← README](../README.md)

**Time:** 45 minutes · **Pass:** ≥ 70%

Implement in plain Python (LangGraph pseudocode OK if short on time).

---

## Problem: Tool loop with guardrails

Given a mock LLM that sometimes returns tool calls, implement:

```python
async def run_agent(
    user_message: str,
    tools: dict[str, Callable],
    max_rounds: int = 5,
) -> AgentResult:
    """
    Returns final text, list of tool calls executed, and round count.
    - If LLM returns tool_call, execute and append result to messages.
    - If tool not in allowlist, skip and append error to messages.
    - Stop at max_rounds with partial answer message.
    """
```

### Mock LLM behavior (provided in interview)

```python
class MockLLM:
    def __init__(self, script: list):
        self.script = script  # alternates tool_call and final text

    async def complete(self, messages) -> LLMResponse:
        return self.script.pop(0)
```

### Test cases

1. Happy path: one tool call → final answer  
2. Unknown tool name → error message to LLM, continue  
3. `max_rounds=2` with infinite tool script → stops gracefully  

### Bonus (+15%)

- Add idempotency: same tool+args fingerprint executes once  
- Add `cost_usd` accumulator from token counts  

---

## Problem 2: Reflection router (15 min)

```python
def route_after_reflection(reflection: dict) -> str:
    """
    reflection = {
      "coverage_score": float,
      "should_continue_research": bool,
      "reflection_round": int,
    }
    max_reflection_rounds = 3
    Return "research" | "write"
    """
```

Rules:

- Continue if `should_continue_research` and `reflection_round < max`
- If `coverage_score >= 0.8`, prefer write
- After max rounds, always write

---

## Evaluation rubric

| Criteria | Points |
|----------|--------|
| Correct tool loop | 30 |
| max_rounds respected | 20 |
| Unknown tool handled | 20 |
| Clean types / readable code | 15 |
| Bonus idempotency/cost | 15 |

---

## Practice

Re-implement Week 2 tool loop from memory, then add reflection routing function.
