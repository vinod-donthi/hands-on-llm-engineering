# Frontend

> Week 1 Project · [Overview](overview.md) · [API](api.md) · [Build guide](BUILD-GUIDE.md)

> **Your code today:** likely **no frontend yet** — Day 7 Path A builds this. Path B skips UI.  
> **Work path:** `week-01-work/prompt-playground-lite/frontend/` after [scaffold](../scripts/scaffold-playground-lite.sh).

---

## What problem are we solving?

The API returns JSON. Humans need a **single page** to type a prompt, pick models, see side-by-side answers, read latency/cost, score quality, and download results for their portfolio.

This doc gives a **minimum viable UI first** — one file that works — then names the components you split out later.

---

## Path B skip

If you chose [minimum-viable-week1.md](minimum-viable-week1.md), you do **not** need this page for Week 2. Run capstone via curl or export scripts instead.

---

## Quick start (after scaffold)

```bash
cd week-01-work/prompt-playground-lite/frontend
npm install
npm run dev
# Open http://localhost:3000
```

Backend must run on :8000:

```bash
cd ../backend && uvicorn app.main:app --reload --port 8000
```

---

## Minimum viable UI (one page)

**Goal:** Compare button works before you build six components.

Put everything in `app/page.tsx` first:

1. Textareas for system + user prompt
2. Checkboxes for `openai/gpt-4o-mini` and `ollama/llama3.1:8b`
3. **Compare** button → `fetch('http://localhost:8000/api/v1/compare', ...)`
4. Render each result: `text`, `latency_ms`, `cost_usd`, `error` (red if set)

**Example fetch (simplified):**

```typescript
const res = await fetch("http://localhost:8000/api/v1/compare", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({
    model_ids: selectedModels,
    request: {
      system_prompt: systemPrompt,
      prompt: userPrompt,
      temperature: 0,
    },
  }),
});
const data = await res.json();
// data.results — array of LLM responses
```

**CORS:** Enable in FastAPI for `http://localhost:3000` during dev:

```python
from fastapi.middleware.cors import CORSMiddleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_methods=["*"],
    allow_headers=["*"],
)
```

Once compare renders, extract components below.

---

## Full components (portfolio-perfect)

| Component | Responsibility |
|-----------|----------------|
| `PromptInput.tsx` | System + user prompt, temperature |
| `ModelSelector.tsx` | GPT-4o Mini, Llama 3.1 8B, optional Mistral |
| `ComparisonGrid.tsx` | Side-by-side results (blocking load) |
| `MetricsBar.tsx` | `request_id`, tokens, cost, latency, error badge |
| `ScorePanel.tsx` | 4 evaluation sliders → composite |
| `ExportButton.tsx` | Client-side JSON download |

---

## Output mode toggle

- `text` — standard completion / compare
- `json` — calls `/api/v1/extract` with ladder (cloud only for reliable schema)

Display `parse_status` and `json_validation_error` when present.

---

## UX for partial failure

When one model in compare fails:

- Other panels render normally
- Failed panel: red border + `error` message
- Do **not** clear successful results

**Example:** Llama times out → GPT panel still shows full text and metrics.

See [failure-recovery.md](failure-recovery.md).

---

## Evaluation sliders

Four sliders 1–5 per [evaluation-rubric.md](evaluation-rubric.md):

- Correctness
- Format compliance
- Groundedness
- Conciseness

Show `composite = average` under sliders. Include scores in export JSON.

---

## Export shape

Download merges:

- `parent_request_id`, per-model `request_id`
- Observability fields from API
- Your manual `scores` + `composite`

Same row shape as `compare_sample_output.json` / `capstone_comparison.json`.

---

## AI engineer takeaway

Build **compare + metrics first**, sliders and polish second. A working one-page demo beats an empty component library.

---

## Next

[architecture.md](architecture.md) · [Day 7 playbook](../daily/day-07.md)
