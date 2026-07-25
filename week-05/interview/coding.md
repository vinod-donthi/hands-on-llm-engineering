# Week 5 Interview — Coding

> [← System Design](system-design.md) · [Cheat Sheet](cheat-sheet.md)

## Exercise 1: Rate limit decorator (15 min)

Implement async Redis sliding-window rate limit:

```python
async def rate_limit(redis, key: str, limit: int, window_sec: int) -> bool:
    """
    Return True if request allowed, False if rate limited.
    Key example: ratelimit:user_123:202607251400
    """
    # Your code
```

**Expected:** Uses `INCR` + `EXPIRE`; atomic enough for interview; mention Lua for strictness.

---

## Exercise 2: Cache key normalization (10 min)

```python
def rag_cache_key(query: str) -> str:
    """Return Redis key cache:rag:{hash} with stable normalization."""
```

**Expected:** strip, lower, collapse whitespace, sha256 hex digest.

---

## Exercise 3: Cosine similarity (10 min)

```python
import numpy as np

def cosine_similarity(a: list[float], b: list[float]) -> float:
    ...
```

**Expected:** Dot product / (norms); handle zero vector edge case.

---

## Exercise 4: Job status handler (20 min)

Sketch FastAPI routes:

- `POST /jobs/rag` — enqueue ARQ, return 202
- `GET /jobs/{id}` — read status from Redis

**Expected:** Status enum `queued | running | completed | failed`; TTL on results.

---

## Exercise 5: Readiness check (10 min)

```python
async def check_ready(redis, qdrant_client) -> dict:
    """Return {"ready": bool, "checks": {...}}"""
```

**Expected:** Timeout per check; partial failure returns `ready: false`.

---

## Grading rubric (self-score)

| Score | Criteria |
|-------|----------|
| **70%+ pass** | Working logic, mentions edge cases |
| **90%+ strong** | Async-safe, Redis key design, error handling |
| **100% staff** | Idempotency, observability hooks, production comments |

Target: complete 3/5 exercises in 45 minutes.
