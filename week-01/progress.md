# Week 1 Progress Tracker

> Update after each [daily playbook](daily/) · Max **5h/day**, **25h/week**. [Roadmap](roadmap.md) · [Where am I?](WHERE-AM-I.md)

**Learning path:** `Learning/week-01/` (read) · **Work path:** `week-01-work/` in repo or `~/ai-learning/week-01-work/` (code)

**Auto-hints:** If the deliverable file exists in your work dir, you can tick the lab row. Build rows map to [acceptance criteria](project/acceptance-criteria.md).

---

## Week Summary

| Metric | Target | Actual |
|--------|--------|--------|
| Hours spent | ≤ 25h | |
| Days completed | 7 | /7 |
| Labs done | 5 required | /5 |
| Cloud spend | ≤ $4 | $ |

---

## Daily Log

| Day | Planned (h) | Actual (h) | Done | Notes |
|-----|-------------|------------|------|-------|
| [Day 1](daily/day-01.md) | 3–4 | | [ ] | |
| [Day 2](daily/day-02.md) | 3–4 | | [ ] | |
| [Day 3](daily/day-03.md) | 3–4 | | [ ] | |
| [Day 4](daily/day-04.md) | 3–4 | | [ ] | |
| [Day 5](daily/day-05.md) | 4–5 | | [ ] | |
| [Day 6](daily/day-06.md) | 4–5 | | [ ] | |
| [Day 7](daily/day-07.md) | 4–5 | | [ ] | |

---

## Labs

| Lab | Required | Done | Deliverable | **Tick if file exists** |
|-----|----------|------|-------------|-------------------------|
| [Lab 1](labs/lab-01-tokenization.md) | Yes | [ ] | `token_cost_report.csv` | ✓ `token_cost_report.csv` |
| [Lab 2](labs/lab-02-embeddings.md) | Yes* | [ ] | `similarity_results.md` | ✓ `similarity_results.md` |
| [Lab 3](labs/lab-03-sampling.md) | Yes | [ ] | `sampling_analysis.md` | ✓ `sampling_analysis.md` |
| [Lab 4](labs/lab-04-provider-abstraction.md) | Yes | [ ] | Backend smoke test | ✓ `lab04_backend/` + `lab04_observability_log.md` |
| [Lab 5](labs/lab-05-model-comparison.md) | Yes | [ ] | `compare_sample_output.json` | ✓ `compare_sample_output.json` |
| [Lab 6](labs/lab-06-local-benchmark.md) | Optional | [ ] | `benchmark_summary.csv` | ✓ `benchmark_summary.csv` |

*One of Lab 2 or Lab 6 may be skipped if behind.

---

## Build — Prompt Playground Lite

| Item | Done | **Tick if true** |
|------|------|------------------|
| Backend `/api/v1/compare` | [ ] | `pytest tests/test_compare_partial_failure.py` passes |
| Observability on every response | [ ] | Lab 4 `/complete` returns `request_id`, tokens, cost |
| JSON extraction ladder | [ ] | `/api/v1/extract` + `test_extraction_ladder.py` |
| Frontend compare UI | [ ] | `prompt-playground-lite/frontend/` runs — **optional** for [minimum viable](project/minimum-viable-week1.md) |
| Evaluation sliders | [ ] | UI or manual scores in capstone JSON |
| Client export JSON | [ ] | Export button or `capstone_comparison.json` |
| `test_compare_partial_failure` | [ ] | Green in `lab04_backend/` |
| [Acceptance criteria](project/acceptance-criteria.md) all checked | [ ] | Full Path A |
| [Minimum viable Week 1](project/minimum-viable-week1.md) | [ ] | Path B gate |

---

## Validation

| Item | Done |
|------|------|
| [Quiz](checkpoints/quiz.md) ≥ 80% | [ ] |
| Coding assignment ≥ 70% | [ ] |
| [Interview checkpoint](checkpoints/progress-tracker.md) | [ ] |
| `capstone_comparison.json` | [ ] |
| `model_comparison_report.md` | [ ] |

---

## Optional Skip Used?

- [ ] Skipped Lab 2 (embeddings)
- [ ] Skipped Lab 6 (benchmark)
- [ ] Skipped UI (Path B — document in capstone report)
- [ ] Neither — completed all

---

## Next after Week 1

[exit-criteria.md](checkpoints/exit-criteria.md) → Week 2 when all gates pass.
