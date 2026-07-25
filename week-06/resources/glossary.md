# Week 6 Glossary

> Week 6 · [Reading List](reading-list.md) · [References](references.md)

| Term | Definition |
|------|------------|
| **Offline eval** | Testing on a fixed golden dataset before deploy; runs in CI. |
| **Online eval** | Sampling live production traffic for quality scores; detects drift. |
| **Golden dataset** | Curated question/answer pairs with verified ground truth from source docs. |
| **RAGAS** | Retrieval Augmented Generation Assessment — RAG metrics via LLM judges. |
| **Faithfulness** | RAGAS metric: is the answer supported by retrieved context? |
| **Context recall** | RAGAS metric: was ground-truth information retrieved? |
| **Context precision** | RAGAS metric: are retrieved chunks relevant (low noise)? |
| **DeepEval** | Python framework for LLM eval as pytest tests with thresholds. |
| **GEval** | DeepEval custom metric defined by plain-English criteria rubric. |
| **Promptfoo** | CLI tool for prompt regression, model comparison, red teaming. |
| **Layered eval** | Stacking fast cheap checks (DeepEval) before slow thorough checks (RAGAS). |
| **Eval gate** | CI job that blocks merge when metrics regress beyond threshold. |
| **Baseline (eval)** | Pinned reference score; regressions measured against it. |
| **Regression floor** | Minimum allowed score: baseline × (1 − max_drop%). |
| **LLM-as-judge** | Using an LLM to score another model's output against a rubric. |
| **Pointwise judge** | Scores one output 0–1; used in CI thresholds. |
| **Pairwise judge** | Picks better of two outputs; used for A/B selection. |
| **Judge calibration** | Tuning rubric until judge agrees with human labels (≥80%). |
| **Trace regression** | Comparing request span trees vs baseline to detect behavior drift. |
| **Golden trace** | Baseline span snapshot (chunk IDs, tools, latency) for one golden ID. |
| **Red teaming** | Adversarial testing — injection, jailbreak, PII exfil. |
| **Trajectory eval** | Evaluating agent tool sequence, not just final answer. |
| **Tool correctness** | Agent called expected tools with expected args. |
| **Langfuse** | LLM observability platform — traces, scores, eval dashboard. |
| **LangSmith** | LangChain tracing alternative to Langfuse. Optional Week 6. |
| **OpenTelemetry (OTel)** | Standard for distributed tracing; exports spans to Langfuse. |
| **Faithfulness drift** | Online scores trending down while offline CI still passes. |
| **Eval Pipeline Studio** | Week 6 capstone — layered eval + CI + dashboard. |

## Cross-week terms

| Term | Week | Link |
|------|------|------|
| Hybrid search + RRF | 3 | [hybrid-search-rrf.md](../../week-03/theory/hybrid-search-rrf.md) |
| Guardrails | 2 | [guardrails.md](../../week-02/theory/guardrails.md) |
| OpenTelemetry primer | 5 | [observability.md](../../week-05/theory/observability.md) |
| Agent tools | 4 | [Week 4 README](../../week-04/README.md) |
