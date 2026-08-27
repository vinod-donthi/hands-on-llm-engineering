# Week 2 — Visual Assets

> Image inventory for theory, labs, and project docs. **Learning path only** — no secrets or generated lab output with API keys.

## Conventions

| Rule | Value |
|------|--------|
| **Location** | `week-02/assets/images/day-NN/` (theory) · `labs/` · `project/` |
| **Naming** | `{topic}-{concept}.svg` |
| **Embed** | `![Alt text](../assets/images/day-NN/file.svg)` from theory/labs/project files |
| **Caption** | Italic line below: *Figure: …* |
| **Formats** | **SVG** for diagrams and UI mockups |

From `week-02/theory/*.md`, use relative path: `../assets/images/day-NN/…`

From `week-02/START-HERE.md` (week root), use: `assets/images/project/…` (**no** `../`)

Style and validation: [.cursor/rules/learning-svg-assets.mdc](../../.cursor/rules/learning-svg-assets.mdc)

---

## Inventory

| File | Image | Status |
|------|-------|--------|
| [theory/openai-api.md](../theory/openai-api.md) | [day-01/openai-envelope-mapping.svg](day-01/openai-envelope-mapping.svg) | done |
| [theory/anthropic-api.md](../theory/anthropic-api.md) | [day-01/anthropic-openai-request-diff.svg](day-01/anthropic-openai-request-diff.svg) | done |
| [theory/open-source-models.md](../theory/open-source-models.md) | [day-02/open-source-stack-layers.svg](day-02/open-source-stack-layers.svg) | done |
| [theory/model-selection.md](../theory/model-selection.md) | [day-02/task-model-routing.svg](day-02/task-model-routing.svg) | done |
| [theory/streaming.md](../theory/streaming.md) | [day-03/streaming-ux-timeline.svg](day-03/streaming-ux-timeline.svg) | done |
| [theory/streaming.md](../theory/streaming.md) | [day-03/provider-chunk-normalization.svg](day-03/provider-chunk-normalization.svg) | done |
| [theory/function-calling.md](../theory/function-calling.md) | [day-04/tool-loop-message-flow.svg](day-04/tool-loop-message-flow.svg) | done |
| [theory/structured-outputs-engineering.md](../theory/structured-outputs-engineering.md) | [day-04/json-capability-matrix.svg](day-04/json-capability-matrix.svg) | done |
| [theory/context-management.md](../theory/context-management.md) | [day-05/context-tail-keep-trim.svg](day-05/context-tail-keep-trim.svg) | done |
| [theory/guardrails.md](../theory/guardrails.md) | [day-05/guardrail-block-examples.svg](day-05/guardrail-block-examples.svg) | done |
| [theory/cost-optimization.md](../theory/cost-optimization.md) | [day-05/request-cost-breakdown.svg](day-05/request-cost-breakdown.svg) | done |
| [labs/lab-01-provider-apis.md](../labs/lab-01-provider-apis.md) | [labs/lab-01-provider-smoke-output.svg](labs/lab-01-provider-smoke-output.svg) | done |
| [labs/lab-02-model-registry.md](../labs/lab-02-model-registry.md) | [labs/lab-02-registry-yaml.svg](labs/lab-02-registry-yaml.svg) | done |
| [labs/lab-03-streaming-sse.md](../labs/lab-03-streaming-sse.md) | [labs/lab-03-streaming-ui.svg](labs/lab-03-streaming-ui.svg) | done |
| [labs/lab-04-function-calling.md](../labs/lab-04-function-calling.md) | [labs/lab-04-tool-trace.svg](labs/lab-04-tool-trace.svg) | done |
| [labs/lab-05-context-cost.md](../labs/lab-05-context-cost.md) | [labs/lab-05-budget-guard.svg](labs/lab-05-budget-guard.svg) | done |
| [labs/lab-06-run-history.md](../labs/lab-06-run-history.md) | [labs/lab-06-run-history-ui.svg](labs/lab-06-run-history-ui.svg) | done |
| [project/architecture.md](../project/architecture.md) | [project/benchmark-studio-architecture.svg](project/benchmark-studio-architecture.svg) | done |
| [START-HERE.md](../START-HERE.md) | [project/start-here-two-paths.svg](project/start-here-two-paths.svg) | done |
| [interview/cheat-sheet.md](../interview/cheat-sheet.md) | [project/cheat-sheet-card.svg](project/cheat-sheet-card.svg) | done |

**Total:** 20 figures across Week 2.

---

## Phases

| Phase | Scope | Status |
|-------|--------|--------|
| **1** | Day 1–2: OpenAI, Anthropic, open-source, model selection | done |
| **2** | Day 3: streaming + Labs 1–3 | done |
| **3** | Day 4–5: function calling, structured outputs, context, guardrails, cost + Labs 4–5 | done |
| **4** | Project, START-HERE, cheat-sheet, Lab 6 | done |

---

## Style guide

- Light background (`#fafafa`), dark text (`#1a1a1a`)
- Accent blue `#2563eb` (providers / API), accent orange `#ea580c` (cost / guardrails)
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
