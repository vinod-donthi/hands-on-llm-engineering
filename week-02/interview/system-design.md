# System Design Interview Questions — Week 2

> Week 2 · [← README](../README.md)

**SD1: Design a model routing service for a multi-tenant SaaS app.**

> **Discuss:** Registry of models with capabilities and price. Router by task type + tenant tier. Fallback chain on 429/503. Per-tenant budget. Cache embeddings separately (Week 3). Audit log in Postgres. No API keys in frontend.

---

**SD2: Design real-time chat with streaming across multiple LLM providers.**

> **Discuss:** SSE gateway. Provider adapters normalize chunks. TTFT metrics to observability backend. Connection management, cancel on disconnect. Rate limit per user. History in DB; trim before send. Guardrails pre/post.

---

**SD3: Design a cost incident prevention system for LLM workloads.**

> **Discuss:** Per-request estimate before call. Hard caps per user/day. Anomaly detection on spend rate. Alert at 80% budget. Kill switch. Dashboard from Postgres runs table. Cheap model default; escalation requires policy.

---

**SD4: Design function-calling for a customer support agent (preview of Week 4).**

> **Discuss:** Small tool catalog per session. Pydantic schemas. Idempotent tools. Human approval for destructive actions. Max tool rounds. Trace every invocation. Timeouts. Separate read vs write tools.
