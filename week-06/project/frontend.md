# Eval Pipeline Studio — Frontend (Dashboard)

> Week 6 Project · [Overview](overview.md) · [API](api.md)

> **Work dir:** `~/ai-learning/week-06-work/eval-pipeline-studio/frontend/`

Minimal dashboard for Day 7 capstone — not a design contest. Shows eval health at a glance.

## Pages

| Page | Content |
|------|---------|
| **Overview** | Latest faithfulness, pass/fail badge, last run timestamp |
| **Trends** | Line chart: faithfulness + latency p95 (last 5–10 runs) |
| **Reports** | Table of `reports/*.json` with download links |
| **Langfuse** | External link to Langfuse project |

## Alternative (acceptable)

Skip custom frontend — use **Langfuse built-in dashboard** + export `dashboard_snapshot.json`:

```bash
python scripts/export_dashboard_snapshot.py --out reports/dashboard_snapshot.json
```

Exit criteria accept either approach.

## Overview wireframe (if building UI)

```
┌─────────────────────────────────────────────────┐
│ Eval Pipeline Studio          [Run Fast Eval]   │
├─────────────────────────────────────────────────┤
│ Faithfulness: 0.79  ▲ +0.01   CI: PASS          │
│ Latency p95:  1.2s            Cost/run: $1.40   │
│ Golden set:   32 pairs        Baseline: 0.78    │
├─────────────────────────────────────────────────┤
│ [Faithfulness trend chart — 7 days]               │
├─────────────────────────────────────────────────┤
│ Recent reports                                  │
│  full_eval_report.json    2026-07-25  PASS      │
│  promptfoo_results.json   2026-07-24  9/10      │
└─────────────────────────────────────────────────┘
```

## Tech stack (suggested)

- Vite + React (match Week 2–3 pattern) **or** plain HTML + fetch
- Chart: recharts or chart.js
- Poll `GET /api/v1/eval/status` every 30s during run

## Run

```bash
cd frontend && npm install && npm run dev   # port 5176
```

Proxy API to `localhost:8006`.

## Acceptance (frontend)

- [ ] Shows latest faithfulness and CI pass/fail
- [ ] Links to Langfuse or embeds snapshot JSON summary
- [ ] "Run eval" triggers POST `/api/v1/eval/run`

## Next

→ [api.md](api.md) · [acceptance-criteria.md](acceptance-criteria.md)
