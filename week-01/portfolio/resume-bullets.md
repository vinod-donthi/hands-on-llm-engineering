# Resume Bullets — Week 1

> [Showcase](week-01-showcase.md) · [← README](../README.md)

Use after completing the capstone. Quantify where possible.

- Built **Prompt Playground Lite**, a multi-model LLM comparison tool (FastAPI + Next.js) comparing GPT-4o Mini and Llama 3.1 8B with parallel async dispatch and per-model error isolation
- Implemented production-style **observability envelope** (`request_id`, token/cost/latency telemetry) across all LLM API responses
- Designed **JSON reliability ladder** (structured output → JSON mode → validation → single retry) with `parse_status` tracking for extraction pipelines
- Authored **evaluation framework** scoring model outputs on correctness, format, groundedness, and conciseness for benchmark-driven model selection
