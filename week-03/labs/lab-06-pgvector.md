# Lab 6: pgvector Production Path (Optional)

> Week 3 Labs · [← README](README.md) · [Vector DB Theory](../theory/vector-databases.md)

> **Work dir:** `~/ai-learning/week-03-work/`

**Estimated cost:** $0 local Docker

**Goal:** Mirror Chroma index into PostgreSQL + pgvector; same chunk schema, SQL-filtered query.

When it works: `SELECT count(*) FROM document_chunks` matches Chroma chunk count; cosine query returns same top-1 chunk_id as Chroma for a smoke query.

**Optional — not required for Week 3 exit criteria** if Lab 6 skipped and documented in progress.md.

---

## Task

1. Start Postgres with pgvector via `doc-qa-studio/docker-compose.yml`
2. Run Alembic migration creating `document_chunks` table
3. Create `lab06_pgvector_migrate.py` — copy vectors from Lab 2 into Postgres
4. Implement `search_pgvector(query_embedding, top_k=20, doc_id_filter=None)`
5. Write `pgvector_migration_report.json`

### Schema (see project/indexing-spec.md)

```sql
CREATE EXTENSION IF NOT EXISTS vector;
CREATE TABLE document_chunks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    chunk_id TEXT UNIQUE NOT NULL,
    doc_id TEXT NOT NULL,
    chunk_text TEXT NOT NULL,
    embedding vector(1536),
    metadata JSONB,
    created_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX document_chunks_embedding_idx ON document_chunks
    USING hnsw (embedding vector_cosine_ops);
```

### SQL query

```sql
SELECT chunk_id, chunk_text, 1 - (embedding <=> :query_vec) AS score
FROM document_chunks
WHERE doc_id = :doc_id  -- optional filter
ORDER BY embedding <=> :query_vec
LIMIT 20;
```

---

## Expected output

```json
{
  "chroma_chunk_count": 247,
  "pgvector_row_count": 247,
  "smoke_query": "remote work stipend",
  "chroma_top1": "handbook-2026_f_12",
  "pgvector_top1": "handbook-2026_f_12",
  "match": true
}
```

---

## Acceptance

- [ ] pgvector extension enabled
- [ ] Row count matches Chroma
- [ ] HNSW index created
- [ ] Filtered query by `doc_id` works
- [ ] Notes on when you'd choose pgvector over Chroma in production

---

## Next

[Day 6](../daily/day-06.md) · Skip → [Day 7 capstone](../daily/day-07.md)
