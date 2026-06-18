# Frontend

> Week 2 Project · [API](api.md)

Extend Week 1 single-page UI with streaming and history.

## New components

| Component | Purpose |
|-----------|---------|
| `StreamPanel.tsx` | Consumes SSE; shows partial output |
| `RunHistory.tsx` | Lists last 20 runs from `GET /api/v1/runs` |
| `ToolChat.tsx` | Optional — tool demo on Day 4 |
| `BenchmarkButton.tsx` | Triggers CLI or future API job |

## Streaming client (`lib/stream.ts`)

```typescript
export async function streamCompletion(
  body: StreamRequest,
  onToken: (text: string) => void,
  onDone: (metrics: StreamMetrics) => void,
): Promise<void> {
  const res = await fetch("/api/v1/stream", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  const reader = res.body!.getReader();
  // parse SSE frames: event + data lines
}
```

Use Next.js rewrite to `localhost:8000` in dev (same as Week 1).

## Metrics bar (extended)

Show: `request_id`, `ttft_ms`, `latency_ms`, `tokens`, `cost_usd`, `model_id`, `parse_status` (JSON mode).

## UX notes

- Toggle **Stream** vs **Complete** for benchmarks (non-stream for clean usage stats).
- Show trim warning if API returns `trimmed_messages_count > 0`.
- Disable submit when daily budget exceeded (if API returns 429).
