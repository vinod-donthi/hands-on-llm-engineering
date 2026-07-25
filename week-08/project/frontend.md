# AI Radar — Frontend Spec

> Week 8 Capstone · [Architecture](architecture.md) · [API](api.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/frontend/`

**Next.js 14+ App Router** dashboard — read-only product surface over the FastAPI backend. Keep UI clean; the capstone story is the full stack, not pixel-perfect design.

---

## Pages

| Route | Purpose | API |
|-------|---------|-----|
| `/` | Latest feed + trend tags | `GET /api/v1/feed`, `GET /api/v1/trends` |
| `/query` | Agent Q&A with citations | `POST /api/v1/radar/query` |
| `/digest` | Preview last digest | `GET /api/v1/digest/latest` |

---

## Components

| Component | Behavior |
|-----------|----------|
| `FeedList` | Paginated cards: title, source, published_at, category badge |
| `TrendChart` | Simple bar chart — top 5 tags this week (recharts or chart.js) |
| `QueryPanel` | Textarea + submit; loading skeleton; markdown answer |
| `SourceCitations` | Clickable `[title](url)` list below answer |
| `MetricsBar` | Optional: cache hit, latency_ms, cost_usd from API |

---

## API client (`lib/api.ts`)

```typescript
const API_BASE = process.env.NEXT_PUBLIC_API_URL ?? "http://localhost:8000";

export async function radarQuery(query: string) {
  const res = await fetch(`${API_BASE}/api/v1/radar/query`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ query, mode: "agentic" }),
  });
  if (!res.ok) throw new Error(await res.text());
  return res.json();
}
```

---

## Worked UX scenario

User opens `/query`, types *"Any new embedding models this week?"*, clicks Ask.

1. Button shows spinner (~3–8s first time).
2. Answer renders as markdown with 4 citations.
3. Metrics bar: `cache_hit: false`, `cost_usd: 0.02`.
4. User rephrases *"embedding models released recently"* — second request ~200ms, `cache_hit: true`.

---

## Styling guidance

- Tailwind CSS (default Next.js template)
- Dark mode optional — not required
- Mobile-responsive feed list — nice-to-have

---

## Env

```bash
# frontend/.env.local
NEXT_PUBLIC_API_URL=http://localhost:8000
```

In Docker Compose, set to `http://backend:8000` for SSR or proxy via Next.js rewrites.

---

## Acceptance (frontend)

- [ ] Feed renders ≥ 10 items from backend
- [ ] Query page shows answer + citations
- [ ] Error state if backend down (toast or banner)
- [ ] Digest preview page renders HTML safely (`dangerouslySetInnerHTML` with sanitized HTML — use `isomorphic-dompurify` optional)

---

## Next

[API](api.md) · [Phase 3 Product](phases/phase-3-product.md)
