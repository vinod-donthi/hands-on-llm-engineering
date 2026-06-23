# Minimum Viable Week 1

> Week 1 Project · **Good enough to enter Week 2** · [Build guide](BUILD-GUIDE.md) · [Acceptance criteria](acceptance-criteria.md)

Not every learner ships the full Next.js UI in Week 1. This page defines the **minimum bar** to move on vs the **portfolio-perfect** bar.

---

## What problem are we solving?

Acceptance criteria read like a production launch checklist. That can feel impossible on Day 7 if you only have a FastAPI backend. This page separates **must pass** from **nice to have**.

---

## Minimum viable (Week 2 gate)

You may proceed to Week 2 when **all** of these are true:

| # | Requirement | How to verify |
|---|-------------|---------------|
| 1 | Labs 1, 3, 4, 5 complete | Deliverables in work dir |
| 2 | `POST /api/v1/compare` works (cloud + local) | curl or Lab 5 export |
| 3 | `test_compare_partial_failure` passes | `cd lab04_backend && pytest -q` |
| 4 | `POST /api/v1/extract` with `parse_status` | extraction test or curl |
| 5 | Capstone: 5 prompts scored | `capstone_comparison.json` |
| 6 | Capstone report | `model_comparison_report.md` (1–2 pages) |
| 7 | Quiz ≥ 80% | [quiz.md](../checkpoints/quiz.md) |
| 8 | You can explain observability envelope without notes | Self-check / interview doc |

**Explicitly optional for minimum viable:**

- Next.js UI
- Evaluation sliders in a browser (manual scores in JSON are fine)
- Lab 6 benchmark
- Lab 2 embeddings (one of Lab 2 or 6 may be skipped)
- `Makefile` (recommended but not blocking if `pytest` works)

Document in your report: *"UI deferred to Week 2; capstone run via API + export script."*

---

## Portfolio-perfect (full acceptance criteria)

Everything in [acceptance-criteria.md](acceptance-criteria.md), including:

- Side-by-side compare UI
- Client-side JSON export with scores
- Evaluation sliders in the app
- Repo standards: `.gitignore`, `Makefile`, README
- Demo recording checklist in [portfolio](../portfolio/week-01-showcase.md)

Aim for this if you have Day 7 Path A time or want interview demo material.

---

## Example: minimum viable file tree

```
week-01-work/
├── lab04_backend/              # API + tests
├── compare_sample_output.json    # Lab 5
├── capstone_comparison.json      # Day 7
├── model_comparison_report.md    # Day 7
├── benchmark_summary.csv         # optional Lab 6
└── progress.md                   # copied from curriculum, updated
```

No `prompt-playground-lite/` required for minimum viable.

---

## Example: portfolio-perfect file tree

```
week-01-work/
├── prompt-playground-lite/
│   ├── backend/                  # migrated from lab04_backend
│   ├── frontend/                 # Next.js UI
│   ├── Makefile
│   └── README.md
├── capstone_comparison.json
└── model_comparison_report.md
```

---

## AI engineer takeaway

Shipping a **tested API with observability and partial-failure handling** is the Week 1 engineering lesson. The UI is how you *demo* it — not the only way to prove you built it.

---

## Next

[Day 7 playbook](../daily/day-07.md) · [Capstone prompts](CAPSTONE-PROMPTS.md)
