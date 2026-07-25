# Week 5 LinkedIn Notes

> [← Resume Bullets](resume-bullets.md)

## Post draft (short)

**Title idea:** Week 5 of my AI engineering journey — shipping production RAG

This week I hardened a RAG prototype into a **Production AI Stack**:

→ Docker Compose (API + Redis + background workers)  
→ Semantic cache — paraphrased questions hit without a new LLM call  
→ Langfuse traces for every retrieval + generation step  
→ Rate limits and cost caps under load

The difference between a demo and production is not the model — it's caching, queues, observability, and knowing when to say 503.

#AIEngineering #RAG #FastAPI #LLM #ProductionAI

---

## Profile skills to add

- FastAPI
- Docker / Docker Compose
- Redis
- OpenTelemetry
- Langfuse
- Azure Container Apps *(if deployed)*

---

## Featured section

1. GitHub repo link — `production-ai-stack`
2. Architecture diagram PNG from showcase
3. Optional: 30s screen recording — Compose up → query → Langfuse trace

---

## Connection outreach note (DM template)

Hi [Name] — I'm building production LLM systems (RAG + Redis semantic cache + Langfuse). Would love to compare notes on [caching / observability / Azure deploy] if you have 15 min.

Keep specific to their background.
