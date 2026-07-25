# Doc Q&A Studio — Indexing Spec

> Week 3 Project · [← Architecture](architecture.md) · [Backend](backend.md)

## Chunk record schema

Every indexed chunk MUST conform to:

```json
{
  "chunk_id": "handbook-2026_f_12",
  "doc_id": "handbook-2026",
  "text": "Equipment stipend: $500 annually for remote employees...",
  "metadata": {
    "source_path": "data/documents/handbook.pdf",
    "title": "Employee Handbook 2026",
    "page": 13,
    "heading": "Remote Work Policy",
    "chunk_index": 12,
    "strategy": "fixed_512_64",
    "parent_id": null,
    "token_count": 186,
    "checksum_sha256": "abc123..."
  },
  "embedding": null
}
```

Embeddings stored in Chroma/pgvector — not duplicated in JSON exports.

## Document record schema

```json
{
  "doc_id": "handbook-2026",
  "source_path": "data/documents/handbook.pdf",
  "mime_type": "application/pdf",
  "title": "Employee Handbook 2026",
  "page_count": 40,
  "checksum_sha256": "def456...",
  "ingested_at": "2026-07-25T10:00:00Z",
  "parser_version": "pypdf-4.0"
}
```

## Idempotency rules

| Condition | Action |
|-----------|--------|
| Same `checksum_sha256` + same `chunk_strategy` + same `embedding_model` | Skip re-index |
| Same file, different checksum | Delete old chunks for `doc_id`, re-index |
| `force_reindex: true` | Delete all chunks for paths, re-index |

## Chunk strategies (config)

| Key | Parameters | Default |
|-----|------------|---------|
| `fixed_512_64` | size=512, overlap=64 | **Week 3 default** |
| `semantic_0.5` | similarity_threshold=0.5 | Optional eval |
| `parent_child` | parent=1500, child=300 | Optional eval |

Only one active strategy per collection. Switching strategy requires new collection name or full re-index.

## Chroma collection metadata

```python
collection = client.get_or_create_collection(
    name="doc_qa_v1",
    metadata={
        "embedding_model": "text-embedding-3-small",
        "chunk_strategy": "fixed_512_64",
        "index_version": "v1_2026-07-25",
    },
)
```

## pgvector schema (Lab 6 / production)

```sql
CREATE TABLE documents (
    doc_id TEXT PRIMARY KEY,
    source_path TEXT NOT NULL,
    checksum_sha256 TEXT NOT NULL,
    metadata JSONB,
    ingested_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE document_chunks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    chunk_id TEXT UNIQUE NOT NULL,
    doc_id TEXT REFERENCES documents(doc_id) ON DELETE CASCADE,
    chunk_text TEXT NOT NULL,
    embedding vector(1536) NOT NULL,
    metadata JSONB,
    created_at TIMESTAMPTZ DEFAULT now()
);
```

## BM25 sidecar

Store alongside Chroma:

```
data/bm25/
  tokenized_corpus.pkl    # list of token lists aligned to chunk_ids
  chunk_id_list.json      # index → chunk_id mapping
```

Rebuild BM25 whenever Chroma collection changes.

## Index manifest

Write `data/index_manifest.json` after each index job:

```json
{
  "index_version": "v1_2026-07-25",
  "collection_name": "doc_qa_v1",
  "embedding_model": "text-embedding-3-small",
  "chunk_strategy": "fixed_512_64",
  "document_count": 8,
  "chunk_count": 247,
  "created_at": "2026-07-25T14:30:00Z"
}
```

## Text preprocessing

Before chunk + embed:

1. Strip repeated headers/footers matching regex `Page \d+ of \d+`
2. Normalize whitespace
3. Prepend to each chunk: `Document: {title}\n`

## Next

[eval-spec.md](eval-spec.md)
