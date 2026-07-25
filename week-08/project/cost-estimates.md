# AI Radar — Cost Estimates

> Week 8 Capstone · [Architecture](architecture.md)

Numbers below are **illustrative** for a 7-day capstone with moderate usage. Track actuals in `progress.md`.

---

## OpenAI (primary variable cost)

| Operation | Model | Volume (week) | Unit cost | Est. total |
|-----------|-------|---------------|-----------|------------|
| Embeddings | text-embedding-3-small | 500 docs × 4 chunks ≈ 2M tokens | $0.02 / 1M | **$0.04** |
| Ingestion summaries | gpt-4o-mini | 50 docs × 400 out | ~$0.15 / 1M out | **$0.03** |
| Agent queries (dev) | gpt-4o-mini | 150 queries × 3K in + 800 out | blended | **$8–15** |
| Digest generation | gpt-4o-mini | 7 digests × 2K out | — | **$0.50** |
| RAGAS eval runs | gpt-4o-mini | 10 × 10 samples × 2 runs | — | **$2–5** |

**OpenAI subtotal:** **$10–22**

---

## Search API

| Provider | Free tier | Capstone usage | Est. |
|----------|-----------|----------------|------|
| Tavily | 1K searches/mo | ~50 agent searches | **$0–2** |
| Brave Search API | tiered | alternative | **$0–3** |

---

## GitHub API

Authenticated: **5,000 req/hour** — capstone stays within free tier (`$0`).

---

## Email

| Provider | Capstone | Est. |
|----------|----------|------|
| Resend | 100 emails/day free | **$0** |
| SMTP (Gmail app password) | 7 digests | **$0** |

---

## Infrastructure

| Environment | Cost |
|-------------|------|
| Local Docker | **$0** |
| Azure optional (1 week) | **$5–15** prorated if torn down quickly |
| Azure optional (left running) | **$45–70/mo** — see [azure.md](azure.md) |

---

## Redis + Postgres

Local Docker: **$0**. Managed Azure adds cost only if deployed.

---

## Cost control levers

| Lever | Savings |
|-------|---------|
| Semantic cache (Day 5) | 30–60% on repeated dashboard queries |
| `rag_only` mode in CI eval | ~50% vs full agentic eval |
| Cap agent loops at 3 | Prevents runaway tool + LLM calls |
| `DAILY_BUDGET_USD=10` | Hard stop in middleware |
| Smaller embedding model | Already using `-3-small` |

---

## Numeric walkthrough — one agent query

```
User query: 40 tokens in
Plan node: 200 tokens in / 80 out
RAG retrieve context: 1,200 tokens in context
Synthesize: 1,400 in / 350 out
Total ≈ 2,070 tokens — at gpt-4o-mini rates ≈ $0.015–0.025
```

Second similar query with cache hit: **~$0.0001** (embedding only).

---

## Weekly total

| Category | Low | High |
|----------|-----|------|
| OpenAI | $10 | $22 |
| Search | $0 | $5 |
| Email | $0 | $2 |
| Azure (optional) | $0 | $15 |
| **Total** | **$15** | **$35** |

---

## AI engineer takeaway

Interviewers ask *"What did this cost to run?"* — cite cache hit rate and eval frequency, not just token counts.

---

## Next

[GitHub README spec](github-readme-spec.md)
