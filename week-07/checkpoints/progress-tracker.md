# Week 7 Interview Progress Tracker

> [← README](../README.md) · [Exit Criteria](exit-criteria.md)

Rate each **1–5** (1 = couldn't explain, 5 = hire-ready whiteboard).

| # | Topic | 1 | 2 | 3 | 4 | 5 |
|---|-------|---|---|---|---|---|
| 1 | Fine-tune vs RAG vs prompt decision | | | | | |
| 2 | LoRA/PEFT fine-tuning workflow | | | | | |
| 3 | Distillation + small model routing | | | | | |
| 4 | Agentic RAG architecture | | | | | |
| 5 | Long context vs RAG tradeoffs | | | | | |
| 6 | MCP production hardening | | | | | |
| 7 | ADR / architecture documentation | | | | | |

**Target:** ≥ 4 on at least **4/7** rows before Week 8.

---

## Hire-ready checks

- [ ] I can whiteboard agentic RAG loop in 2 minutes
- [ ] I can defend my Track A/B choice with eval numbers
- [ ] I can explain when **not** to fine-tune
- [ ] I can list MCP security controls without notes
- [ ] I have ADR excerpt ready for portfolio

---

## Practice prompts

1. "Support bot — fine-tune or RAG?" → use decision matrix dimensions.
2. "Design agentic RAG for compliance Q&A" → LangGraph nodes + max steps.
3. "MCP server in production" → auth, rate limits, SSRF.
4. "100K-token handbook — stuff or chunk?" → cite Lab 5 pattern.

See [interview/system-design.md](../interview/system-design.md) for full scenarios.
