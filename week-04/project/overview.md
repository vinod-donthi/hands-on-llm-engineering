# Research Agent Studio — Overview

> Week 4 Project · [← README](../README.md) · [Architecture](architecture.md)

> **Work dir:** `~/ai-learning/week-04-work/research-agent-studio/`

Evolution of Week 3 **RAG chatbot** into an **autonomous research agent** — the Week 4 capstone per [prompt.md](../../prompt.md).

## Week 3 → Week 4

| Feature | Week 3 (RAG chatbot) | Week 4 (Research Agent Studio) |
|---------|----------------------|--------------------------------|
| Flow | Fixed retrieve → generate | ReAct loop with dynamic tools |
| Web data | — | `web_search` + MCP tools |
| Planning | — | Sub-question plan node |
| Quality | Single pass | Reflection + re-search |
| Safety | Basic guardrails | HITL on high-risk tools |
| Durability | — | SQLite checkpoints |
| Output | Answer + doc citations | Research report + web + doc citations |
| Framework | LangChain/LlamaIndex chain | LangGraph primary |

## Project Docs

| Doc | Content |
|-----|---------|
| [architecture.md](architecture.md) | Diagram, folder structure |
| [backend.md](backend.md) | Graph, tools, MCP, HITL |
| [api.md](api.md) | REST endpoints |
| [mcp-server.md](mcp-server.md) | MCP tool server spec |
| [acceptance-criteria.md](acceptance-criteria.md) | Ship checklist |

## Capstone query (standard benchmark)

> *"Compare EU AI Act GPAI provider obligations with our internal AI policy document. Cite at least two web sources and one internal doc section. Note enforcement timelines."*

Exports:

- `research_report.json`
- `research_trace.jsonl`

## Local run

```bash
cd ~/ai-learning/week-04-work
source .venv/bin/activate

# Terminal 1 — optional if using external MCP
python research_mcp_server.py

# Terminal 2 — API
cd research-agent-studio/backend
uvicorn app.main:app --reload --port 8001
```

## Portfolio

[week-04-showcase.md](../portfolio/week-04-showcase.md) · [resume bullets](../portfolio/resume-bullets.md)
