# Week 8 — Visual Assets

> Image inventory for theory, labs, and project docs. **Learning path only** — no secrets or generated lab output with API keys.

## Conventions

| Rule | Value |
|------|--------|
| **Location** | `week-08/assets/images/day-NN/` (theory) · `labs/` · `project/` |
| **Naming** | `{topic}-{concept}.svg` |
| **Embed** | `![Alt text](../assets/images/day-NN/file.svg)` from theory/labs/project files |
| **Caption** | Italic line below: *Figure: …* |
| **Formats** | **SVG** for diagrams and UI mockups |

From `week-08/theory/*.md`, use relative path: `../assets/images/day-NN/…`

From `week-08/labs/*.md`, use: `../assets/images/labs/…`

From `week-08/project/*.md`, use: `../assets/images/project/…`

From `week-08/START-HERE.md` (week root), use: `assets/images/project/…` (**no** `../`)

Style and validation: [.cursor/rules/learning-svg-assets.mdc](../../.cursor/rules/learning-svg-assets.mdc)

---

## Inventory

| File | Image | Status |
|------|-------|--------|
| [theory/capstone-architecture-overview.md](../theory/capstone-architecture-overview.md) | [day-01/capstone-architecture-overview.svg](day-01/capstone-architecture-overview.svg) | done |
| [theory/ingestion-scheduling.md](../theory/ingestion-scheduling.md) | [day-01/ingestion-scheduling.svg](day-01/ingestion-scheduling.svg) | done |
| [theory/pgvector-redis-caching.md](../theory/pgvector-redis-caching.md) | [day-02/pgvector-redis-caching.svg](day-02/pgvector-redis-caching.svg) | done |
| [theory/langgraph-orchestration.md](../theory/langgraph-orchestration.md) | [day-03/langgraph-orchestration.svg](day-03/langgraph-orchestration.svg) | done |
| [theory/mcp-tool-integration.md](../theory/mcp-tool-integration.md) | [day-03/mcp-tool-integration.svg](day-03/mcp-tool-integration.svg) | done |
| [theory/agentic-rag-patterns.md](../theory/agentic-rag-patterns.md) | [day-04/agentic-rag-patterns.svg](day-04/agentic-rag-patterns.svg) | done |
| [theory/nextjs-dashboard-patterns.md](../theory/nextjs-dashboard-patterns.md) | [day-05/nextjs-dashboard-patterns.svg](day-05/nextjs-dashboard-patterns.svg) | done |
| [theory/eval-ci-gates.md](../theory/eval-ci-gates.md) | [day-07/eval-ci-gates.svg](day-07/eval-ci-gates.svg) | done |
| [theory/docker-azure-deployment.md](../theory/docker-azure-deployment.md) | [day-07/docker-azure-deployment.svg](day-07/docker-azure-deployment.svg) | done |
| [labs/lab-01-ingestion-smoke.md](../labs/lab-01-ingestion-smoke.md) | [labs/lab-01-ingestion-smoke.svg](labs/lab-01-ingestion-smoke.svg) | done |
| [labs/lab-02-pgvector-retrieval.md](../labs/lab-02-pgvector-retrieval.md) | [labs/lab-02-pgvector-retrieval.svg](labs/lab-02-pgvector-retrieval.svg) | done |
| [labs/lab-03-langgraph-mcp.md](../labs/lab-03-langgraph-mcp.md) | [labs/lab-03-langgraph-mcp.svg](labs/lab-03-langgraph-mcp.svg) | done |
| [labs/lab-04-agentic-rag-query.md](../labs/lab-04-agentic-rag-query.md) | [labs/lab-04-agentic-rag-query.svg](labs/lab-04-agentic-rag-query.svg) | done |
| [labs/lab-05-redis-semantic-cache.md](../labs/lab-05-redis-semantic-cache.md) | [labs/lab-05-redis-semantic-cache.svg](labs/lab-05-redis-semantic-cache.svg) | done |
| [labs/lab-06-email-digest-scheduler.md](../labs/lab-06-email-digest-scheduler.md) | [labs/lab-06-email-digest-scheduler.svg](labs/lab-06-email-digest-scheduler.svg) | done |
| [labs/lab-07-eval-ci-gate.md](../labs/lab-07-eval-ci-gate.md) | [labs/lab-07-eval-ci-gate.svg](labs/lab-07-eval-ci-gate.svg) | done |
| [project/architecture.md](../project/architecture.md) | [project/ai-radar-capstone-architecture.svg](project/ai-radar-capstone-architecture.svg) | done |
| [START-HERE.md](../START-HERE.md) | [project/start-here-two-paths.svg](project/start-here-two-paths.svg) | done |
| [interview/cheat-sheet.md](../interview/cheat-sheet.md) | [project/cheat-sheet-card.svg](project/cheat-sheet-card.svg) | done |

**Total:** 19 figures across Week 8.

**Note:** `ingestion-scheduling` and `pgvector-redis-caching` appear on multiple days — one figure each, embedded in the primary theory file.

---

## Folder map

```
week-08/assets/images/
├── day-01/          capstone-architecture-overview, ingestion-scheduling
├── day-02/          pgvector-redis-caching
├── day-03/          langgraph-orchestration, mcp-tool-integration
├── day-04/          agentic-rag-patterns
├── day-05/          nextjs-dashboard-patterns
├── day-06/          (digest reuses day-01 ingestion-scheduling figure)
├── day-07/          eval-ci-gates, docker-azure-deployment
├── labs/            lab-01 through lab-07 mockups
└── project/         capstone architecture, start-here, cheat-sheet
```

---

## Phases

| Phase | Scope | Status |
|-------|--------|--------|
| **1** | Day 1–2: capstone overview, ingestion, pgvector + Labs 1–2 | done |
| **2** | Day 3–4: LangGraph, MCP, agentic RAG + Labs 3–4 | done |
| **3** | Day 5–6: dashboard, Redis cache, digest + Labs 5–6 | done |
| **4** | Day 7: eval CI, Docker/Azure + Lab 7 + project figures | done |

---

## Style guide

- Light background (`#fafafa`), dark text (`#1a1a1a`)
- Accent blue `#2563eb` (API / agents), accent orange `#ea580c` (cache / cost / guardrails)
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
