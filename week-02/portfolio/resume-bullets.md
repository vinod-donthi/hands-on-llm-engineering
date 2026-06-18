# Week 2 Resume Bullets

> [← Showcase](week-02-showcase.md)

Pick 2–3; quantify where possible.

- Built **Model Benchmark Studio** — unified OpenAI, Anthropic, and Ollama providers with YAML registry, SSE streaming, and automated latency/cost/quality benchmarks across 15+ model-prompt pairs.

- Implemented **multi-provider LLM abstraction layer** with normalized observability (TTFT, token usage, USD cost) and partial-failure resiliency for parallel model comparison.

- Designed **context budget middleware** and **cost guardrails** (per-request and daily caps) reducing API spend risk for high-volume LLM workloads.

- Integrated **function calling** with Pydantic-validated tool schemas and cross-provider JSON extraction ladder with `parse_status` telemetry.

- Deployed local stack via **Docker Compose** with **PostgreSQL** run history for LLM request auditing and cost attribution.

**Tips:** Replace placeholder counts with your actual `benchmark_report.json` numbers before sending applications.
