# Week 7 Theory Index

> **Map only — not a reading list.** Follow each day's [playbook](../daily/README.md) for order.

| Day | Read in order | Lab |
|-----|---------------|-----|
| 1 | [decision-framework.md](decision-framework.md) | [Lab 1](../labs/lab-01-decision-matrix.md) |
| 2 | [lora-peft-finetuning.md](lora-peft-finetuning.md) | [Lab 2](../labs/lab-02-lora-finetune.md) |
| 3 | [distillation-small-models.md](distillation-small-models.md) | [Lab 3](../labs/lab-03-distillation-deploy.md) |
| 4 | [agentic-rag.md](agentic-rag.md) | [Lab 4](../labs/lab-04-agentic-rag.md) |
| 5 | [long-context-vs-rag.md](long-context-vs-rag.md) → [graphrag-overview.md](graphrag-overview.md) *(optional)* | [Lab 5](../labs/lab-05-long-context-benchmark.md) |
| 6 | [multimodal-preview.md](multimodal-preview.md) → [mcp-production-patterns.md](mcp-production-patterns.md) | [Lab 6](../labs/lab-06-mcp-production.md) *(optional)* |
| 7 | Review track spec + ADR | Capstone |

---

## Topic summary

| File | One-line |
|------|----------|
| [decision-framework.md](decision-framework.md) | Score prompt vs RAG vs fine-tune vs bigger model |
| [lora-peft-finetuning.md](lora-peft-finetuning.md) | Parameter-efficient fine-tuning with LoRA/PEFT |
| [distillation-small-models.md](distillation-small-models.md) | Teacher→student compression and local deploy |
| [agentic-rag.md](agentic-rag.md) | LangGraph retrieve-grade-rewrite loop |
| [graphrag-overview.md](graphrag-overview.md) | Knowledge graphs + community summaries *(optional)* |
| [long-context-vs-rag.md](long-context-vs-rag.md) | When to stuff docs vs retrieve chunks |
| [multimodal-preview.md](multimodal-preview.md) | Vision + text for diagrams and screenshots |
| [mcp-production-patterns.md](mcp-production-patterns.md) | Auth, rate limits, SSRF-safe MCP servers |

**Optional revisit from Week 4** (not Week 7 exit criteria):

| File | When |
|------|------|
| [agent-skills-and-harness.md](../../week-04/theory/agent-skills-and-harness.md) | Packaging workflows that call your hardened MCP tools |
| [a2a-protocol.md](../../week-04/theory/a2a-protocol.md) | Cross-service agents after you understand production MCP |

---

## Prerequisites from earlier weeks

| Week | Carry into Week 7 |
|------|-------------------|
| 3 | RAG pipeline, hybrid retrieval, RAGAS eval |
| 4 | LangGraph agents, MCP stdio server |
| 5 | Redis, Docker, observability, cost caps |
| 6 | Eval CI gate, golden sets *(when published)* |

[← Week README](../README.md)
