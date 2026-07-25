# Week 8 Resume Bullets — AI Radar Capstone

> [← Showcase](week-08-showcase.md)

Pick 3–4 strongest; **replace placeholders with your metrics** from artifacts before applying.

---

## Primary capstone bullets

- Architected and shipped **AI Radar**, a production-style AI ecosystem monitor ingesting RSS and GitHub into **pgvector**, orchestrating **LangGraph** agents with **MCP** tools (search, RSS, GitHub), and delivering cited answers via **agentic RAG** with **Redis semantic caching** — cutting repeat query latency by **X%** and cost by **Y%**.

- Built full-stack capstone: **FastAPI** backend, **Next.js** dashboard (feed, trends, agent Q&A), **Celery**-scheduled ingestion and **daily email digest**, **Docker Compose** deployment with Postgres + Redis — **N+ documents** indexed across **M sources**.

- Implemented **RAGAS** evaluation pipeline with **GitHub Actions CI gate** blocking **>5%** faithfulness regression on **10+** golden questions; achieved **0.XX** faithfulness / **0.XX** context precision on held-out set.

- Designed **MCP tool boundary** for web search, RSS, and GitHub APIs with structured tool traces and checkpointed **LangGraph** workflows — enabling resume-after-failure and observable multi-step agent debugging.

---

## Supporting bullets (combine with prior weeks)

- Integrated **hybrid retrieval** (pgvector + keyword RRF) and **semantic cache** (cosine ≥ 0.92) for sub-**500ms** cached agent responses vs **X s** cold path.

- Authored **ADR** comparing agentic vs static RAG; documented tradeoffs for live GitHub data vs ingested corpus in hiring-portfolio repo.

- **Optional:** Deployed AI Radar to **Azure Container Apps** with managed Postgres (pgvector) and Azure Redis — public demo URL.

---

## Tips

| Do | Don't |
|----|-------|
| Quantify: doc count, faithfulness, latency, cache hit % | "Built an AI app" |
| Name stack recruiters search: LangGraph, MCP, RAGAS | List every library |
| Link GitHub + README badge | Broken demo links |

---

## Skills line (optional)

`LangGraph · MCP · Agentic RAG · pgvector · Redis · FastAPI · Next.js · RAGAS · Docker · Celery · OpenAI`

---

## Next

[LinkedIn notes](linkedin-notes.md) · [Showcase](week-08-showcase.md)
