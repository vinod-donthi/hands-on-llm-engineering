# AI Radar — Testing Strategy

> Week 8 Capstone · [Eval pipeline](eval.md) · [Backend](backend.md)

Three layers: **unit**, **integration**, **eval**. Pytest for first two; RAGAS for third. CI runs integration + eval on PRs.

---

## Test pyramid

```
        ┌─────────────┐
        │  RAGAS eval │  10 golden Q — faithfulness gate
        ├─────────────┤
        │ Integration │  API + DB + Redis — ~15 tests
        ├─────────────┤
        │    Unit     │  Pure functions — ~30 tests
        └─────────────┘
```

---

## Unit tests (`tests/unit/`)

| Module | Test focus |
|--------|------------|
| `chunker` | Max tokens, overlap, empty input |
| `dedupe` | Same URL twice → one document |
| `normalize` | RSS HTML → clean text |
| `semantic_cache` | Similar embeddings hit; dissimilar miss |
| `citation_parser` | Markdown links extracted |

```bash
pytest tests/unit -v
```

**Expected:** All green in < 10s, no network.

---

## Integration tests (`tests/integration/`)

| Test | Setup | Assert |
|------|-------|--------|
| `test_health` | TestClient | 200, db ok |
| `test_ingestion_pipeline` | Fixture DB + mocked HTTP | documents count ↑ |
| `test_feed_api` | Seed 5 docs | feed returns 5 |
| `test_query_rag_only` | Seed chunks | citations non-empty |
| `test_cache_hit` | Redis test container | 2nd query faster, cache_hit true |

Use **pytest fixtures** for async DB session; **respx** or **httpx mock** for external APIs.

```bash
pytest tests/integration -v --tb=short
```

Docker required for Postgres + Redis test containers (or pytest-docker).

---

## Eval tests (`tests/eval/`)

| Test | Purpose |
|------|---------|
| `test_ragas_thresholds` | Local run meets `.env` minimums |
| `test_regression_vs_baseline` | No > 5% drop |

Run separately in CI — costs money:

```bash
pytest tests/eval -m eval
```

Mark with `@pytest.mark.eval` to skip in fast local runs.

---

## Manual QA checklist (Day 7)

| # | Action | Pass |
|---|--------|------|
| 1 | `docker compose up` — all healthy | ☐ |
| 2 | Ingestion adds items | ☐ |
| 3 | Dashboard feed loads | ☐ |
| 4 | Query returns citations | ☐ |
| 5 | Digest preview renders | ☐ |
| 6 | Email received (or HTML artifact) | ☐ |
| 7 | CI eval gate green | ☐ |

---

## Test data

| Fixture | Location |
|---------|----------|
| Sample RSS XML | `tests/fixtures/sample_rss.xml` |
| Sample GitHub JSON | `tests/fixtures/github_search.json` |
| Mini corpus (5 docs) | `tests/fixtures/seed.sql` |

Never commit real API keys or production `.env`.

---

## Coverage target

| Layer | Target |
|-------|--------|
| Unit | ≥ 80% on `ingestion`, `rag`, `cache` |
| Integration | All public API routes ≥ 1 test |
| Eval | 100% golden set executed in CI |

Coverage is a guide — **faithfulness score** matters more than line coverage for LLM apps.

---

## Next

[Acceptance criteria](acceptance-criteria.md) · [Cost estimates](cost-estimates.md)
