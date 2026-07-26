# Week 5 — Visual Assets

> Image inventory for theory, labs, and project docs. **Learning path only** — no secrets or generated lab output with API keys.

## Conventions

| Rule | Value |
|------|--------|
| **Location** | `week-05/assets/images/day-NN/` (theory) · `labs/` · `project/` |
| **Naming** | `{topic}-{concept}.svg` |
| **Embed** | `![Alt text](../assets/images/day-NN/file.svg)` from theory/labs/project files |
| **Caption** | Italic line below: *Figure: …* |
| **Formats** | **SVG** for diagrams and UI mockups |

From `week-05/theory/*.md`, use relative path: `../assets/images/day-NN/…`

From `week-05/START-HERE.md` (week root), use: `assets/images/project/…` (**no** `../`)

Style and validation: [.cursor/rules/learning-svg-assets.mdc](../../../.cursor/rules/learning-svg-assets.mdc)

---

## Inventory

| File | Image | Status |
|------|-------|--------|
| [theory/fastapi-production.md](../../theory/fastapi-production.md) | [day-01/fastapi-middleware-stack.svg](day-01/fastapi-middleware-stack.svg) | done |
| [theory/docker-compose.md](../../theory/docker-compose.md) | [day-02/docker-compose-services.svg](day-02/docker-compose-services.svg) | done |
| [theory/redis-patterns.md](../../theory/redis-patterns.md) | [day-03/redis-cache-rate-limit.svg](day-03/redis-cache-rate-limit.svg) | done |
| [theory/semantic-caching.md](../../theory/semantic-caching.md) | [day-04/semantic-cache-similarity.svg](day-04/semantic-cache-similarity.svg) | done |
| [theory/background-queues.md](../../theory/background-queues.md) | [day-05/arq-worker-queue.svg](day-05/arq-worker-queue.svg) | done |
| [theory/observability.md](../../theory/observability.md) | [day-06/otel-langfuse-traces.svg](day-06/otel-langfuse-traces.svg) | done |
| [theory/scaling-cost-backpressure.md](../../theory/scaling-cost-backpressure.md) | [day-07/scaling-backpressure.svg](day-07/scaling-backpressure.svg) | done |
| [theory/azure-deployment.md](../../theory/azure-deployment.md) | [day-07/azure-container-apps-deploy.svg](day-07/azure-container-apps-deploy.svg) | done |
| [labs/lab-01-fastapi-production.md](../../labs/lab-01-fastapi-production.md) | [labs/lab-01-health-probe-output.svg](labs/lab-01-health-probe-output.svg) | done |
| [labs/lab-02-docker-compose.md](../../labs/lab-02-docker-compose.md) | [labs/lab-02-compose-healthy.svg](labs/lab-02-compose-healthy.svg) | done |
| [labs/lab-03-redis.md](../../labs/lab-03-redis.md) | [labs/lab-03-redis-cache-demo.svg](labs/lab-03-redis-cache-demo.svg) | done |
| [labs/lab-04-semantic-cache.md](../../labs/lab-04-semantic-cache.md) | [labs/lab-04-semantic-cache-demo.svg](labs/lab-04-semantic-cache-demo.svg) | done |
| [labs/lab-05-background-jobs.md](../../labs/lab-05-background-jobs.md) | [labs/lab-05-job-trace-demo.svg](labs/lab-05-job-trace-demo.svg) | done |
| [labs/lab-06-observability.md](../../labs/lab-06-observability.md) | [labs/lab-06-trace-export.svg](labs/lab-06-trace-export.svg) | done |
| [project/architecture.md](../../project/architecture.md) | [project/production-ai-stack-architecture.svg](project/production-ai-stack-architecture.svg) | done |
| [START-HERE.md](../../START-HERE.md) | [project/start-here-two-paths.svg](project/start-here-two-paths.svg) | done |
| [interview/cheat-sheet.md](../../interview/cheat-sheet.md) | [project/cheat-sheet-card.svg](project/cheat-sheet-card.svg) | done |

**Total:** 17 figures across Week 5.

---

## Phases

| Phase | Scope | Status |
|-------|--------|--------|
| **1** | Day 1–2: FastAPI production, Docker Compose | done |
| **2** | Day 3–4: Redis patterns, semantic caching + Labs 1–4 | done |
| **3** | Day 5–6: ARQ queues, observability + Labs 5–6 | done |
| **4** | Day 7: scaling, Azure deploy, project, START-HERE, cheat-sheet | done |

---

## Style guide

- Light background (`#fafafa`), dark text (`#1a1a1a`)
- Accent blue `#2563eb` (API / providers), accent orange `#ea580c` (cost / guardrails / backpressure)
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
