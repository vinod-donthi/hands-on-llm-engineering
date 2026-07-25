# Doc Q&A Studio — Acceptance Criteria

> Week 3 Project · [← Overview](overview.md) · [Exit Criteria](../checkpoints/exit-criteria.md)

Check every item before marking Week 3 complete.

## Indexing

- [ ] Upload or CLI index of ≥3 documents (PDF and/or Markdown)
- [ ] Chunks stored in Chroma with `chunk_id`, text, metadata
- [ ] `GET /api/v1/index/status` returns accurate chunk count
- [ ] Re-index same file with unchanged checksum skips duplicate work
- [ ] `index_manifest.json` written with embed model + strategy

## Retrieval pipeline

- [ ] BM25 index built over same chunks as Chroma
- [ ] Hybrid RRF (k=60) merges BM25 + dense top-50
- [ ] Cross-encoder reranks top-20 → top-5
- [ ] Retrieval logged: bm25/dense/rrf lists available in debug mode

## Generation

- [ ] `POST /api/v1/chat` returns answer + `citations[]`
- [ ] `POST /api/v1/chat/stream` streams tokens via SSE
- [ ] System prompt enforces source-only answers
- [ ] Unanswerable question returns refusal (no fabricated citation)
- [ ] Context assembly respects 2000-token retrieval budget

## Evaluation

- [ ] `eval/golden_dataset.json` with ≥50 pairs
- [ ] Includes ≥5 negative (not in corpus) questions
- [ ] `rag_eval_report.json` with all four RAGAS metrics
- [ ] **Faithfulness ≥ 0.75** on full golden set
- [ ] Report includes `pipeline_version` and embedding model

## Code quality

- [ ] `pytest` passes for RRF, context budget, citation schema tests
- [ ] No API keys in git
- [ ] Observability log line per chat with latency breakdown

## Optional (Lab 6 — not required for exit)

- [ ] pgvector table populated; row count matches Chroma
- [ ] Filtered vector search by `doc_id`

## Portfolio

- [ ] Screenshot or demo note in [week-03-showcase.md](../portfolio/week-03-showcase.md)
- [ ] 2–3 resume bullets drafted in [resume-bullets.md](../portfolio/resume-bullets.md)

## Validation gates

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 12/15
- [ ] [Coding assignment](../interview/coding.md) ≥ 70%
- [ ] [Interview self-assessment](../checkpoints/progress-tracker.md) ≥ 4/5 hire-ready

**All required boxes checked → proceed to Week 4.**
