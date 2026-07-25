# Week 3 Exit Criteria

> Week 3 · [← Quiz](quiz.md) · [Progress Tracker](progress-tracker.md)

Pass **all** gates before starting Week 4 (AI Agents).

---

## Knowledge gates

| Gate | Requirement | Evidence |
|------|-------------|----------|
| Quiz | ≥ 12/15 | [quiz.md](quiz.md) completed |
| Theory checkpoints | Self-test Q answered for Days 1–5 | Notes optional |
| Interview concepts | Explain RAG pipeline in ≤ 2 min | [concepts.md](../interview/concepts.md) |

---

## Build gates

| Gate | Requirement | Evidence |
|------|-------------|----------|
| Labs 1–5 | All deliverable JSON files exist | Work dir artifacts |
| Doc Q&A Studio | Running locally | Chat + upload |
| Hybrid + rerank | Pipeline wired in project | Debug logs or demo |
| Citations | API returns `citations[]` | Sample response |
| Golden dataset | ≥ 50 Q&A pairs | `eval/golden_dataset.json` |
| RAGAS eval | faithfulness ≥ 0.75 | `rag_eval_report.json` |

Full checklist: [acceptance-criteria.md](../project/acceptance-criteria.md)

---

## Optional skip policy

| Skipped | Allowed if… |
|---------|-------------|
| Lab 6 (pgvector) | Documented in progress.md; Chroma capstone complete |

Only **one** optional lab may be skipped per [roadmap.md](../roadmap.md).

---

## Time & cost

| Limit | Target |
|-------|--------|
| Total hours | ≤ 28h |
| Max per day | ≤ 5h |
| Cloud spend | ≤ $12 |

---

## Week 2 prerequisites (verify)

- [ ] Completed [Week 2 exit criteria](../../week-02/checkpoints/exit-criteria.md)
- [ ] Comfortable with FastAPI + SSE from Model Benchmark Studio
- [ ] `.env` API keys working

---

## Sign-off

When all gates pass:

1. Mark week complete in [progress.md](../progress.md)
2. Archive artifacts: `rag_eval_report.json`, screenshot, golden set (private docs stay out of curriculum repo)
3. Update [portfolio](../portfolio/week-03-showcase.md)
4. Begin [Week 4 — AI Agents](../../prompt.md)

---

## Not ready yet?

| Blocker | Action |
|---------|--------|
| Low faithfulness | [failure modes](../theory/rag-failure-modes.md) tuning order |
| Behind on labs | Catch-up mode on [daily/](../daily/) pages |
| No documents to index | Use Week 1–3 theory Markdown files as corpus |
| Eval cost concern | Run 20-sample subset daily; full 50 on Day 7 only |
