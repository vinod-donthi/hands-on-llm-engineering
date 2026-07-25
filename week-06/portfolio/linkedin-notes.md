# Week 6 LinkedIn Notes

> Week 6 · [Showcase](week-06-showcase.md)

## Post template (adapt before publishing)

---

**Shipped: Eval Pipeline Studio**

The hardest part of LLM products isn't the demo — it's knowing you didn't make things worse with yesterday's prompt change.

This week I built a layered eval pipeline for RAG systems:

→ **DeepEval** pytest on every PR (90 seconds)  
→ **Promptfoo** when prompts change  
→ **RAGAS** full golden set on merge  
→ **CI gate** blocks >5% faithfulness regression  
→ **Langfuse** for traces + online drift  

Also ran **red team** tests for injection/PII and **agent trajectory** eval for tool-correctness.

Key lesson: **faithfulness can look fine while retrieval silently drifts** — trace regression baselines catch that.

Stack: RAGAS · DeepEval · Promptfoo · GitHub Actions · Langfuse · OpenTelemetry

[#AIEngineering] [#LLM] [#RAG] [#MLOps]

---

## Profile skills to add

- LLM Evaluation
- RAGAS
- CI/CD for ML
- Langfuse
- Prompt Engineering

## Featured section

Link to GitHub repo + 1 screenshot (Langfuse dashboard or CI gate pass/fail).

## Connection outreach (optional)

*"I'm building eval pipelines for LLM apps — would love to compare notes on CI gates vs online sampling tradeoffs."*

## Don't

- Claim "100% hallucination-free"
- Post API keys or full golden datasets with sensitive doc content
- Overstate red team as "pen test certified"
