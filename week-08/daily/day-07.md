# Day 7 — Phase 4: Eval CI, Docker, Ship

> **You are here:** Day 7 of 7 · Phase 4 of 4 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 6](day-06.md) |
| **Today's outcome** | Production capstone shipped — eval CI, Docker, public README |
| **Time** | 5h (capstone finish line) |
| **Work dir** | `week-08-work/` or `~/ai-learning/week-08-work/` |
| **Stop when** | All [acceptance criteria](../project/acceptance-criteria.md) checked |

**Catch-up:** Eval gate + Docker + README minimum; Azure optional.

---

## Steps

### Step 1 — Theory: Eval CI (~30 min)

Read [eval-ci-gates.md](../theory/eval-ci-gates.md).

### Step 2 — Theory: Docker deploy (~20 min)

Read [docker-azure-deployment.md](../theory/docker-azure-deployment.md) — Docker sections.

### Step 3 — RAGAS eval (~90 min)

Build golden set + run eval per [eval.md](../project/eval.md).

```bash
python -m app.eval.run_ragas --output artifacts/rag_eval_report.json
```

### Step 4 — CI gate (~60 min)

Add `.github/workflows/eval-gate.yml`. Optional deep dive: [Lab 7](../labs/lab-07-eval-ci-gate.md).

### Step 5 — Docker full stack (~60 min)

Complete `docker compose` per [docker.md](../project/docker.md). Verify all healthchecks.

### Step 6 — Tests (~30 min)

```bash
pytest tests/unit tests/integration
```

### Step 7 — README + portfolio (~45 min)

- Public README per [github-readme-spec.md](../project/github-readme-spec.md)
- Update [resume-bullets.md](../portfolio/resume-bullets.md)
- Fill [week-08-showcase.md](../portfolio/week-08-showcase.md)

### Step 8 — Capstone defense prep (~30 min)

Review [interview/system-design.md](../interview/system-design.md) — practice 15-min walkthrough.

### Step 9 — Validation

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 80%
- [ ] [Exit criteria](../checkpoints/exit-criteria.md) all boxes
- [ ] Phase 4 + program complete in [progress.md](../progress.md)

---

## Done when

- [ ] `rag_eval_report.json` meets thresholds
- [ ] CI eval workflow green
- [ ] `docker compose up` full stack healthy
- [ ] GitHub README published
- [ ] **8-week program complete**

---

## What's next

Update LinkedIn · mock interviews · [job-readiness/](../../job-readiness/) if present.

**Congratulations — you shipped AI Radar.**
