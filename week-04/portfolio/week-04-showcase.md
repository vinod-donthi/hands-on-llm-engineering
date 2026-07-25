# Week 4 Portfolio — Research Agent Studio Showcase

> [← README](../README.md) · Fill in after Day 7 capstone.

## One-liner

Autonomous research agent that searches web + internal docs, reflects on coverage, pauses for human approval on risky fetches, and delivers cited reports — built with LangGraph and MCP.

## Problem

Compliance and product teams need **sourced** research memos combining **live web data** and **internal policy docs**. Fixed RAG chains cannot plan multi-step research or refuse risky actions.

## Solution

| Component | Implementation |
|-----------|----------------|
| Orchestration | LangGraph (plan → research ↔ tools → reflect → write) |
| Web tools | MCP server (`web_search`, `fetch_url`) |
| Internal docs | Week 3 `doc_search` over Chroma |
| Quality | Reflection node with coverage_score |
| Safety | HITL on `fetch_url` + SSRF blocks |
| Durability | SQLite checkpoints + idempotent search cache |
| Observability | JSONL trace per run |

## Architecture

See [project/architecture.md](../project/architecture.md) — include diagram in README or demo deck.

## Demo script (3 min)

1. `POST /api/v1/research` with capstone question  
2. Show trace: plan → web_search → doc_search → reflect  
3. Trigger HITL — approve public URL  
4. Show final report citations (≥ 2 web, ≥ 1 doc)  
5. Kill process mid-run → resume with same thread_id  

## Results (your numbers)

| Metric | Value |
|--------|-------|
| Capstone thread_id | |
| Tool rounds | |
| Total cost USD | |
| Coverage score | |
| Citations count | |
| Time to complete | |

## Artifacts

- [ ] `research_report.json`
- [ ] `research_trace.jsonl`
- [ ] Screenshot or screen recording
- [ ] GitHub repo link (optional)

## What I'd do next (Week 5+)

- Deploy on Docker Compose with Redis session store  
- Postgres checkpointer instead of SQLite  
- Langfuse dashboards for trace analytics  
- Eval CI gate on golden research questions (Week 6)  

## Interview story (STAR skeleton)

**Situation:** Needed research combining external regulations and internal policy.  
**Task:** Build agent with citations and safety gates.  
**Action:** LangGraph + MCP + HITL + Week 3 retrieval as tools.  
**Result:** Cited report in one run; resume demo; $___ cost logged.
