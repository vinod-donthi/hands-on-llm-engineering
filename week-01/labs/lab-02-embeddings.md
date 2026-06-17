# Lab 2: Embedding Similarity Search

> Week 1 Labs · [← README](../README.md) · [Project](../project/overview.md)

**Learning path:** This file (curriculum repo)
**Work dir:** `~/ai-learning/week-01-work/`

### Setup

```bash
cd ~/ai-learning/week-01-work
source .venv/bin/activate
```

**Goal:** Build semantic search over 20 document snippets; understand embedding space.

**File:** `lab02_embeddings.py`

**Dataset:** Create `documents.json` with 20 short snippets across 4 topics (python, cooking, finance, sports) — 5 per topic.

**Tasks:**

1. Embed all documents using Ollama `nomic-embed-text` (free) or OpenAI `text-embedding-3-small`.
2. Embed 5 test queries (one per topic + one ambiguous query).
3. Compute cosine similarity; return top-3 matches per query.
4. Print a similarity matrix for the ambiguous query against all 20 docs.

```python
import numpy as np

def cosine_similarity(a: np.ndarray, b: np.ndarray) -> float:
    return np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))
```

Run your script:

```bash
cd ~/ai-learning/week-01-work
source .venv/bin/activate
python lab02_embeddings.py
```

**Extension:** Identify one query where the top result is wrong — explain why in 2 sentences (hint: lexical overlap without semantic match, or topic ambiguity).

**Expected Output:**

```
Query: "python dictionary comprehension"
Top 1: (score 0.82) "List comprehensions and dict comprehensions in Python..."
Top 2: (score 0.45) "Monty Python was a comedy group..."
```

**Deliverable:** `similarity_results.md` with query results + one failure analysis.

---

## Cost notes

- **Default path (Ollama `nomic-embed-text`):** Free — runs locally; ensure Ollama is running (`ollama serve`) and the model is pulled (`ollama pull nomic-embed-text`).
- **Optional OpenAI path (`text-embedding-3-small`):** ~$0.02 per million tokens at time of writing — 20 docs + 5 queries is negligible (well under $0.01). Check [OpenAI embeddings pricing](https://openai.com/api/pricing/) before running at scale.

---
