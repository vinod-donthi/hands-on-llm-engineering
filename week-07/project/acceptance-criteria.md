# Advanced AI Studio — Acceptance Criteria

> Week 7 Project · [← Overview](overview.md) · [Exit Criteria](../checkpoints/exit-criteria.md)

## Shared (both tracks)

- [ ] `advanced-ai-studio/` runs locally (`uvicorn` or Docker)
- [ ] `GET /health` returns 200
- [ ] Day 1 `decision_matrix.json` committed to work dir
- [ ] `docs/adr/0001-advanced-ai-studio.md` complete with Status: Accepted
- [ ] `capstone_eval_report.json` compares to Day 1 baseline
- [ ] Labs 1–5 deliverables present
- [ ] Cost cap or rate limit active (Week 5 pattern)

---

## Track A — Fine-tuned assistant

- [ ] Fine-tune job completed; `OPENAI_FINE_TUNED_MODEL` in `.env`
- [ ] `POST /api/v1/chat` routes to fine-tuned model
- [ ] Fallback to baseline on simulated failure
- [ ] `finetune_eval_report.json` — fine-tune wins ≥55% eval pairs OR documented tradeoff
- [ ] Model ID and version logged per request

---

## Track B — Agentic RAG module

- [ ] LangGraph agentic RAG with grade + rewrite nodes
- [ ] `max_retrieval_steps` enforced (default 3)
- [ ] `POST /api/v1/agent/query` returns `steps[]` trace
- [ ] Beats classic RAG on ≥60% multihop cases OR documented tradeoff
- [ ] MCP server with auth **or** rate limit (Lab 6 or minimal equivalent)
- [ ] Hybrid retrieval connected to Qdrant

---

## Optional (portfolio boost)

- [ ] Distillation router (Lab 3) integrated
- [ ] Long context benchmark referenced in ADR (Lab 5)
- [ ] Multimodal demo script runs (Lab 6)
- [ ] Langfuse traces for agent steps

---

## Demo script (Day 7)

**Track A:**

```bash
curl -s localhost:8000/api/v1/chat -H 'Content-Type: application/json' \
  -d '{"message":"Classify: login broken after SSO update","task_type":"triage"}' | jq .
```

**Track B:**

```bash
curl -s localhost:8000/api/v1/agent/query -H 'Content-Type: application/json' \
  -d '{"question":"Compare EU and US data retention policies"}' | jq .steps
```

[← Overview](overview.md) · [ADR Template](adr-template.md)
