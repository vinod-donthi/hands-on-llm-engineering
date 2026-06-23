# Build Guide — From Labs to Prompt Playground Lite

> Week 1 Project · **Start here on Day 7** · [← Where am I?](../WHERE-AM-I.md) · [Overview](overview.md)

Labs 4–6 had you build **`lab04_backend/`** — a FastAPI app with providers, observability, and compare. The **project** docs describe **`prompt-playground-lite/`** — the same backend plus a Next.js UI. This guide connects the two in plain language.

---

## What problem are we solving?

You have working API code in one folder name and curriculum specs that use another. Without a bridge, Day 7 feels like "read architecture.md and figure it out." This guide tells you **exactly what to do next** based on what is already in your work directory.

---

## What you probably have already (after Day 6)

Check your work dir (`week-01-work/` or `~/ai-learning/week-01-work/`):

| Item | Typical path | Done? |
|------|--------------|-------|
| Lab scripts 1–3 | `lab01_tokenization.py`, etc. | Day 1–3 |
| Backend API | `lab04_backend/app/` | Day 5–6 |
| Compare endpoint | `POST /api/v1/compare` | Lab 5 |
| Resiliency test | `tests/test_compare_partial_failure.py` | Lab 5 |
| Sample compare export | `compare_sample_output.json` | Lab 5 |
| Optional benchmark | `benchmark_summary.csv` | Lab 6 |

| Item | Typical path | Often missing on Day 7 |
|------|--------------|------------------------|
| Extract endpoint | `POST /api/v1/extract` | Yes — add today |
| Extraction tests | `tests/test_extraction_ladder.py` | Yes |
| Full monorepo layout | `prompt-playground-lite/` | Yes — migrate or scaffold |
| Next.js UI | `prompt-playground-lite/frontend/` | Yes — Path A only |
| Capstone files | `capstone_comparison.json`, `model_comparison_report.md` | Yes — Day 7 |

---

## Two paths for Day 7

### Path A — Full Prompt Playground Lite (portfolio + all acceptance criteria)

**Best if:** you want the demo UI, sliders, and client export for interviews.

1. **Scaffold the monorepo** (copies your backend + minimal frontend):

   ```bash
   cd Learning/week-01
   chmod +x scripts/scaffold-playground-lite.sh
   ./scripts/scaffold-playground-lite.sh
   # or: ./scripts/scaffold-playground-lite.sh ~/ai-learning/week-01-work
   ```

2. **Add missing backend pieces** in `prompt-playground-lite/backend/`:
   - `app/services/extraction.py` + `POST /api/v1/extract` ([backend.md](backend.md))
   - `tests/test_extraction_ladder.py`

3. **Wire the frontend** ([frontend.md](frontend.md)) — start with `page.tsx` + compare fetch; add sliders last.

4. **Run capstone** using [CAPSTONE-PROMPTS.md](CAPSTONE-PROMPTS.md).

5. Check [acceptance-criteria.md](acceptance-criteria.md).

### Path B — Backend + export capstone (minimum viable Week 1)

**Best if:** time is tight; you will add UI in Week 2.

1. Stay in **`lab04_backend/`** — no migration required.
2. Add `/api/v1/extract` + tests (same as Path A step 2).
3. Run capstone via script or curl; export JSON manually ([CAPSTONE-PROMPTS.md](CAPSTONE-PROMPTS.md)).
4. Write `model_comparison_report.md` in work dir root.
5. Pass [minimum-viable-week1.md](minimum-viable-week1.md) gates; note "UI deferred" in report.

Both paths require: compare works, resiliency test green, capstone JSON + report, quiz ≥ 80%.

---

## Migration: `lab04_backend/` → `prompt-playground-lite/backend/`

Manual equivalent of the scaffold script:

```bash
cd week-01-work   # or ~/ai-learning/week-01-work
mkdir -p prompt-playground-lite
cp -R lab04_backend prompt-playground-lite/backend
```

Then from `prompt-playground-lite/backend/`:

```bash
source ../../.venv/bin/activate
uvicorn app.main:app --reload --port 8000
```

Your old `lab04_backend/` can stay as a backup or be removed after you confirm the copy works.

---

## Day 7 build order (recommended)

Do these in order — do not jump to the UI before the backend gaps are closed.

```
1. pytest -q in lab04_backend/          → confirm Lab 5 still green
2. Implement /api/v1/extract            → JSON ladder ([structured-output.md](../theory/structured-output.md))
3. Add test_extraction_ladder.py
4. Run capstone (5 prompts × 2 models)  → CAPSTONE-PROMPTS.md
5. Write model_comparison_report.md
6. (Path A) scaffold + npm install + UI
7. Quiz + exit criteria + progress.md
```

---

## How to run what you have today

**Backend only (no migration):**

```bash
cd week-01-work
source .venv/bin/activate
cd lab04_backend
uvicorn app.main:app --reload --port 8000
```

**Smoke compare:**

```bash
curl -s -X POST http://localhost:8000/api/v1/compare \
  -H "Content-Type: application/json" \
  -d '{
    "model_ids": ["openai/gpt-4o-mini", "ollama/llama3.1:8b"],
    "request": {"prompt": "Say hi in one sentence.", "temperature": 0}
  }' | python3 -m json.tool
```

**Full stack (after scaffold):**

```bash
# terminal 1
cd prompt-playground-lite/backend && uvicorn app.main:app --reload --port 8000

# terminal 2
cd prompt-playground-lite/frontend && npm run dev
```

---

## Map: project doc → your code

| Project doc | What it specifies | Your file |
|-------------|-------------------|-----------|
| [api.md](api.md) | Endpoint contracts | `app/main.py`, `app/schemas.py` |
| [observability.md](observability.md) | 9-field envelope | `app/observability.py`, response models |
| [backend.md](backend.md) | Providers, extraction | `app/providers/`, `app/services/` |
| [frontend.md](frontend.md) | UI components | `frontend/app/page.tsx` (Path A) |
| [evaluation-rubric.md](evaluation-rubric.md) | Scoring dimensions | Capstone JSON + sliders |
| [failure-recovery.md](failure-recovery.md) | Partial failure behavior | `app/services/comparison.py` |

---

## AI engineer takeaway

Week 1 labs teach **API-first** LLM engineering (providers, telemetry, compare). The project adds **product shape** (UI, export, capstone narrative). You are not behind if you only have `lab04_backend/` — you are on the normal lab track. Day 7 closes the gap.

---

## Next

- [Day 7 playbook](../daily/day-07.md)
- [Capstone prompts](CAPSTONE-PROMPTS.md)
- [Minimum viable Week 1](minimum-viable-week1.md)
