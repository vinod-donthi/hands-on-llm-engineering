# Week 7 Interview — Coding

> [← README](../README.md) · [Concepts](concepts.md)

## Exercise 1: Weighted decision score

Implement `recommend_option(options, weights) -> str` using Lab 1 schema.

```python
def recommend_option(options: list[dict], weights: dict[str, float]) -> str:
    """Return name of highest weighted_total option."""
    ...
```

---

## Exercise 2: Agentic RAG grader

Write async function returning structured grade:

```python
async def grade_context(question: str, chunks: list[str]) -> dict:
    """Return {"sufficient": bool, "missing": str}."""
    ...
```

Use structured outputs or JSON mode.

---

## Exercise 3: MCP auth middleware

FastAPI dependency that validates `Authorization: Bearer` header against env key; raises 401/429 appropriately.

---

## Exercise 4: Router cascade

```python
async def route_request(task: str, confidence: float) -> Literal["student", "finetuned", "teacher"]:
    """Route summarization by confidence and task type."""
    ...
```

---

## Grading rubric (self)

| Score | Criteria |
|-------|----------|
| 70%+ | Exercises 1–2 correct with edge cases |
| 85%+ | + Exercise 3 auth and rate limit sketch |
| 95%+ | + Exercise 4 with tests |

[← Cheat Sheet](cheat-sheet.md)
