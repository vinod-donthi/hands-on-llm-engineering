# Day 3 — Streaming (SSE)

> **You are here:** Day 3 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 2](day-02.md) |
| **Today's outcome** | End-to-end SSE streaming with TTFT in metrics |
| **Time** | 4h |
| **Work dir** | `week-02-work/` |
| **Stop when** | UI shows tokens arriving; `stream_metrics.json` saved |

---

## Steps

### Step 1 — Theory (~30 min)

Read [streaming.md](../theory/streaming.md) — TTFT, SSE flow, provider differences.

### Step 2 — Lab spec (~10 min)

Read [Lab 3](../labs/lab-03-streaming-sse.md)

### Step 3 — Backend stream endpoint (~90 min)

Add `POST /api/v1/stream` with `EventSourceResponse`. Implement `stream()` on each provider.

### Step 4 — Frontend stream client (~60 min)

Update compare/chat UI to consume SSE; show partial text + metrics bar.

### Step 5 — Capture metrics (~30 min)

```bash
python lab03_stream_benchmark.py
```

### Step 6 — Deliverable

- [ ] Streaming works for at least OpenAI + one other provider
- [ ] `stream_metrics.json` with `ttft_ms`, `total_latency_ms`, `tps` per model

### Step 7 — Close out

- [ ] Mark Day 3 in [progress.md](../progress.md)

---

## Done when

- [ ] Live streaming in UI
- [ ] `stream_metrics.json` in work dir
- [ ] Day 3 checked in `progress.md`

---

## Tomorrow

**→ [Day 4 — Function Calling](day-04.md)** — [function-calling.md](../theory/function-calling.md)
