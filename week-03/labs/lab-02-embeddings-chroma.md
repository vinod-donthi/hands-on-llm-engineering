# Lab 2: Embeddings & Chroma Index

> Week 3 Labs · [← README](README.md) · [Embeddings Theory](../theory/embeddings-retrieval.md)

> **Learning path:** Specs only · **Work dir:** `~/ai-learning/week-03-work/`

## Setup

```bash
cd ~/ai-learning/week-03-work
source .venv/bin/activate
```

**Estimated cost:** $0.20–0.80 (depends on chunk count)

**Goal:** Embed chunks from Lab 1 and persist a searchable Chroma collection.

When it works: `chroma_index_stats.json` reports chunk count and sample query hits with scores > 0.7 for on-topic questions.

---

## Task

Create `lab02_embed_chroma.py`:

1. Load chunks from `chunked_documents.json` (pick `fixed_512_64` or `parent_child.children`)
2. Batch embed with OpenAI `text-embedding-3-small` (batch size 64)
3. Create/replace Chroma collection `doc_qa_v1` at `CHROMA_PERSIST_DIR`
4. Store metadata: `doc_id`, `page`, `source_path`, `chunk_id`
5. Run 3 smoke queries; write `chroma_index_stats.json`

### CLI

```bash
python lab02_embed_chroma.py \
  --chunks chunked_documents.json \
  --strategy fixed_512_64 \
  --collection doc_qa_v1 \
  --out chroma_index_stats.json
```

### Expected output shape

```json
{
  "collection": "doc_qa_v1",
  "embedding_model": "text-embedding-3-small",
  "dimensions": 1536,
  "chunk_count": 247,
  "persist_dir": "data/chroma",
  "indexed_at": "2026-07-25T12:00:00Z",
  "smoke_queries": [
    {
      "query": "remote work equipment stipend",
      "top_3": [
        {"chunk_id": "handbook-2026_f_12", "score": 0.84, "preview": "Equipment stipend..."}
      ]
    }
  ]
}
```

---

## Implementation hints

```python
import chromadb
from openai import OpenAI

client = chromadb.PersistentClient(path="data/chroma")
collection = client.get_or_create_collection(name="doc_qa_v1", metadata={"hnsw:space": "cosine"})

# Prepend title before embed: f"Document: {title}\n{text}"
```

Log total tokens embedded for cost tracking (Week 2 pattern).

---

## Acceptance

- [ ] Collection persists after script exit (restart and query again)
- [ ] `chunk_count` matches input strategy
- [ ] 3 smoke queries return relevant previews in top-3
- [ ] `embedding_model` recorded in stats JSON

---

## Next

[Day 2](../daily/day-02.md) → [Lab 3](lab-03-hybrid-search.md)
