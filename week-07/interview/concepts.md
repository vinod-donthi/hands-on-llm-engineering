# Week 7 Interview — Concepts

> [← README](../README.md) · [System Design](system-design.md) · [Cheat Sheet](cheat-sheet.md)

## Core questions

### Decision framework

**Q: When do you fine-tune instead of RAG?**  
A: Stable domain knowledge, locked behavior/format, high volume, eval shows fine-tune beats RAG on *behavior* tasks. Pair with RAG if any fresh facts needed.

**Q: When is a bigger model enough?**  
A: Low QPS pilot, need highest quality fast, budget allows. Still measure before fine-tune investment.

### LoRA / PEFT

**Q: What is LoRA?**  
A: Trains small low-rank adapters on frozen base — cheap fine-tune, swappable adapters.

**Q: What shouldn't you fine-tune?**  
A: Frequently changing facts, one-off demos, tasks solvable with prompt + RAG.

### Distillation

**Q: Why distill?**  
A: Cut latency and cost at scale — student mimics teacher on your task distribution with fallback.

### Agentic RAG

**Q: How differs from classic RAG?**  
A: Agent loops retrieve → grade → maybe rewrite query until context sufficient or max steps.

**Q: Failure modes?**  
A: Runaway loops, grader always pass, cost explosion — cap steps, log traces.

### Long context vs RAG

**Q: When stuff full doc?**  
A: Single-doc holistic summary, low QPS, doc fits budget. Measure needle tests.

### MCP production

**Q: What's different from dev MCP?**  
A: Auth, rate limits, SSRF protection, health checks, secrets server-side only.

---

## Follow-ups interviewers ask

- "Show me your eval numbers." → Day 1 baseline + capstone report.
- "Write an ADR summary." → Context, decision, consequences, metrics.
- "Cost at 1M requests?" → Use $/1K from distillation or fine-tune benchmarks.

[← Cheat Sheet](cheat-sheet.md)
