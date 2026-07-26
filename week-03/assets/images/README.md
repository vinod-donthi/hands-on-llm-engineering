# Week 3 — Visual Assets

> Image inventory for theory, labs, and project docs. **Learning path only** — no secrets or generated lab output with API keys.

## Conventions

| Rule | Value |
|------|--------|
| **Location** | `week-03/assets/images/day-NN/` (theory) · `labs/` · `project/` |
| **Naming** | `{topic}-{concept}.svg` |
| **Embed** | `![Alt text](../assets/images/day-NN/file.svg)` from theory/labs/project files |
| **Caption** | Italic line below: *Figure: …* |
| **Formats** | **SVG** for diagrams and UI mockups |

From `week-03/theory/*.md`, use relative path: `../assets/images/day-NN/…`

From `week-03/START-HERE.md` (week root), use: `assets/images/project/…` (**no** `../`)

Style and validation: [.cursor/rules/learning-svg-assets.mdc](../../.cursor/rules/learning-svg-assets.mdc)

---

## Inventory

| File | Image | Status |
|------|-------|--------|
| [theory/document-ingestion.md](../theory/document-ingestion.md) | [day-01/document-ingestion-pipeline.svg](day-01/document-ingestion-pipeline.svg) | done |
| [theory/chunking-strategies.md](../theory/chunking-strategies.md) | [day-01/chunk-size-tradeoff.svg](day-01/chunk-size-tradeoff.svg) | done |
| [theory/embeddings-retrieval.md](../theory/embeddings-retrieval.md) | [day-02/bi-encoder-retrieval.svg](day-02/bi-encoder-retrieval.svg) | done |
| [theory/vector-databases.md](../theory/vector-databases.md) | [day-02/chroma-vs-pgvector.svg](day-02/chroma-vs-pgvector.svg) | done |
| [theory/hybrid-search-rrf.md](../theory/hybrid-search-rrf.md) | [day-03/bm25-dense-rrf-fusion.svg](day-03/bm25-dense-rrf-fusion.svg) | done |
| [theory/reranking.md](../theory/reranking.md) | [day-04/two-stage-rerank.svg](day-04/two-stage-rerank.svg) | done |
| [theory/context-assembly-citations.md](../theory/context-assembly-citations.md) | [day-04/context-citations-assembly.svg](day-04/context-citations-assembly.svg) | done |
| [theory/rag-evaluation-ragas.md](../theory/rag-evaluation-ragas.md) | [day-05/ragas-metrics.svg](day-05/ragas-metrics.svg) | done |
| [theory/rag-failure-modes.md](../theory/rag-failure-modes.md) | [day-05/rag-failure-debug-tree.svg](day-05/rag-failure-debug-tree.svg) | done |
| [theory/agentic-rag-preview.md](../theory/agentic-rag-preview.md) | [day-06/agentic-rag-loop.svg](day-06/agentic-rag-loop.svg) | done |
| [labs/lab-01-document-ingestion-chunking.md](../labs/lab-01-document-ingestion-chunking.md) | [labs/lab-01-chunking-output.svg](labs/lab-01-chunking-output.svg) | done |
| [labs/lab-02-embeddings-chroma.md](../labs/lab-02-embeddings-chroma.md) | [labs/lab-02-chroma-index.svg](labs/lab-02-chroma-index.svg) | done |
| [labs/lab-03-hybrid-search.md](../labs/lab-03-hybrid-search.md) | [labs/lab-03-hybrid-search-results.svg](labs/lab-03-hybrid-search-results.svg) | done |
| [labs/lab-04-reranking.md](../labs/lab-04-reranking.md) | [labs/lab-04-rerank-comparison.svg](labs/lab-04-rerank-comparison.svg) | done |
| [labs/lab-05-ragas-eval.md](../labs/lab-05-ragas-eval.md) | [labs/lab-05-ragas-report.svg](labs/lab-05-ragas-report.svg) | done |
| [labs/lab-06-pgvector.md](../labs/lab-06-pgvector.md) | [labs/lab-06-pgvector-migrate.svg](labs/lab-06-pgvector-migrate.svg) | done |
| [project/architecture.md](../project/architecture.md) | [project/doc-qa-studio-architecture.svg](project/doc-qa-studio-architecture.svg) | done |
| [START-HERE.md](../START-HERE.md) | [project/start-here-two-paths.svg](project/start-here-two-paths.svg) | done |
| [interview/cheat-sheet.md](../interview/cheat-sheet.md) | [project/cheat-sheet-card.svg](project/cheat-sheet-card.svg) | done |

**Total:** 19 figures across Week 3.

---

## Phases

| Phase | Scope | Status |
|-------|--------|--------|
| **1** | Day 1: document ingestion, chunking strategies | done |
| **2** | Day 2: embeddings retrieval, vector databases + Labs 1–2 | done |
| **3** | Day 3–4: hybrid RRF, reranking, context citations + Labs 3–4 | done |
| **4** | Day 5–6: RAGAS, failure modes, agentic preview + Labs 5–6 | done |
| **5** | Project, START-HERE, cheat-sheet | done |

---

## Style guide

- Light background (`#fafafa`), dark text (`#1a1a1a`)
- Accent blue `#2563eb` (retrieval / API), accent orange `#ea580c` (cost / rerank / guardrails)
- Max width ~720px in SVG `viewBox`; figures should read on mobile GitHub preview
- Alt text: one sentence describing what to notice
- Run `xmllint --noout` on every SVG before committing

---

## Adding figures

1. Pick embed point in the target `.md` (after the concept paragraph, before the next heading).
2. Create SVG under the correct `day-NN/`, `labs/`, or `project/` folder.
3. Embed with `![alt](../assets/images/…)` + *Figure:* caption.
4. Update this inventory table.
5. Validate with `xmllint --noout path/to/file.svg`.
