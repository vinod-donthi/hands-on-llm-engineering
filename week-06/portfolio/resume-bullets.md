# Week 6 Resume Bullets

> Week 6 · [Showcase](week-06-showcase.md)

Pick 2–3 bullets; quantify where possible.

## Technical bullets

- Built **layered LLM eval pipeline** (RAGAS, DeepEval, Promptfoo) with **GitHub Actions CI gate** blocking deploys when RAG faithfulness regressed >5% on 30+ golden Q&A pairs.

- Calibrated **LLM-as-judge** rubrics to **87% agreement** with human labels; implemented **trace regression** baselines detecting retrieval drift before user-facing quality drops.

- Integrated **Langfuse + OpenTelemetry** for eval dashboards tracking latency p95, cost per query, and online faithfulness sampling (2% traffic).

- Automated **Promptfoo red team** suite (12 attack scenarios) for prompt injection and PII exfiltration; blocked release on security failures independent of quality metrics.

- Designed **agent trajectory eval** asserting tool correctness and forbidden-tool guards on multi-step LangGraph workflows.

## Impact-style bullets (adapt numbers)

- Reduced undetected RAG regressions by catching **2 faithfulness failures pre-merge** in first week of CI gate adoption.

- Cut mean time to diagnose bad answers from **hours (log grep)** to **minutes (Langfuse trace drill-down)**.

## Skills line (optional)

`LLM Evaluation · RAGAS · DeepEval · Promptfoo · LLM-as-Judge · CI/CD · Langfuse · OpenTelemetry · Red Teaming`

## Projects section entry

**Eval Pipeline Studio** | Python, FastAPI, RAGAS, DeepEval, Promptfoo, GitHub Actions, Langfuse  
*Week 6 capstone — evaluation pipeline wired into CI with regression gate and observability dashboard.*
