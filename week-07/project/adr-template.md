# ADR Template — Advanced AI Studio

> Week 7 Project · Copy to `docs/adr/0001-advanced-ai-studio.md` in work dir

**Architecture Decision Record (ADR)** — documents a significant technical decision with context, options, and consequences.

---

## ADR-0001: Advanced AI Studio — [Track A | Track B]

| Field | Value |
|-------|-------|
| **Status** | Proposed / Accepted / Deprecated |
| **Date** | YYYY-MM-DD |
| **Deciders** | Your name |
| **Consulted** | N/A (solo learning project) |

---

### Context

What problem are you solving? Who are the users? What constraints (cost, latency, compliance, data freshness)?

*Example: Internal support triage — 2K tickets/day, handbook updates monthly, must classify + draft in company tone.*

Link evidence:

- [ ] `decision_matrix.json` (Day 1)
- [ ] `baseline_eval.json` (Day 1)
- [ ] Track-specific eval (Day 2–5)

---

### Decision

We will build **Track [A|B]** for Advanced AI Studio because:

1. *(Primary reason with metric)*
2. *(Secondary reason)*
3. *(Ops / cost reason)*

**In one sentence:** *We chose LoRA fine-tune over agentic RAG because taxonomy is stable and fine-tune reached 94% vs 88% RAG at 1/3 inference cost.*

---

### Options considered

| Option | Pros | Cons | Score (Day 1) |
|--------|------|------|---------------|
| Prompt only | | | |
| RAG / Agentic RAG | | | |
| Fine-tune (LoRA) | | | |
| Bigger model | | | |
| Long context stuff | | | |
| Distilled small model | | | |

---

### Consequences

**Positive:**

- 
- 

**Negative / tradeoffs:**

- 
- 

**Follow-up actions:**

- [ ] Retrain fine-tune quarterly *(Track A)*
- [ ] Re-index corpus on doc upload *(Track B)*
- [ ] Monitor eval drift in CI

---

### Metrics (fill from capstone eval)

| Metric | Baseline (Day 1) | Advanced AI Studio |
|--------|------------------|---------------------|
| Quality (accuracy / faithfulness) | | |
| p95 latency (ms) | | |
| $/1K requests | | |
| Ops complexity (1–5) | | |

Attach: `capstone_eval_report.json`

---

### Diagram

Paste or link Mermaid from [architecture.md](architecture.md).

---

### References

- [Week 7 decision framework](../theory/decision-framework.md)
- Lab artifacts: `finetune_eval_report.json`, `agentic_rag_trace.json`, etc.

---

## How to finalize

1. Copy this file to `~/ai-learning/week-07-work/advanced-ai-studio/docs/adr/0001-advanced-ai-studio.md`
2. Set **Status** to `Accepted` on Day 7
3. Include in portfolio showcase

[← Overview](overview.md)
