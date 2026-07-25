# Day 6 — OpenTelemetry + Langfuse

> **You are here:** Day 6 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 5 — Background Queues](day-05.md) |
| **Today's outcome** | RAG request visible in Langfuse with latency, tokens, and retrieval span |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-05-work/` or `~/ai-learning/week-05-work/` |
| **Stop when** | Langfuse trace ID saved to `trace_export.json` |

**Catch-up:** Langfuse `@observe` decorator only; skip full OTEL collector.

---

## Steps

### Step 1 — Theory: Observability (~30 min)

Read [observability.md](../theory/observability.md) — traces vs logs vs metrics, Langfuse spans.

### Step 2 — Lab spec (~10 min)

Read [Lab 6](../labs/lab-06-observability.md) *(optional skip if behind — minimum: Langfuse on one endpoint)*.

### Step 3 — Langfuse setup (~20 min)

Create Langfuse project; add keys to `.env`. Verify with SDK ping.

### Step 4 — Instrument RAG pipeline (~90 min)

- FastAPI OTEL instrumentation (optional OTLP export)
- Langfuse `@observe()` on `rag_answer()` — nested spans: embed, retrieve, generate
- Attach `user_id`, `cache_hit`, `cost_usd` as metadata

### Step 5 — Run trace demo (~45 min)

```bash
python lab06_trace_demo.py
```

One RAG call → export trace ID and span count to `trace_export.json`.

### Step 6 — Deliverable

- [ ] `trace_export.json` with `langfuse_trace_id`, span names, total_latency_ms
- [ ] Screenshot or link to trace in Langfuse UI *(portfolio)*

### Step 7 — Close out (~15 min)

- [ ] Mark Day 6 in [progress.md](../progress.md)

---

## Done when

- [ ] At least one full RAG trace in Langfuse
- [ ] Day 6 row checked in `progress.md`

---

## Tomorrow

**→ [Day 7 — Deploy Capstone](day-07.md)** — start with [scaling-cost-backpressure.md](../theory/scaling-cost-backpressure.md)
