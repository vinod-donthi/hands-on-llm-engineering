# Week 6 — Visual Assets

> Image inventory for theory, labs, and project docs. **Learning path only** — no secrets or generated lab output with API keys.

## Conventions

| Rule | Value |
|------|--------|
| **Location** | `week-06/assets/images/day-NN/` (theory) · `labs/` · `project/` |
| **Naming** | `{topic}-{concept}.svg` |
| **Embed** | `![Alt text](../assets/images/day-NN/file.svg)` from theory/labs/project files |
| **Caption** | Italic line below: *Figure: …* |
| **Formats** | **SVG** for diagrams and UI mockups |

From `week-06/theory/*.md`, use relative path: `../assets/images/day-NN/…`

From `week-06/START-HERE.md` (week root), use: `assets/images/project/…` (**no** `../`)

Style and validation: [.cursor/rules/learning-svg-assets.mdc](../../.cursor/rules/learning-svg-assets.mdc)

---

## Inventory

| File | Image | Status |
|------|-------|--------|
| [theory/why-eval-matters.md](../theory/why-eval-matters.md) | [day-01/eval-pyramid.svg](day-01/eval-pyramid.svg) | done |
| [theory/ragas-metrics.md](../theory/ragas-metrics.md) | [day-02/ragas-four-metrics.svg](day-02/ragas-four-metrics.svg) | done |
| [theory/deepeval-pytest.md](../theory/deepeval-pytest.md) | [day-02/deepeval-pytest-ci.svg](day-02/deepeval-pytest-ci.svg) | done |
| [theory/promptfoo-regression.md](../theory/promptfoo-regression.md) | [day-03/promptfoo-diff-grid.svg](day-03/promptfoo-diff-grid.svg) | done |
| [theory/layered-eval-pipeline.md](../theory/layered-eval-pipeline.md) | [day-03/layered-pipeline-stages.svg](day-03/layered-pipeline-stages.svg) | done |
| [theory/llm-as-judge-calibration.md](../theory/llm-as-judge-calibration.md) | [day-04/judge-calibration-curve.svg](day-04/judge-calibration-curve.svg) | done |
| [theory/golden-datasets-trace-regression.md](../theory/golden-datasets-trace-regression.md) | [day-04/golden-set-regression.svg](day-04/golden-set-regression.svg) | done |
| [theory/ci-cd-eval-gates.md](../theory/ci-cd-eval-gates.md) | [day-05/ci-gate-block-merge.svg](day-05/ci-gate-block-merge.svg) | done |
| [theory/observability-eval-dashboards.md](../theory/observability-eval-dashboards.md) | [day-05/eval-dashboard.svg](day-05/eval-dashboard.svg) | done |
| [theory/red-teaming-security-eval.md](../theory/red-teaming-security-eval.md) | [day-06/red-team-categories.svg](day-06/red-team-categories.svg) | done |
| [theory/agent-trajectory-eval.md](../theory/agent-trajectory-eval.md) | [day-06/agent-trajectory-scoring.svg](day-06/agent-trajectory-scoring.svg) | done |
| [labs/lab-01-ragas-baseline.md](../labs/lab-01-ragas-baseline.md) | [labs/lab-01-ragas-baseline-report.svg](labs/lab-01-ragas-baseline-report.svg) | done |
| [labs/lab-02-deepeval-tests.md](../labs/lab-02-deepeval-tests.md) | [labs/lab-02-deepeval-pytest-output.svg](labs/lab-02-deepeval-pytest-output.svg) | done |
| [labs/lab-03-promptfoo-regression.md](../labs/lab-03-promptfoo-regression.md) | [labs/lab-03-promptfoo-results.svg](labs/lab-03-promptfoo-results.svg) | done |
| [labs/lab-04-llm-judge-calibration.md](../labs/lab-04-llm-judge-calibration.md) | [labs/lab-04-judge-calibration-report.svg](labs/lab-04-judge-calibration-report.svg) | done |
| [labs/lab-05-ci-eval-gate.md](../labs/lab-05-ci-eval-gate.md) | [labs/lab-05-ci-gate-failure.svg](labs/lab-05-ci-gate-failure.svg) | done |
| [labs/lab-06-observability-traces.md](../labs/lab-06-observability-traces.md) | [labs/lab-06-langfuse-traces.svg](labs/lab-06-langfuse-traces.svg) | done |
| [project/architecture.md](../project/architecture.md) | [project/eval-pipeline-studio-architecture.svg](project/eval-pipeline-studio-architecture.svg) | done |
| [project/eval-pipeline-spec.md](../project/eval-pipeline-spec.md) | [project/eval-pipeline-studio-architecture.svg](project/eval-pipeline-studio-architecture.svg) | done |
| [START-HERE.md](../START-HERE.md) | [project/start-here-two-paths.svg](project/start-here-two-paths.svg) | done |
| [interview/cheat-sheet.md](../interview/cheat-sheet.md) | [project/cheat-sheet-card.svg](project/cheat-sheet-card.svg) | done |

**Total:** 20 figures across Week 6.

---

## Phases

| Phase | Scope | Status |
|-------|--------|--------|
| **1** | Day 1-2: why eval, RAGAS, DeepEval + Labs 1-2 | done |
| **2** | Day 3-4: Promptfoo, layered pipeline, judge, traces + Labs 3-4 | done |
| **3** | Day 5-6: CI gates, dashboards, red team, agents + Labs 5-6 | done |
| **4** | Project, START-HERE, cheat-sheet | done |

---

## Style guide

- Light background (`#fafafa`), dark text (`#1a1a1a`)
- Accent blue `#2563eb` (eval tools / CI), accent orange `#ea580c` (cost / gates)
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
