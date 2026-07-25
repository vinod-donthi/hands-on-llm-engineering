# Doc Q&A Studio — API

> Week 3 Project · [← Backend](backend.md) · [Eval Spec](eval-spec.md)

Base URL: `http://localhost:8000/api/v1`

## POST /index

Ingest and index documents.

**Request**

```json
{
  "paths": ["data/documents/handbook.pdf", "data/documents/policy.md"],
  "chunk_strategy": "fixed_512_64",
  "force_reindex": false
}
```

**Response 200**

```json
{
  "index_version": "v1_2026-07-25",
  "documents_indexed": 2,
  "chunks_added": 134,
  "chunks_skipped_duplicate": 0,
  "embedding_model": "text-embedding-3-small",
  "duration_ms": 12400
}
```

**Errors**

| Code | When |
|------|------|
| 400 | Unknown file format |
| 404 | Path not found |
| 422 | Invalid chunk_strategy |

---

## POST /chat

Non-streaming chat (simple clients / tests).

**Request**

```json
{
  "question": "What is the remote work equipment stipend?",
  "top_k": 20,
  "rerank_n": 5
}
```

**Response 200**

```json
{
  "answer": "Eligible remote employees receive a $500 equipment stipend annually [handbook.pdf p.13].",
  "citations": [
    {
      "chunk_id": "handbook-2026_f_12",
      "label": "handbook.pdf p.13",
      "source_path": "data/documents/handbook.pdf",
      "page": 13,
      "score": 0.94,
      "preview": "Equipment stipend: $500 annually..."
    }
  ],
  "metadata": {
    "retrieval_ms": 38,
    "rerank_ms": 112,
    "llm_ms": 980,
    "context_tokens": 842,
    "model": "gpt-4o-mini"
  }
}
```

---

## POST /chat/stream

Server-Sent Events streaming (primary UI path).

**Request:** same body as `/chat`

**Events**

```
event: status
data: {"phase": "retrieving"}

event: token
data: {"text": "Eligible"}

event: token
data: {"text": " remote"}

event: citations
data: {"citations": [{"chunk_id": "...", "label": "handbook.pdf p.13"}]}

event: done
data: {"metadata": {"llm_ms": 980}}
```

---

## GET /index/status

**Response 200**

```json
{
  "index_version": "v1_2026-07-25",
  "chunk_count": 247,
  "document_count": 8,
  "embedding_model": "text-embedding-3-small",
  "last_indexed_at": "2026-07-25T14:30:00Z"
}
```

---

## GET /chunks/{chunk_id}

Preview chunk for citation panel.

**Response 200**

```json
{
  "chunk_id": "handbook-2026_f_12",
  "text": "Equipment stipend: $500 annually...",
  "metadata": {"doc_id": "handbook-2026", "page": 13}
}
```

---

## Error envelope (consistent with Week 2)

```json
{
  "error": {
    "code": "CONTEXT_BUDGET_EXCEEDED",
    "message": "Retrieved context exceeds model limit",
    "details": {"context_tokens": 12000, "limit": 8000}
  }
}
```

## Next

[indexing-spec.md](indexing-spec.md) · [eval-spec.md](eval-spec.md)
