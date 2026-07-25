# Week 3 — RAG (Retrieval Augmented Generation)

**8-Week AI Engineering Curriculum · Part 3 of 8**

> **Prerequisite:** Week 2 exit criteria passed · [Week 2 README](../week-02/README.md)  
> **New here?** [START-HERE.md](START-HERE.md) → [Day 1 playbook](daily/day-01.md)

---

## 1. Overview

Week 3 teaches **Retrieval Augmented Generation (RAG)** — how to ground an LLM in your own documents instead of relying on model memory alone. You will ingest PDFs and Markdown, chunk them intelligently, embed and index them, retrieve with **hybrid search (BM25 + dense + RRF)**, rerank with a cross-encoder, evaluate with **RAGAS**, and ship **Doc Q&A Studio**: a document chatbot with citations and an eval report.

**Builds on Week 1–2:** embeddings intuition ([Week 1](../week-01/theory/embeddings.md)), provider abstraction ([Week 2](../week-02/theory/openai-api.md)), context budgeting ([Week 2](../week-02/theory/context-management.md)), structured outputs for citations.

---

## 2. Learning Path vs Work Path

| | Learning path | Work path |
|---|---|---|
| **Purpose** | Read curriculum | Write code, run labs, build project |
| **Location** | This repo — `Learning/week-03/` | `Learning/week-03-work/` **or** `~/ai-learning/week-03-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, lab scripts, `doc-qa-studio/`, `.env` |
| **Git** | Curriculum (no secrets, no venv) | Your code repo (optional) |

### Study flow

```
1. Open today's playbook       → daily/day-XX.md     (numbered steps — your driver)
2. Read theory in step order   → only files linked from that day
3. Code in work directory      → week-03-work/ or ~/ai-learning/week-03-work/
4. Confirm deliverable         → Done when checkboxes on daily page
5. Update progress.md          → tick the day
6. Follow Tomorrow link        → next daily/day-XX.md
```

**Week map:** [daily/README.md](daily/README.md) · **When short on time:** catch-up mode on each daily page (lab + deliverable first). See [roadmap.md](roadmap.md).

---

## 3. Weekly Outcomes

- [ ] Ingest PDF, DOCX, and Markdown with metadata preserved
- [ ] Implement fixed, semantic, and parent-child chunking; compare recall
- [ ] Index documents in Chroma (local) and pgvector (production path)
- [ ] Hybrid retrieval: BM25 + dense embeddings fused with RRF
- [ ] Two-stage retrieve → cross-encoder rerank pipeline
- [ ] Golden dataset with 50+ Q&A pairs and source citations
- [ ] RAGAS eval report (`rag_eval_report.json`) with faithfulness ≥ 0.75
- [ ] Complete Labs 1–5 (Lab 6 optional if behind)
- [ ] Ship Doc Q&A Studio with streaming chat + source citations
- [ ] Quiz ≥ 80% · Coding assignment ≥ 70%

Full checklist: [checkpoints/exit-criteria.md](checkpoints/exit-criteria.md)

---

## 4. Folder Map

| Folder | Purpose |
|--------|---------|
| [START-HERE.md](START-HERE.md) | One-time orientation → Day 1 |
| [daily/](daily/) | **Numbered playbooks** — one file per day |
| [theory/](theory/) | Deep dives — one topic per file |
| [labs/](labs/) | Hands-on exercises |
| [project/](project/) | Doc Q&A Studio spec |
| [interview/](interview/) | Questions + cheat sheet |
| [checkpoints/](checkpoints/) | Quiz, exit criteria, progress |
| [resources/](resources/) | Reading, glossary, references |
| [appendix/](../appendix/) | **Optional** deep dives — never blocks week progress |
| [portfolio/](portfolio/) | Resume, LinkedIn, showcase |
| [requirements.txt](requirements.txt) | Python deps (copied to work path) |
| [scripts/setup-work.sh](scripts/setup-work.sh) | Bootstrap work directory |

---

## 5. Setup

### One-time: bootstrap work directory

```bash
cd week-03
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Creates `~/ai-learning/week-03-work/`, copies `requirements.txt` and `.env.example`, creates `.venv`, installs deps.

Custom work location:

```bash
./scripts/setup-work.sh ~/projects/my-week-03
# or
WORK_DIR=~/projects/my-week-03 ./scripts/setup-work.sh
```

### Migrate from Week 2 (recommended)

Copy your provider layer and FastAPI patterns — Week 3 extends them for RAG, not replaces them.

```bash
cp -r ~/ai-learning/week-02-work/model-benchmark-studio/backend/app/providers \
      ~/ai-learning/week-03-work/doc-qa-studio/backend/app/ 2>/dev/null || true
```

### Every session

```bash
cd ~/ai-learning/week-03-work
source .venv/bin/activate
```

### API keys (`.env`)

| Key | Required | Use |
|-----|----------|-----|
| `OPENAI_API_KEY` | Yes | Embeddings (`text-embedding-3-small`) + chat (`gpt-4o-mini`) |
| `COHERE_API_KEY` | Optional | Hosted reranker in Lab 4 (local cross-encoder works without it) |
| Ollama + `nomic-embed-text` | Optional | Free local embeddings |

**Estimated cloud spend:** $5–12 for the full week (embeddings + eval LLM calls).

### Docker (Day 6+)

```bash
docker compose -f doc-qa-studio/docker-compose.yml up -d
```

---

## 6. Navigation

### Theory

Full index: [theory/README.md](theory/README.md)

[Document Ingestion](theory/document-ingestion.md) · [Chunking](theory/chunking-strategies.md) · [Embeddings for RAG](theory/embeddings-retrieval.md) · [Vector DBs](theory/vector-databases.md) · [Hybrid Search + RRF](theory/hybrid-search-rrf.md) · [Reranking](theory/reranking.md) · [Context & Citations](theory/context-assembly-citations.md) · [RAGAS Eval](theory/rag-evaluation-ragas.md) · [Failure Modes](theory/rag-failure-modes.md) · [Agentic RAG Preview](theory/agentic-rag-preview.md)

### Labs

[Overview](labs/README.md) · [Lab 1](labs/lab-01-document-ingestion-chunking.md) · [Lab 2](labs/lab-02-embeddings-chroma.md) · [Lab 3](labs/lab-03-hybrid-search.md) · [Lab 4](labs/lab-04-reranking.md) · [Lab 5](labs/lab-05-ragas-eval.md) · [Lab 6](labs/lab-06-pgvector.md) *(optional)*

### Project

[Overview](project/overview.md) · [Architecture](project/architecture.md) · [Backend](project/backend.md) · [Frontend](project/frontend.md) · [API](project/api.md) · [Indexing Spec](project/indexing-spec.md) · [Eval Spec](project/eval-spec.md) · [Acceptance Criteria](project/acceptance-criteria.md)

### Interview & Validation

[Concepts](interview/concepts.md) · [System Design](interview/system-design.md) · [Coding](interview/coding.md) · [Cheat Sheet](interview/cheat-sheet.md) · [Quiz](checkpoints/quiz.md) · [Exit Criteria](checkpoints/exit-criteria.md)

---

## 7. Daily Checklist

| Day | Must Complete | Optional |
|-----|---------------|----------|
| 1 | Lab 1, ingestion + chunking theory | Extra parsers (HTML) |
| 2 | Lab 2, Chroma index | Ollama embeddings |
| 3 | Lab 3, hybrid search + RRF | Query expansion |
| 4 | Lab 4, reranking | Cohere vs local compare |
| 5 | Lab 5, RAGAS + golden dataset start | HyDE query transform |
| 6 | Project indexing + API, agentic preview | Lab 6 pgvector |
| 7 | Capstone eval report + validation | Portfolio docs |

Details: [daily/](daily/)

---

## 8. Progress Tracker

```bash
cp progress.md ~/ai-learning/week-03-work/
```

---

## 9. Week Completion Criteria

| Gate | Requirement |
|------|-------------|
| **Knowledge** | Quiz ≥ 12/15 |
| **Build** | All [acceptance criteria](project/acceptance-criteria.md) checked |
| **Retrieval** | Hybrid + rerank pipeline returns cited chunks |
| **Eval** | `rag_eval_report.json` with 50+ golden pairs; faithfulness ≥ 0.75 |
| **Checkpoint** | ≥ 4/5 interview self-assessment parts at hire-ready |

Proceed to Week 4 (AI Agents) only when all gates pass. See [checkpoints/progress-tracker.md](checkpoints/progress-tracker.md).
