# Day 7 — Scaling, Deploy Capstone

> **You are here:** Day 7 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 6 — Observability](day-06.md) |
| **Today's outcome** | Production AI Stack passes acceptance criteria + load smoke test |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-05-work/` or `~/ai-learning/week-05-work/` |
| **Stop when** | [acceptance criteria](../project/acceptance-criteria.md) checked + quiz done |

**Catch-up:** acceptance checklist + load smoke only; Azure optional.

---

## Steps

### Step 1 — Theory: Scaling & cost (~25 min)

Read [scaling-cost-backpressure.md](../theory/scaling-cost-backpressure.md) — horizontal scale, queue depth, cost caps.

### Step 2 — Theory: Azure path (~20 min, optional)

Read [azure-deployment.md](../theory/azure-deployment.md) — Container Apps vs AKS; **not required for exit**.

### Step 3 — Backpressure + cost middleware (~60 min)

- Reject when ARQ queue depth > `MAX_QUEUE_DEPTH`
- Enforce `MAX_COST_USD_PER_REQUEST` and daily budget in Redis

### Step 4 — Load smoke test (~45 min)

```bash
cd ~/ai-learning/week-05-work/production-ai-stack
docker compose up -d
locust -f tests/load_smoke.py --headless -u 20 -r 5 -t 60s --host http://localhost:8000
```

Save summary to `load_smoke_results.json`.

### Step 5 — Deploy checklist (~45 min)

Complete [project/acceptance-criteria.md](../project/acceptance-criteria.md). Write `deploy_checklist.md` with:

- Compose services and ports
- Env vars required
- How to verify health, cache, traces

Optional: deploy to Azure Container Apps per [project/azure.md](../project/azure.md).

### Step 6 — Validation (~60 min)

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 12/15
- [ ] [Interview self-assessment](../checkpoints/progress-tracker.md)
- [ ] [Portfolio](../portfolio/week-05-showcase.md) draft

### Step 7 — Close out (~15 min)

- [ ] All days marked in [progress.md](../progress.md)
- [ ] Week 5 exit criteria reviewed

---

## Done when

- [ ] `load_smoke_results.json` — p95 latency and error rate documented
- [ ] `deploy_checklist.md` complete
- [ ] Acceptance criteria all checked
- [ ] Ready for Week 6 (Evaluation + Monitoring)

---

## Week complete

**→ [Week 6 README](../../week-06/README.md)** *(when published)* · Review [exit criteria](../checkpoints/exit-criteria.md)
