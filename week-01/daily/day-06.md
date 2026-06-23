# Day 6 — Compare, Benchmark, RSS

> **You are here:** Day 6 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 5](day-05.md) — Lab 4 backend |
| **Today's outcome** | Multi-model compare with partial failure handling; optional local benchmark; UI scaffold |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-01-work/` |
| **Stop when** | `compare_sample_output.json` exists; resiliency test passes |

**Tomorrow:** [Day 7](day-07.md) starts with [BUILD-GUIDE](../project/BUILD-GUIDE.md) — not the raw project folder.

---

## Steps

### Step 1 — Theory: RSS primer (~20 min)

Read [rss-ingestion-primer.md](../theory/rss-ingestion-primer.md)

- Optional: fetch 5 arXiv items → `rss_sample.json`

### Step 2 — Lab 5 spec (~10 min)

Read [Lab 5](../labs/lab-05-model-comparison.md) + [evaluation rubric](../project/evaluation-rubric.md)

### Step 3 — Implement compare (~2h)

- [ ] `POST /api/v1/compare` with error isolation
- [ ] `test_compare_partial_failure` passes
- [ ] `compare_sample_output.json` with manual eval scores

### Step 4 — Lab 6 optional (~60 min)

[Lab 6](../labs/lab-06-local-benchmark.md) → `benchmark_summary.csv` — **skip if behind**

### Step 5 — UI scaffold (optional — defer to Day 7 if behind)

**Option A — automated scaffold (recommended):**

```bash
cd Learning/week-01
chmod +x scripts/scaffold-playground-lite.sh
./scripts/scaffold-playground-lite.sh
cd week-01-work/prompt-playground-lite/frontend && npm install && npm run dev
```

**Option B — skip UI today:** Day 7 [BUILD-GUIDE](../project/BUILD-GUIDE.md) Path B uses backend + capstone export only.

UI details: [project/frontend.md](../project/frontend.md) (start with one-page MVP in `page.tsx`)

### Step 6 — Close out

- [ ] Mark Day 6 + Labs 5 (and 6 if done) in [progress.md](../progress.md)

---

## Done when

- [ ] `compare_sample_output.json` in work dir
- [ ] Resiliency test green
- [ ] Day 6 row checked in `progress.md`

---

## Tomorrow

**→ [Day 7 — Playground Lite + Capstone](day-07.md)** — read [BUILD-GUIDE](../project/BUILD-GUIDE.md) first
