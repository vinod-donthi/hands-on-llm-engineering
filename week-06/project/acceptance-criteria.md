# Eval Pipeline Studio — Acceptance Criteria

> Week 6 Project · [Overview](overview.md) · [Exit Criteria](../checkpoints/exit-criteria.md)

Check every item before marking Week 6 complete.

## Golden dataset

- [ ] `eval/golden_dataset.json` with ≥ 30 pairs
- [ ] Ground truth verified from source documents (not LLM-generated)
- [ ] Includes ≥ 3 negative (unanswerable) cases
- [ ] Stable IDs (`g001`, …) and version field

## Layered eval pipeline

- [ ] **RAGAS** — full metrics on golden set; report in `reports/`
- [ ] **DeepEval** — `tests/test_llm_eval.py` with ≥ 3 cases, all pass
- [ ] **Promptfoo** — ≥ 10 cases, two prompt variants or model comparison
- [ ] **Orchestrator** — `run_full_eval.py` runs layers in order with short-circuit

## CI gate

- [ ] `.github/workflows/eval-gate.yml` exists
- [ ] Fast job (DeepEval) runs on PR
- [ ] Full job (RAGAS + gate) runs on push to main
- [ ] **Demonstrated:** intentional regression fails gate; fix passes
- [ ] Baseline pinned in `eval/baseline.json`
- [ ] Floor = baseline minus 5%; documented in report

## Judge calibration

- [ ] `judge_calibration_report.json` — agreement ≥ 75% vs human labels
- [ ] Rubric version frozen in Git (`eval/judge_rubric_v1.txt`)

## Trace regression

- [ ] ≥ 5 trace baselines in `eval/traces/baseline/`
- [ ] Trace diff runs on full suite (or documented manual check)

## Security eval

- [ ] `reports/redteam_report.json` — ≥ 10 attack scenarios
- [ ] Pass rate documented; PII exfil failures investigated

## Agent trajectory (if Week 4 agent available)

- [ ] `reports/agent_trajectory_report.json` with tool correctness metrics
- [ ] OR documented stub with 3 golden agent trajectories

## Observability & dashboard

- [ ] Langfuse traces for eval runs OR LangSmith equivalent (Lab 6)
- [ ] Dashboard shows faithfulness + latency + cost **OR** `dashboard_snapshot.json`
- [ ] Online sampling documented (even if deferred with reason)

## API / service

- [ ] `POST /api/v1/eval/run` triggers suite
- [ ] `GET /api/v1/eval/reports` lists reports
- [ ] Health check returns 200

## Validation

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 12/15
- [ ] [Coding assignment](../interview/coding.md) ≥ 70%
- [ ] [Interview checkpoint](../checkpoints/progress-tracker.md) ≥ 4/5 hire-ready

## Portfolio (optional)

- [ ] [week-06-showcase.md](../portfolio/week-06-showcase.md) drafted
- [ ] [resume-bullets.md](../portfolio/resume-bullets.md) updated

---

**Ship definition:** All required checkboxes above (through Validation) — portfolio optional.
