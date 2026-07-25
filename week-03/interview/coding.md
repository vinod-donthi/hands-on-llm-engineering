# Week 3 Interview — Coding

> Week 3 · [← System Design](system-design.md) · [Cheat Sheet](cheat-sheet.md)

## Assignment: Implement hybrid retrieval core

**Time:** 45–60 minutes · **Pass threshold:** 70%

Implement in Python (no framework required):

1. `rrf_merge(rank_lists: list[list[str]], k: int = 60) -> list[tuple[str, float]]`
2. `retrieve_hybrid(query, bm25_index, vector_store, top_k=10) -> list[str]`
3. `assemble_context(chunks: list[dict], max_tokens: int) -> str`

### Provided stubs

```python
from dataclasses import dataclass

@dataclass
class Chunk:
    chunk_id: str
    text: str
    metadata: dict

def rrf_merge(rank_lists: list[list[str]], k: int = 60) -> list[tuple[str, float]]:
    """Return chunk_ids sorted by descending RRF score."""
    raise NotImplementedError

def assemble_context(chunks: list[Chunk], max_tokens: int, count_tokens) -> str:
    """Greedy pack with [SOURCE id | label] headers until budget exhausted."""
    raise NotImplementedError
```

### Test cases (must pass)

```python
def test_rrf_merge():
    bm25 = ["a", "b", "c"]
    dense = ["b", "a", "d"]
    merged = rrf_merge([bm25, dense], k=60)
    ids = [m[0] for m in merged]
    assert ids[0] in ("a", "b")  # both rank high in both lists
    assert "d" in ids[:3]

def test_assemble_respects_budget():
    chunks = [
        Chunk("c1", "x" * 400, {"source_path": "a.pdf", "page": 1}),
        Chunk("c2", "y" * 400, {"source_path": "a.pdf", "page": 2}),
    ]
    ctx = assemble_context(chunks, max_tokens=100, count_tokens=lambda s: len(s)//4)
    assert "SOURCE c1" in ctx
    assert count_tokens(ctx) <= 100
```

### Bonus (+10%)

- `rerank_top_k(query, chunks, model)` stub with mock scores
- Dedupe chunks with >80% Jaccard overlap on words

### Evaluation rubric

| Criteria | Points |
|----------|--------|
| RRF correct | 35 |
| Context assembly + SOURCE labels | 35 |
| Clean code, types | 15 |
| Bonus rerank / dedupe | 15 |

### Solution sketch (study after attempt)

<details>
<summary>Click after your attempt</summary>

```python
def rrf_merge(rank_lists, k=60):
    scores = {}
    for ranked in rank_lists:
        for rank, doc_id in enumerate(ranked, start=1):
            scores[doc_id] = scores.get(doc_id, 0) + 1 / (k + rank)
    return sorted(scores.items(), key=lambda x: x[1], reverse=True)
```

</details>

## Whiteboard prompts

1. Write cosine similarity in NumPy (no library).
2. Tokenize for BM25: lowercase, split, remove stopwords — discuss tradeoffs.
3. SQL: pgvector top-5 query with `WHERE tenant_id = $1`.

## Next

[Cheat Sheet](cheat-sheet.md) · [Quiz](../checkpoints/quiz.md)
