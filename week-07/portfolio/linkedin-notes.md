# Week 7 LinkedIn Notes

> [← README](../README.md) · Post after capstone demo

## Post template (short)

Finished Week 7 of my AI engineering curriculum — built **Advanced AI Studio**.

The hard part wasn't coding — it was choosing the right lever:
- prompt engineering
- RAG
- fine-tuning (LoRA)
- bigger model

I scored each option on quality, cost, latency, and ops — then shipped [Track A: fine-tuned triage | Track B: agentic RAG] with an Architecture Decision Record to prove why.

Key result: **[one metric — e.g. 65% → 88% faithfulness on multi-hop Q&A]**

Stack: FastAPI, LangGraph, OpenAI fine-tune, Qdrant, MCP

Next: Week 8 capstone — AI Radar 🔭

#AIEngineering #LLM #RAG #MCP

---

## Comment-ready FAQ

**Why not just use GPT-4?**  
Cost and latency at scale — we measured $/1K requests and p95 on a golden set.

**What's agentic RAG?**  
Agent loops retrieval until context is good enough — needed for multi-hop policy questions.

**What's an ADR?**  
Architecture Decision Record — context, options, decision, metrics. Interview gold.

---

## Hashtags (pick 3–5)

`#MachineLearning` `#GenerativeAI` `#SystemDesign` `#FineTuning` `#LangGraph`

[Resume bullets](resume-bullets.md)
