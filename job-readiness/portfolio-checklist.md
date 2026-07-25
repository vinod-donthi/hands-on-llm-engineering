# Portfolio Checklist — 8-Week AI Engineering Program

> [← Job Readiness](README.md) · Tick when deliverable exists in work dir + is demo-ready

---

## Week 1 — Prompt Playground Lite

- [ ] `capstone_comparison.json` — 5 prompts × 2+ models
- [ ] `model_comparison_report.md` with cost/latency/quality notes
- [ ] `pytest` green on compare + extraction tests
- [ ] Optional: frontend compare UI running

**Showcase doc:** [week-01/portfolio/week-01-showcase.md](../week-01/portfolio/week-01-showcase.md)

---

## Week 2 — Model Benchmark Studio

- [ ] Three providers (OpenAI, Anthropic, Ollama) behind one interface
- [ ] SSE streaming with TTFT logged
- [ ] Function calling with ≥ 1 tool
- [ ] `benchmark_report.json` + `benchmark_summary.md`
- [ ] Docker Compose boots stack (optional Lab 6)

**Showcase doc:** [week-02/portfolio/week-02-showcase.md](../week-02/portfolio/week-02-showcase.md)

---

## Week 3 — Doc Q&A Studio

- [ ] Hybrid retrieval (BM25 + dense + RRF)
- [ ] Reranking stage documented
- [ ] `rag_eval_report.json` — golden set ≥ 50 pairs, faithfulness ≥ 0.75
- [ ] Citations in answers

**Showcase doc:** [week-03/portfolio/week-03-showcase.md](../week-03/portfolio/week-03-showcase.md)

---

## Week 4 — Research Agent Studio

- [ ] LangGraph agent with ≥ 2 tools
- [ ] Custom MCP server
- [ ] HITL interrupt on high-risk action
- [ ] Checkpoint resume demonstrated

**Showcase doc:** [week-04/portfolio/week-04-showcase.md](../week-04/portfolio/week-04-showcase.md)

---

## Week 5 — Production AI Stack

- [ ] Docker Compose: api + redis + worker
- [ ] Semantic cache hit rate measured
- [ ] OpenTelemetry or Langfuse trace export
- [ ] `deploy_checklist.md` complete

**Showcase doc:** [week-05/portfolio/week-05-showcase.md](../week-05/portfolio/week-05-showcase.md)

---

## Week 6 — Eval Pipeline Studio

- [ ] RAGAS baseline on golden set
- [ ] DeepEval pytest suite in CI
- [ ] Promptfoo config for prompt regression
- [ ] CI gate blocks > 5% regression

**Showcase doc:** [week-06/portfolio/week-06-showcase.md](../week-06/portfolio/week-06-showcase.md)

---

## Week 7 — Advanced AI Studio

- [ ] Track A (LoRA fine-tune) **or** Track B (agentic RAG module)
- [ ] ADR documenting build vs RAG vs fine-tune decision
- [ ] Before/after eval comparison

**Showcase doc:** [week-07/portfolio/week-07-showcase.md](../week-07/portfolio/week-07-showcase.md)

---

## Week 8 — AI Radar (Capstone)

- [ ] Ingestion pipeline (RSS + ≥ 1 other source)
- [ ] pgvector corpus + agentic RAG query
- [ ] LangGraph + MCP tools
- [ ] Next.js dashboard
- [ ] Daily email digest
- [ ] Eval CI gate
- [ ] Public GitHub README with architecture diagram
- [ ] Docker `compose up` works

**Showcase doc:** [week-08/portfolio/week-08-showcase.md](../week-08/portfolio/week-08-showcase.md)

---

## Interview-ready minimum (if time-constrained)

Ship these four and you can credibly interview for AI Engineer roles:

1. **Doc Q&A Studio** (RAG + eval)
2. **Research Agent Studio** (agents + MCP)
3. **Eval Pipeline Studio** (production maturity signal)
4. **AI Radar** (capstone narrative)
