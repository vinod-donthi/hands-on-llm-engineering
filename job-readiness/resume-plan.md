# AI Engineer Resume Plan

> [← Job Readiness](README.md) · Complete after Week 4; finalize after Week 8

Your resume should prove you **ship production-minded AI systems**, not that you completed tutorials.

---

## Structure (1–2 pages)

| Section | Content |
|---------|---------|
| **Headline** | "AI Engineer" or "Senior Software Engineer → AI/LLM Systems" |
| **Summary** | 3 lines: years of SWE + what you built in this program + target role |
| **Skills** | Grouped: LLM APIs, RAG, Agents (LangGraph/MCP), Eval (RAGAS/DeepEval), Production (FastAPI/Docker/Redis/Azure) |
| **Experience** | Existing roles — reframe bullets with AI impact where honest |
| **Projects** | 3–4 strongest from this curriculum (see below) |
| **Education / Certs** | As applicable |

---

## Project bullets to draft (from curriculum)

Pull exact metrics from your work dir deliverables. Template pattern:

```
[Project Name] — [one-line what it does]
• Built [X] using [LangGraph / hybrid RAG / MCP] serving [N users / docs / queries]
• Achieved [faithfulness ≥ 0.75 / TTFT < 200ms / cache hit rate X%] via [technique]
• Deployed on [Docker / Azure] with [OpenTelemetry / CI eval gate / Redis semantic cache]
```

### Priority order for resume

1. **AI Radar** (Week 8) — capstone; lead with this once complete
2. **Research Agent Studio** (Week 4) — agents + MCP + HITL
3. **Doc Q&A Studio** (Week 3) — hybrid RAG + RAGAS eval
4. **Eval Pipeline Studio** (Week 6) — CI eval gates (shows maturity)
5. **Model Benchmark Studio** (Week 2) — multi-provider abstraction

Week 1 Prompt Playground Lite supports the story but rarely needs its own bullet if space is tight.

---

## Reframing existing SWE experience

| Old framing | AI-aware reframing (only if true) |
|-------------|-----------------------------------|
| "Built REST APIs" | "Built FastAPI services with observability and rate limiting" |
| "Deployed to Kubernetes" | "Deployed containerized services to AKS with health probes and HPA" |
| "Data pipeline" | "Built ingestion pipelines feeding downstream analytics / search indexes" |

Do not claim LLM production experience you do not have.

---

## GitHub hygiene

- [ ] Public repo for capstone (AI Radar) with strong README per [week-08/project/github-readme-spec.md](../week-08/project/github-readme-spec.md)
- [ ] No secrets in git history
- [ ] Pin dependencies; include `docker compose up` instructions
- [ ] Link repo from resume and LinkedIn

---

## Checkpoint

Before applying: can you explain **one architecture diagram** from memory for each project on your resume? If not, revisit that week's theory before interviewing.
