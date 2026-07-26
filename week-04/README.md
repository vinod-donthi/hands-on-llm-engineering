# Week 4 — AI Agents

**8-Week AI Engineering Curriculum · Part 4 of 8**

> **Prerequisite:** Week 3 exit criteria passed · [Week 3 README](../week-03/README.md)  
> **New here?** [START-HERE.md](START-HERE.md) → [Day 1 playbook](daily/day-01.md)

---

## 1. Overview

Week 4 moves from **retrieval-augmented chat** (Week 3) to **autonomous agents** that plan, use tools, reflect, and ask humans when stakes are high.

You will build **Research Agent Studio**: a research agent that searches the web and your document index, synthesizes findings with citations, checkpoints its state, and pauses for approval before risky actions.

**Frameworks this week:** LangGraph (primary), OpenAI Agents SDK, Pydantic AI, and MCP for portable tools.

---

## 2. Learning Path vs Work Path

| | Learning path | Work path |
|---|---|---|
| **Purpose** | Read curriculum | Write code, run labs, build project |
| **Location** | This repo — `Learning/week-04/` | `Learning/week-04-work/` **or** `~/ai-learning/week-04-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, lab scripts, `research-agent-studio/`, `.env` |
| **Git** | Curriculum (no secrets, no venv) | Your code repo (optional) |

### Study flow

```
1. Open today's playbook       → daily/day-XX.md     (numbered steps — your driver)
2. Read theory in step order   → only files linked from that day
3. Code in work directory      → week-04-work/ or ~/ai-learning/week-04-work/
4. Confirm deliverable         → Done when checkboxes on daily page
5. Update progress.md          → tick the day
6. Follow Tomorrow link        → next daily/day-XX.md
```

**Week map:** [daily/README.md](daily/README.md) · **When short on time:** catch-up mode on each daily page (lab + deliverable first). See [roadmap.md](roadmap.md).

---

## 3. Weekly Outcomes

- [ ] Explain ReAct loop and when an agent beats a fixed chain
- [ ] Build a LangGraph with nodes, edges, and SQLite checkpoints
- [ ] Run tool calls via native API and via MCP server
- [ ] Implement short-term memory, planning, and reflection steps
- [ ] Add human-in-the-loop interrupts for high-risk tools
- [ ] Wire a supervisor + specialist multi-agent handoff (Lab 6 or project)
- [ ] Complete Labs 1–5 (Lab 6 optional if behind)
- [ ] Ship Research Agent Studio with citations and HITL
- [ ] Quiz ≥ 80% · Interview checkpoint ≥ 4/5

Full checklist: [checkpoints/exit-criteria.md](checkpoints/exit-criteria.md)

---

## 4. Folder Map

| Folder | Purpose |
|--------|---------|
| [START-HERE.md](START-HERE.md) | One-time orientation → Day 1 |
| [daily/](daily/) | **Numbered playbooks** — one file per day |
| [theory/](theory/) | Deep dives — one topic per file |
| [labs/](labs/) | Hands-on exercises |
| [project/](project/) | Research Agent Studio spec |
| [interview/](interview/) | Questions + cheat sheet |
| [checkpoints/](checkpoints/) | Quiz, exit criteria, progress |
| [resources/](resources/) | Reading, glossary, references |
| [appendix/](../appendix/) | **Optional** deep dives — never blocks week progress |
| [portfolio/](portfolio/) | Resume, LinkedIn, showcase |
| [assets/images/](assets/images/) | SVG diagrams for theory, labs, project |
| [requirements.txt](requirements.txt) | Python deps (copied to work path) |
| [scripts/setup-work.sh](scripts/setup-work.sh) | Bootstrap work directory |

---

## 5. Setup

### One-time: bootstrap work directory

```bash
cd week-04
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Creates `~/ai-learning/week-04-work/`, copies `requirements.txt` and `.env.example`, creates `.venv`, installs deps.

Custom work location:

```bash
./scripts/setup-work.sh ~/projects/my-week-04
# or
WORK_DIR=~/projects/my-week-04 ./scripts/setup-work.sh
```

### Migrate from Week 3 (recommended)

Copy your RAG retrieval module as a starting point — Week 4 adds agent orchestration on top.

```bash
cp -r ~/ai-learning/week-03-work/rag-chatbot/backend/app/retrieval \
      ~/ai-learning/week-04-work/research-agent-studio/backend/app/ 2>/dev/null || true
```

### Every session

```bash
cd ~/ai-learning/week-04-work
source .venv/bin/activate
```

### API keys (`.env`)

| Key | Required | Use |
|-----|----------|-----|
| `OPENAI_API_KEY` | Yes | GPT-4o Mini (primary agent model) |
| `TAVILY_API_KEY` | Recommended | Web search tool |
| DuckDuckGo | Fallback | No key; slower, rate-limited |

**Estimated cloud spend:** $5–15 for the full week (search + multi-step agent runs).

---

## 6. Navigation

### Theory

Full index: [theory/README.md](theory/README.md)

[ReAct & Agent vs Chain](theory/react-loop-agent-vs-chain.md) · [LangGraph](theory/langgraph.md) · [OpenAI Agents SDK](theory/openai-agents-sdk.md) · [Pydantic AI](theory/pydantic-ai.md) · [MCP Protocol](theory/mcp-protocol.md) · [Memory & Planning](theory/agent-memory-planning.md) · [Reflection](theory/reflection-self-correction.md) · [Human-in-the-Loop](theory/human-in-the-loop.md) · [Multi-Agent](theory/multi-agent-patterns.md) · [Checkpointing](theory/checkpointing-idempotency.md) · [Observability](theory/agent-observability.md)

### Labs

[Overview](labs/README.md) · [Lab 1](labs/lab-01-react-langgraph.md) · [Lab 2](labs/lab-02-openai-agents-sdk.md) · [Lab 3](labs/lab-03-mcp-server.md) · [Lab 4](labs/lab-04-memory-reflection.md) · [Lab 5](labs/lab-05-hitl-interrupts.md) · [Lab 6](labs/lab-06-multi-agent.md) *(optional)*

### Project

[Overview](project/overview.md) · [Architecture](project/architecture.md) · [Backend](project/backend.md) · [API](project/api.md) · [MCP Server](project/mcp-server.md) · [Acceptance Criteria](project/acceptance-criteria.md)

### Interview & Validation

[Concepts](interview/concepts.md) · [System Design](interview/system-design.md) · [Coding](interview/coding.md) · [Cheat Sheet](interview/cheat-sheet.md) · [Quiz](checkpoints/quiz.md) · [Exit Criteria](checkpoints/exit-criteria.md)

---

## 7. Daily Checklist

| Day | Must Complete | Optional |
|-----|---------------|----------|
| 1 | Lab 1, ReAct + LangGraph theory | Extra LangGraph docs |
| 2 | Lab 2, OpenAI Agents SDK + Pydantic AI skim | Pydantic AI deep dive |
| 3 | Lab 3, MCP server + client | Extra MCP security reading |
| 4 | Lab 4, memory + reflection nodes | Long-term memory store |
| 5 | Lab 5, HITL interrupts | Custom approval UI |
| 6 | Checkpointing in graph, project wiring | Lab 6 multi-agent |
| 7 | Research Agent Studio capstone | Portfolio docs |

Details: [daily/](daily/)

---

## 8. Progress Tracker

```bash
cp progress.md ~/ai-learning/week-04-work/
```

---

## 9. Week Completion Criteria

| Gate | Requirement |
|------|-------------|
| **Knowledge** | Quiz ≥ 12/15 |
| **Build** | All [acceptance criteria](project/acceptance-criteria.md) checked |
| **Agent loop** | ReAct graph with ≥ 3 tools (web, docs, synthesize) |
| **HITL** | High-risk tool blocked until approval |
| **Checkpoint** | Run resumes after simulated crash |
| **Citations** | Final report includes source URLs + doc IDs |
| **Interview** | ≥ 4/5 self-assessment parts at hire-ready |

Proceed to Week 5 (Production AI Systems) only when all gates pass. See [checkpoints/progress-tracker.md](checkpoints/progress-tracker.md).
