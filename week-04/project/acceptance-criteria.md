# Research Agent Studio — Acceptance Criteria

> Week 4 Project · [← Overview](overview.md)

Check every box before Week 4 exit.

## Agent core

- [ ] LangGraph with plan, research, tools, summarize, reflect, write nodes
- [ ] ReAct loop completes standard capstone question
- [ ] `MAX_TOOL_ROUNDS` enforced (no infinite loop)

## Tools

- [ ] `web_search` via MCP or native (Tavily or DuckDuckGo)
- [ ] `doc_search` using Week 3 retrieval against local index
- [ ] ≥ 3 distinct tools registered in production graph
- [ ] MCP server runs and lists tools

## Memory & quality

- [ ] Plan node outputs sub_questions
- [ ] Structured `findings` in state
- [ ] Reflection node with `coverage_score`
- [ ] Re-search when coverage below threshold

## HITL

- [ ] High-risk tool (e.g. `fetch_url`) triggers interrupt
- [ ] Approve and reject paths both demonstrated
- [ ] Timeout defaults to reject

## Durability

- [ ] SQLite checkpointer configured
- [ ] Resume after kill mid-run (documented demo)
- [ ] Idempotent cache for `web_search` (no duplicate API charge on resume)

## Output

- [ ] `research_report.json` matches schema (summary + citations)
- [ ] ≥ 2 web citations + ≥ 1 doc citation on capstone query
- [ ] `research_trace.jsonl` with node, tool, cost events

## API

- [ ] `POST /api/v1/research` starts run
- [ ] `GET /api/v1/research/{thread_id}` returns complete report
- [ ] HITL approve endpoint resumes run

## Observability

- [ ] structlog or JSONL trace per run
- [ ] `cost_usd` logged on complete
- [ ] No API keys in trace files

## Tests

- [ ] `pytest` passes in `backend/tests/`
- [ ] At least one HITL test and one checkpoint resume test

## Labs

- [ ] Labs 1–5 deliverables present in work dir
- [ ] Lab 6 optional — skipped documented in progress.md if applicable

---

**Sign-off:** Date ______ · Capstone thread_id ______ · Total cost $ ______
