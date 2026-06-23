# Day 7 — Playground Lite + Capstone

> **You are here:** Day 7 of 7 · [← Daily index](README.md) · [Where am I?](../WHERE-AM-I.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 6](day-06.md) — compare + benchmark |
| **Today's outcome** | Close backend gaps, run capstone, validate Week 1 |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-01-work/lab04_backend/` **or** `week-01-work/prompt-playground-lite/` after scaffold |
| **Stop when** | [minimum viable Week 1](../project/minimum-viable-week1.md) gates pass + capstone files exist |

**Confused after Day 6?** Read [BUILD-GUIDE.md](../project/BUILD-GUIDE.md) first — it explains `lab04_backend/` vs `prompt-playground-lite/`.

---

## Steps

### Step 1 — Know what you have (~10 min)

Open [BUILD-GUIDE.md](../project/BUILD-GUIDE.md) § "What you probably have already."

In your work dir, confirm:

- [ ] `lab04_backend/` exists and `pytest -q` passes
- [ ] `compare_sample_output.json` from Lab 5
- [ ] (Optional) `benchmark_summary.csv` from Lab 6

Pick a path:

| Path | When |
|------|------|
| **A — Full UI** | Time for Next.js + all [acceptance criteria](../project/acceptance-criteria.md) |
| **B — Backend capstone** | Tight on time — see [minimum-viable-week1.md](../project/minimum-viable-week1.md) |

---

### Step 2 — Backend gaps (~60–90 min)

Work in `lab04_backend/` (or `prompt-playground-lite/backend/` if you scaffolded in Step 3).

- [ ] Implement `POST /api/v1/extract` — JSON ladder per [backend.md](../project/backend.md) + [structured-output.md](../theory/structured-output.md)
- [ ] Add `tests/test_extraction_ladder.py` (success + `parse_failure` paths)
- [ ] Re-run `pytest -q` — `test_compare_partial_failure` must still pass
- [ ] Add `Makefile` with `make test` (optional but in acceptance criteria)

**Smoke extract:**

```bash
cd lab04_backend && source ../.venv/bin/activate
uvicorn app.main:app --reload --port 8000
```

```bash
curl -s -X POST http://localhost:8000/api/v1/extract \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Jane Doe, CTO at Acme AI, joined in March 2022.",
    "schema": {"name": "string", "role": "string", "company": "string", "start_year": "integer"},
    "model_id": "openai/gpt-4o-mini"
  }' | python3 -m json.tool
```

---

### Step 3 — Scaffold monorepo (Path A only, ~30 min)

Skip if Path B.

```bash
cd Learning/week-01
chmod +x scripts/scaffold-playground-lite.sh
./scripts/scaffold-playground-lite.sh
# Uses week-01-work/ in repo by default if it exists
```

- [ ] `prompt-playground-lite/backend/` contains your copied API
- [ ] `prompt-playground-lite/frontend/` — run `npm install` && `npm run dev`
- [ ] Browser loads compare UI on :3000

Details: [frontend.md](../project/frontend.md) · [architecture.md](../project/architecture.md)

---

### Step 4 — UI polish (Path A only, ~90 min)

- [ ] Compare button calls `POST /api/v1/compare`
- [ ] Metrics bar shows `request_id`, tokens, cost, latency, `error`
- [ ] Score panel — 4 sliders → composite ([evaluation-rubric.md](../project/evaluation-rubric.md))
- [ ] Export button downloads JSON with scores + observability fields
- [ ] Partial failure: one red panel, others still show text ([failure-recovery.md](../project/failure-recovery.md))

**Minimum first:** one `page.tsx` that compares two models. Add sliders after compare works.

---

### Step 5 — Capstone (~90 min)

Read [CAPSTONE-PROMPTS.md](../project/CAPSTONE-PROMPTS.md) — **use these five prompts**, do not invent new ones.

- [ ] Run all 5 through compare (prompt 4 via `/extract` on cloud)
- [ ] Score each model with rubric dimensions 1–5
- [ ] Write `capstone_comparison.json` in work dir root
- [ ] Write `model_comparison_report.md` (1–2 pages — outline in CAPSTONE-PROMPTS)

---

### Step 6 — Validation (~30 min)

- [ ] [Quiz](../checkpoints/quiz.md) ≥ 80% (12/15)
- [ ] [Exit criteria](../checkpoints/exit-criteria.md) review
- [ ] [Acceptance criteria](../project/acceptance-criteria.md) — all for Path A; [minimum-viable](../project/minimum-viable-week1.md) for Path B
- [ ] Mark Week 1 in [progress.md](../progress.md)

---

### Step 7 — Optional portfolio (~30 min)

- [ ] [week-01-showcase.md](../portfolio/week-01-showcase.md) demo checklist
- [ ] [resume-bullets.md](../portfolio/resume-bullets.md) — pick 2–3 bullets you can defend

---

## Done when

**Path B (minimum):**

- [ ] `pytest -q` green including partial failure + extraction tests
- [ ] `capstone_comparison.json` + `model_comparison_report.md` in work dir
- [ ] Quiz ≥ 80% · exit criteria checked · `progress.md` updated

**Path A (full):**

- [ ] All Path B items
- [ ] UI runs (`uvicorn` + `npm run dev`)
- [ ] All [acceptance criteria](../project/acceptance-criteria.md) checked

---

## What's next

Week 1 complete — proceed to **Week 2** only when [exit criteria](../checkpoints/exit-criteria.md) pass.

Read `prompt.md` at repo root before starting Week 2 generation.
