# Agent Observability

> Week 4 Theory · Day 7 · [← README](../README.md) · [Checkpointing](checkpointing-idempotency.md)

**Agent observability** means tracing every LLM call, tool invocation, handoff, reflection score, and dollar cost so you can debug wrong answers and prove production readiness. Week 4 introduces tracing; Week 5–6 wire dashboards and CI eval gates.

---

## Concepts

### What problem are we solving?

**Symptom:** User report — *"The research agent cited a broken link and missed our internal doc."*

Without traces, you guess. With traces, you see: wrong tool chosen at step 3, reflection `coverage_score` skipped, doc_search never called.

### Worked example: one run trace

`research_trace.jsonl` (one JSON object per line):

```json
{"ts": "2026-07-25T10:00:01Z", "event": "node_start", "node": "plan", "thread_id": "job-88"}
{"ts": "2026-07-25T10:00:02Z", "event": "llm_call", "model": "gpt-4o-mini", "tokens_in": 820, "tokens_out": 140, "cost_usd": 0.0002}
{"ts": "2026-07-25T10:00:04Z", "event": "tool_call", "tool": "web_search", "args": {"query": "EU AI Act fines"}, "latency_ms": 890}
{"ts": "2026-07-25T10:00:05Z", "event": "tool_result", "tool": "web_search", "result_count": 5, "cached": false}
{"ts": "2026-07-25T10:00:07Z", "event": "reflect", "coverage_score": 0.55, "should_continue": true}
{"ts": "2026-07-25T10:00:12Z", "event": "hitl_interrupt", "tool": "fetch_url", "decision": "approved"}
{"ts": "2026-07-25T10:00:20Z", "event": "run_complete", "total_cost_usd": 0.04, "tool_rounds": 4}
```

Capstone exports `research_report.json` + trace file.

### What to log (minimum)

| Field | Why |
|-------|-----|
| `thread_id` | Correlate resume + HITL |
| `node` / `agent_id` | Locate failure in graph |
| `tool` + `args` | Reproduce bad calls |
| `latency_ms` | SLA debugging |
| `tokens_in/out`, `cost_usd` | Budget (Week 2 formula) |
| `coverage_score` | Quality signal |
| `error` | Failed tool/API |

### User symptom → cause

| Symptom | Trace clue |
|---------|------------|
| Shallow answer | Low `coverage_score` but `write` anyway — missing max rounds |
| Wrong citation | `tool_result` shows unrelated snippets — bad query |
| Run never finishes | `tool_rounds` at max with loop — routing bug |
| Duplicate searches | Same query hash — idempotency cache miss |
| Stuck waiting | `hitl_interrupt` with no `decision` — timeout policy |

### Tools (Week 4 scope)

| Tool | Week 4 | Later weeks |
|------|--------|-------------|
| **structlog** JSON to file | Required in project | — |
| **LangSmith** | Optional env | Week 6 |
| **Langfuse** | Optional env | Week 5–6 |
| **OpenTelemetry** | Preview mention | Week 5 |

```python
import structlog
log = structlog.get_logger()
log.info("tool_call", tool="web_search", query=query, thread_id=thread_id)
```

### Redaction

Never log: full API keys, raw PII from user input, entire internal documents.

Log: source IDs, URL domains, token counts, hashes.

**AI engineer takeaway:** If you cannot replay a run from logs, you do not have an agent — you have a demo.

---

## Tradeoffs

| Pros | Cons |
|------|------|
| Faster debugging | Storage volume |
| Cost attribution per run | PII risk if careless |
| Interview-ready stories | Instrumentation overhead |

---

## Best Practices

- JSONL per run — easy append, grep, ship to S3
- Propagate `trace_id` = `thread_id` across MCP and subgraphs
- Dashboard later — schema now (Week 6)
- Alert on `cost_usd > MAX_COST_USD_PER_RUN`

---

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Only final answer logged | Log every tool + LLM |
| Logging full HTML | Log counts + URLs |
| No cost on tool calls | Tavily charges too — attribute |
| Different IDs per subgraph | Parent thread_id everywhere |

---

## Checkpoint

1. Name three events in the sample trace.
2. How would you debug a missing internal doc citation?
3. What should you never log?
4. What optional service does `.env` `LANGSMITH_API_KEY` enable?
5. What two files does the capstone export?

---

## Go Deeper

| Resource | Why |
|----------|-----|
| [structlog](https://www.structlog.org/) | JSON logging |
| [LangSmith tracing](https://docs.smith.langchain.com/) | LangGraph integration |
| Week 6 eval curriculum | Trace regression testing |

---

## Next

→ [Day 7 capstone](../daily/day-07.md) · [project/acceptance-criteria.md](../project/acceptance-criteria.md)
