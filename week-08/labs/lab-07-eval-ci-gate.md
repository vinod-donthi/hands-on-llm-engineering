# Lab 7: Eval CI Gate (Optional)

> Week 8 Labs · Day 7 · **Optional — not required if Day 7 eval steps completed via project spec** · [← README](README.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/`

**Estimated cost:** $1–2 per CI run

**Goal:** GitHub Actions workflow runs RAGAS and fails on regression.

---

## Task

1. Copy workflow from [eval.md](../project/eval.md)
2. Add `OPENAI_API_KEY` to GitHub secrets
3. Commit `artifacts/rag_eval_baseline.json` from green local run
4. Open test PR with bad prompt change — verify CI fails
5. Revert — verify CI passes

---

## Acceptance

- [ ] Workflow runs on PR
- [ ] Intentional regression fails build
- [ ] Badge in README shows status

---

## Next

Complete [acceptance criteria](../project/acceptance-criteria.md) · [exit criteria](../checkpoints/exit-criteria.md)
