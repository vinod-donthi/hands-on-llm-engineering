# 30 Interview Questions — AI Engineering (Cross-Week)

> [← Job Readiness](README.md) · Use with [mock-interview-rubric.md](mock-interview-rubric.md)

Answer from your **built projects**, not textbook memorization.

---

## Foundations (Weeks 1–2)

**Q1.** Walk me through what happens from prompt submit to first token — what is prefill vs decode?

**Q2.** When would you use temperature 0 vs 0.7? Give a task example for each.

**Q3.** How do you prevent a 120K-token PDF from blowing your context budget?

**Q4.** Compare JSON mode, structured outputs, and a parse-retry ladder — when do you use each?

**Q5.** Design a multi-provider abstraction layer. What interface methods are non-negotiable?

**Q6.** What is TTFT and why log it separately from total latency?

---

## RAG (Week 3)

**Q7.** Your RAG system returns wrong answers — walk me through your debug checklist.

**Q8.** Explain hybrid search with RRF. Why not average BM25 and cosine scores directly?

**Q9.** When do you add a reranker? What latency tradeoff do you accept?

**Q10.** What RAGAS metrics would you gate in CI? What thresholds?

**Q11.** Design a document Q&A system for 10M PDF pages. Indexing vs query architecture.

**Q12.** Parent-child chunking — what problem does it solve?

---

## Agents (Week 4)

**Q13.** Agent vs chain vs workflow — how do you decide?

**Q14.** Explain the ReAct loop. Who executes tools — the model or your code?

**Q15.** LangGraph vs OpenAI Agents SDK — when would you pick each?

**Q16.** What is MCP and why not hardcode every tool in your agent?

**Q17.** How do you implement human-in-the-loop without blocking the entire queue?

**Q18.** Agent crashed mid-run — how does checkpointing help? What must be idempotent?

---

## Production (Week 5)

**Q19.** Design semantic caching for a RAG API. Cache key? Invalidation?

**Q20.** Rate limiting: token bucket vs sliding window for LLM APIs?

**Q21.** What spans do you emit in an OpenTelemetry trace for an agent run?

**Q22.** How do you deploy an AI service on Azure with zero secrets in the container image?

---

## Evaluation (Week 6)

**Q23.** Why can't traditional unit tests alone validate LLM apps?

**Q24.** Compare RAGAS, DeepEval, and Promptfoo — one sentence each on purpose.

**Q25.** LLM-as-judge — how do you detect judge bias?

**Q26.** A PR drops faithfulness 8% on golden set — merge or block? What investigation steps?

**Q27.** How do you eval multi-step agent trajectories, not just final output?

---

## Advanced + Capstone (Weeks 7–8)

**Q28.** Fine-tune vs RAG vs bigger model — decision framework with one example each.

**Q29.** Agentic RAG vs static RAG pipeline — tradeoffs?

**Q30.** Whiteboard **AI Radar**: ingestion → index → agent query → digest → eval CI. 15 minutes.

---

## Per-week deep dives

For more questions, see each week's `interview/` folder:

- [week-01/interview/](../week-01/interview/)
- [week-02/interview/](../week-02/interview/)
- … through [week-08/interview/](../week-08/interview/)
