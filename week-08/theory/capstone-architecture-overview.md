# Capstone Architecture Overview

> Week 8 Theory · Day 1 · [← README](../README.md) · Next: [ingestion-scheduling](ingestion-scheduling.md)

AI Radar is your **final integration project** — not a new tutorial app. It connects ingestion, vector search, agents, a web UI, email, and evaluation into one system you can demo to hiring managers.

---

## What problem are we solving?

Individual weeks taught isolated skills (RAG in Week 3, agents in Week 4). The capstone answers: *"Can you wire these into one maintainable product with eval gates and deployment?"*

### Worked scenario

A staff engineer asks: *"Walk me through your AI monitoring system."* You open one architecture diagram, explain data flow from RSS → pgvector → LangGraph agent → dashboard, cite your RAGAS faithfulness score, and show the CI badge that blocks regressions.

---

## Concepts

### System boundaries

| In scope (Week 8) | Out of scope (optional) |
|-------------------|-------------------------|
| RSS + GitHub ingestion | Full browser crawl farm |
| Agentic RAG + MCP tools | Custom fine-tuned model |
| Next.js dashboard | Mobile native app |
| Daily email digest | Slack bot (stretch) |
| RAGAS + CI gate | Full MLOps platform |

### Four layers

1. **Collect** — scheduled fetchers write normalized documents
2. **Remember** — pgvector stores searchable chunks
3. **Reason** — LangGraph agent + MCP + agentic RAG
4. **Deliver** — dashboard, email, eval CI

See [project/architecture.md](../project/architecture.md) diagram.

### Four implementation phases

| Phase | Days | You prove |
|-------|------|-----------|
| Foundation | 1–2 | Data pipeline works |
| Intelligence | 3–4 | Agent answers with citations |
| Product | 5–6 | Humans consume output |
| Production | 7 | Quality is measured + deployable |

---

## Tradeoffs

| Choice | Benefit | Cost |
|--------|---------|------|
| Monorepo `ai-radar/` | One clone for interviewers | Larger repo |
| Postgres + pgvector | Single DB ops | Not highest QPS vector scale |
| gpt-4o-mini default | Cost control | May miss nuance vs larger model |

---

## Best practices

- Draw the diagram before coding Day 1
- Commit ADRs for non-obvious decisions (agentic RAG on Day 4)
- Keep secrets in `.env` only — artifacts must be scrubbed

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Building UI before corpus exists | Phase order exists for a reason |
| Skipping eval on Day 7 | "Production-grade" includes metrics |
| Copy-paste week code without interfaces | Define module boundaries first |

---

## Checkpoint

1. Name the four capstone phases and what each delivers.
2. Why is pgvector in Postgres instead of a separate vector DB for this project?
3. What artifact proves Phase 2 is complete?
4. Where does semantic cache sit in the query path?
5. What CI gate metric would block a bad PR?

---

## Go deeper

| Resource | Why |
|----------|-----|
| [LangGraph docs](https://langchain-ai.github.io/langgraph/) | Graph patterns |
| [MCP specification](https://modelcontextprotocol.io/) | Tool protocol |
| [project/phases/](../project/phases/) | Day-by-day build spec |

---

## Next

[ingestion-scheduling.md](ingestion-scheduling.md) → [Lab 1](../labs/lab-01-ingestion-smoke.md) → mark [Day 1](../daily/day-01.md) done → [Day 2](../daily/day-02.md)
