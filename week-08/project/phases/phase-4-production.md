# Phase 4 — Production (Day 7)

> [← Phase 3](phase-3-product.md) · [Overview](../overview.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/`

**Goal:** Production-ready capstone — RAGAS evaluation with CI regression gate, full Docker Compose stack, public GitHub README, portfolio artifacts.

---

## Day 7 Deliverables

| Artifact | Description |
|----------|-------------|
| `rag_eval_report.json` | RAGAS faithfulness, context precision, answer relevance |
| `.github/workflows/eval-gate.yml` | Fails if regression > 5% |
| `docker compose up` | All services healthy |
| Public README | Per [github-readme-spec.md](../github-readme-spec.md) |
| Portfolio | [resume bullets](../../portfolio/resume-bullets.md) updated |

---

## Day 7 task order (recommended)

| Block | Time | Action |
|-------|------|--------|
| 1 | 90 min | RAGAS golden set + local eval — [eval.md](../eval.md) |
| 2 | 60 min | CI workflow + threshold env vars |
| 3 | 60 min | Docker hardening — healthchecks, `.env.example` |
| 4 | 45 min | README + architecture export |
| 5 | 45 min | Capstone defense prep — [interview/system-design.md](../../interview/system-design.md) |
| Optional | 60 min | [azure.md](../azure.md) deploy |

---

## Phase 4 Acceptance

- [ ] `rag_eval_report.json` meets minimums in `.env` (`RAGAS_FAITHFULNESS_MIN`, etc.)
- [ ] CI gate blocks intentional bad prompt regression (test once locally)
- [ ] `docker compose ps` — postgres, redis, backend, worker all healthy
- [ ] `pytest` green — unit + integration
- [ ] README includes demo GIF or screenshot + setup steps
- [ ] [acceptance-criteria.md](../acceptance-criteria.md) fully checked

---

## Ship checklist (final hour)

1. Scrub secrets from traces and README
2. Tag release `v1.0.0-capstone` on GitHub
3. Export [week-08-showcase.md](../../portfolio/week-08-showcase.md) bullets with real numbers
4. Run [exit-criteria.md](../../checkpoints/exit-criteria.md)
5. Celebrate — 8 weeks complete

---

## Optional — Azure

Deploy backend + worker to Azure Container Apps; managed Postgres Flexible Server with pgvector extension. Not required for exit criteria. See [azure.md](../azure.md).

---

## AI engineer takeaway

Day 7 is what separates a demo from a **portfolio project**: eval numbers, CI badge, and a README that lets a hiring manager run it in 10 minutes.
