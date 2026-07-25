# Week 6 Exit Criteria

> Week 6 · [Quiz](quiz.md) · [Progress Tracker](progress-tracker.md)

Complete **all gates** before starting Week 7.

## Gate 1 — Knowledge

- [ ] [Quiz](quiz.md) score ≥ **12/15** (80%)
- [ ] Can explain layered eval pipeline without notes (L1–L5)
- [ ] Can whiteboard CI gate math (baseline, floor, 5%)

## Gate 2 — Labs

- [ ] Lab 1: `ragas_baseline_report.json`
- [ ] Lab 2: `pytest tests/test_llm_eval.py` passes
- [ ] Lab 3: `promptfoo_results.json` (≥10 cases)
- [ ] Lab 4: `judge_calibration_report.json` (≥75% agreement)
- [ ] Lab 5: `.github/workflows/eval-gate.yml` functional
- [ ] Lab 6 optional — skipped OK if noted in [progress.md](../progress.md)

## Gate 3 — Build (Eval Pipeline Studio)

All items from [acceptance-criteria.md](../project/acceptance-criteria.md):

- [ ] Golden dataset ≥ 30 pairs
- [ ] Layered pipeline (RAGAS + DeepEval + Promptfoo)
- [ ] CI gate blocks > 5% faithfulness regression (demonstrated)
- [ ] Dashboard or Langfuse snapshot
- [ ] Red team report
- [ ] Agent trajectory report (or documented stub)

## Gate 4 — Coding

- [ ] [Coding assignment](../interview/coding.md) ≥ **70%**

## Gate 5 — Interview readiness

- [ ] [Progress tracker](progress-tracker.md) self-assessment ≥ **4/5** hire-ready
- [ ] Can answer "Design eval for production RAG" in 10 minutes ([system design](../interview/system-design.md))

## Time budget check

- [ ] Total week ≤ **28 hours** (or documented catch-up plan)
- [ ] Cloud spend ≤ **$15** (or documented)

---

**All gates pass?** Update [progress.md](../progress.md) and proceed to Week 7.

**Blocked?** Catch-up order: Lab 5 CI → Lab 1 baseline → Lab 2 DeepEval → theory skim → quiz.
