# Week 7 — Visual Assets

> Image inventory for theory, labs, and project docs. **Learning path only** — no secrets or generated lab output with API keys.

## Conventions

| Rule | Value |
|------|--------|
| **Location** | `week-07/assets/images/day-NN/` (theory) · `labs/` · `project/` |
| **Naming** | `{topic}-{concept}.svg` |
| **Embed** | `![Alt text](../assets/images/day-NN/file.svg)` from theory/labs/project files |
| **Caption** | Italic line below: *Figure: …* |
| **Formats** | **SVG** for diagrams and UI mockups |

From `week-07/theory/*.md`, use relative path: `../assets/images/day-NN/…`

From `week-07/START-HERE.md` (week root), use: `assets/images/project/…` (**no** `../`)

Style and validation: [.cursor/rules/learning-svg-assets.mdc](../../../.cursor/rules/learning-svg-assets.mdc)

---

## Inventory

| File | Image | Status |
|------|-------|--------|
| [theory/decision-framework.md](../../theory/decision-framework.md) | [day-01/decision-matrix-options.svg](day-01/decision-matrix-options.svg) | done |
| [theory/lora-peft-finetuning.md](../../theory/lora-peft-finetuning.md) | [day-02/lora-adapter-layers.svg](day-02/lora-adapter-layers.svg) | done |
| [theory/distillation-small-models.md](../../theory/distillation-small-models.md) | [day-03/teacher-student-distillation.svg](day-03/teacher-student-distillation.svg) | done |
| [theory/agentic-rag.md](../../theory/agentic-rag.md) | [day-04/agentic-rag-grade-rewrite-loop.svg](day-04/agentic-rag-grade-rewrite-loop.svg) | done |
| [theory/long-context-vs-rag.md](../../theory/long-context-vs-rag.md) | [day-05/long-context-vs-rag-cost-quality.svg](day-05/long-context-vs-rag-cost-quality.svg) | done |
| [theory/graphrag-overview.md](../../theory/graphrag-overview.md) | [day-05/graphrag-communities.svg](day-05/graphrag-communities.svg) | done |
| [theory/multimodal-preview.md](../../theory/multimodal-preview.md) | [day-06/multimodal-vision-pipeline.svg](day-06/multimodal-vision-pipeline.svg) | done |
| [theory/mcp-production-patterns.md](../../theory/mcp-production-patterns.md) | [day-06/mcp-production-auth-rate-limits.svg](day-06/mcp-production-auth-rate-limits.svg) | done |
| [labs/lab-01-decision-matrix.md](../../labs/lab-01-decision-matrix.md) | [labs/lab-01-decision-matrix-output.svg](labs/lab-01-decision-matrix-output.svg) | done |
| [labs/lab-02-lora-finetune.md](../../labs/lab-02-lora-finetune.md) | [labs/lab-02-lora-finetune-status.svg](labs/lab-02-lora-finetune-status.svg) | done |
| [labs/lab-03-distillation-deploy.md](../../labs/lab-03-distillation-deploy.md) | [labs/lab-03-distillation-benchmark.svg](labs/lab-03-distillation-benchmark.svg) | done |
| [labs/lab-04-agentic-rag.md](../../labs/lab-04-agentic-rag.md) | [labs/lab-04-agentic-rag-trace.svg](labs/lab-04-agentic-rag-trace.svg) | done |
| [labs/lab-05-long-context-benchmark.md](../../labs/lab-05-long-context-benchmark.md) | [labs/lab-05-long-context-benchmark.svg](labs/lab-05-long-context-benchmark.svg) | done |
| [labs/lab-06-mcp-production.md](../../labs/lab-06-mcp-production.md) | [labs/lab-06-mcp-production-checklist.svg](labs/lab-06-mcp-production-checklist.svg) | done |
| [project/architecture.md](../../project/architecture.md) | [project/advanced-ai-studio-architecture.svg](project/advanced-ai-studio-architecture.svg) | done |
| [START-HERE.md](../../START-HERE.md) | [project/start-here-two-paths.svg](project/start-here-two-paths.svg) | done |
| [interview/cheat-sheet.md](../../interview/cheat-sheet.md) | [project/cheat-sheet-card.svg](project/cheat-sheet-card.svg) | done |

**Total:** 17 figures across Week 7.

---

## Phases

| Phase | Scope | Status |
|-------|--------|--------|
| **1** | Day 1–2: decision framework, LoRA/PEFT | done |
| **2** | Day 3–4: distillation, agentic RAG + Labs 1–4 | done |
| **3** | Day 5–6: long context, GraphRAG, multimodal, MCP + Labs 5–6 | done |
| **4** | Project, START-HERE, cheat-sheet | done |

---

## Style guide

- Light background (`#fafafa`), dark text (`#1a1a1a`)
- Accent blue `#2563eb` (models / API), accent orange `#ea580c` (cost / guardrails)
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
