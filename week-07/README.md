# Week 7 — Advanced Topics

**8-Week AI Engineering Curriculum · Part 7 of 8**

> **Prerequisite:** Week 3 RAG + Week 4 agents + Week 5 production stack · [Week 6 eval gate](../prompt.md) *(when published)*  
> **New here?** [START-HERE.md](START-HERE.md) → [Day 1 playbook](daily/day-01.md)

---

## 1. Overview

Week 7 is where you stop treating "pick GPT-4" as architecture. You learn **when to fine-tune, when to retrieve, when to prompt-engineer, and when to upgrade the model** — then ship one of two capstone tracks in **Advanced AI Studio**:

| Track | Build | Best if |
|-------|-------|---------|
| **A — Fine-tuned assistant** | LoRA/PEFT specialized model for a narrow domain | Style/format locked, stable knowledge, high volume |
| **B — Agentic RAG module** | LangGraph agent that decides when/how to retrieve | Multi-hop docs, changing corpus, tool + retrieval mix |

Both tracks produce an **Architecture Decision Record (ADR)** documenting why you chose your path.

**Picked up from earlier weeks:** RAG pipeline (Week 3), LangGraph agents + MCP (Week 4), production patterns (Week 5), eval baselines (Week 6).

---

## 2. Learning Path vs Work Path

| | Learning path | Work path |
|---|---|---|
| **Purpose** | Read curriculum | Write code, run labs, build project |
| **Location** | This repo — `Learning/week-07/` | `Learning/week-07-work/` **or** `~/ai-learning/week-07-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, lab scripts, `advanced-ai-studio/`, `.env` |
| **Git** | Curriculum (no secrets, no venv) | Your code repo (optional) |

### Study flow

```
1. Open today's playbook       → daily/day-XX.md     (numbered steps — your driver)
2. Read theory in step order   → only files linked from that day
3. Code in work directory      → week-07-work/ or ~/ai-learning/week-07-work/
4. Confirm deliverable         → Done when checkboxes on daily page
5. Update progress.md          → tick the day
6. Follow Tomorrow link        → next daily/day-XX.md
```

**Week map:** [daily/README.md](daily/README.md) · **When short on time:** catch-up mode on each daily page (lab + deliverable first). See [roadmap.md](roadmap.md).

---

## 3. Weekly Outcomes

- [ ] Complete decision matrix for a real use case (prompt vs RAG vs fine-tune vs bigger model)
- [ ] Run a LoRA/PEFT fine-tune job (cloud or local) and evaluate vs baseline
- [ ] Compare distilled/small model deployment vs teacher model on latency + quality
- [ ] Ship agentic RAG with retrieve → grade → re-query loop (LangGraph)
- [ ] Document long-context vs RAG tradeoffs with measured token/cost data
- [ ] Deploy or harden an MCP server with auth, rate limits, and health checks
- [ ] Complete Labs 1–5 (Lab 6 optional if behind)
- [ ] **Advanced AI Studio** capstone + signed ADR
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
| [project/](project/) | Advanced AI Studio spec + ADR template |
| [interview/](interview/) | Questions + cheat sheet |
| [checkpoints/](checkpoints/) | Quiz, exit criteria, progress |
| [resources/](resources/) | Reading, glossary, references |
| [appendix/](../appendix/) | **Optional** deep dives — never blocks week progress |
| [portfolio/](portfolio/) | Resume, LinkedIn, showcase |
| [assets/images/](assets/images/) | SVG figures for theory, labs, project |
| [requirements.txt](requirements.txt) | Python deps (copied to work path) |
| [scripts/setup-work.sh](scripts/setup-work.sh) | Bootstrap work directory |

---

## 5. Setup

### One-time: bootstrap work directory

```bash
cd week-07
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Creates `~/ai-learning/week-07-work/`, copies `requirements.txt` and `.env.example`, creates `.venv`, installs deps.

Custom work location:

```bash
./scripts/setup-work.sh ~/projects/my-week-07
# or
WORK_DIR=~/projects/my-week-07 ./scripts/setup-work.sh
```

### Migrate from prior weeks (recommended)

Copy your Week 3 RAG service and Week 4 agent/MCP code as starting points:

```bash
cp -r ~/ai-learning/week-03-work/doc-qa-studio/backend/app/retrieval \
      ~/ai-learning/week-07-work/advanced-ai-studio/backend/app/ 2>/dev/null || true
cp -r ~/ai-learning/week-04-work/research-agent-studio/backend/app/graph \
      ~/ai-learning/week-07-work/advanced-ai-studio/backend/app/ 2>/dev/null || true
```

### Every session

```bash
cd ~/ai-learning/week-07-work
source .venv/bin/activate
```

### API keys (`.env`)

| Key | Required | Use |
|-----|----------|-----|
| `OPENAI_API_KEY` | Yes | Fine-tune API, eval judge, agent |
| `AZURE_OPENAI_API_KEY` | Optional | Azure fine-tune / deployment |
| `ANTHROPIC_API_KEY` | Optional | Teacher model for distillation compare |
| Ollama local | Recommended | Small model deployment lab |

**Estimated cloud spend:** $8–25 for the full week (fine-tune jobs dominate).

### Docker (Day 6+)

```bash
docker compose -f advanced-ai-studio/docker-compose.yml up -d
```

---

## 6. Navigation

### Theory

Full index: [theory/README.md](theory/README.md)

[Decision Framework](theory/decision-framework.md) · [LoRA / PEFT](theory/lora-peft-finetuning.md) · [Distillation](theory/distillation-small-models.md) · [Agentic RAG](theory/agentic-rag.md) · [GraphRAG](theory/graphrag-overview.md) *(optional)* · [Long Context vs RAG](theory/long-context-vs-rag.md) · [Multimodal Preview](theory/multimodal-preview.md) · [MCP Production](theory/mcp-production-patterns.md)

### Labs

[Overview](labs/README.md) · [Lab 1](labs/lab-01-decision-matrix.md) · [Lab 2](labs/lab-02-lora-finetune.md) · [Lab 3](labs/lab-03-distillation-deploy.md) · [Lab 4](labs/lab-04-agentic-rag.md) · [Lab 5](labs/lab-05-long-context-benchmark.md) · [Lab 6](labs/lab-06-mcp-production.md) *(optional)*

### Project

[Overview](project/overview.md) · [Architecture](project/architecture.md) · [Track A — Fine-tuned](project/track-a-finetuned-assistant.md) · [Track B — Agentic RAG](project/track-b-agentic-rag.md) · [Backend](project/backend.md) · [API](project/api.md) · [ADR Template](project/adr-template.md) · [Docker](project/docker.md) · [Acceptance Criteria](project/acceptance-criteria.md)

### Interview & Validation

[Concepts](interview/concepts.md) · [System Design](interview/system-design.md) · [Coding](interview/coding.md) · [Cheat Sheet](interview/cheat-sheet.md) · [Quiz](checkpoints/quiz.md) · [Exit Criteria](checkpoints/exit-criteria.md)

---

## 7. Daily Checklist

| Day | Must Complete | Optional |
|-----|---------------|----------|
| 1 | Lab 1, decision framework | Extra reading on eval gates |
| 2 | Lab 2, LoRA/PEFT theory | Azure Foundry fine-tune UI |
| 3 | Lab 3, distillation + deploy | vLLM local serving |
| 4 | Lab 4, agentic RAG integration | Extra LangGraph nodes |
| 5 | Lab 5, long context benchmark | GraphRAG skim |
| 6 | Lab 6, MCP production | Multimodal vision demo |
| 7 | Capstone + ADR | Portfolio docs |

Details: [daily/](daily/)

---

## 8. Progress Tracker

```bash
cp progress.md ~/ai-learning/week-07-work/
```

---

## 9. Week Completion Criteria

| Gate | Requirement |
|------|-------------|
| **Knowledge** | Quiz ≥ 12/15 |
| **Decision** | Completed `decision_matrix.json` with scored options |
| **Build** | Advanced AI Studio — Track A **or** Track B per [acceptance criteria](project/acceptance-criteria.md) |
| **ADR** | Signed ADR in `docs/adr/0001-advanced-ai-studio.md` |
| **Eval** | Baseline vs advanced path — documented quality + cost delta |
| **Checkpoint** | ≥ 4/5 interview self-assessment parts at hire-ready |

Proceed to Week 8 (AI Radar capstone) only when all gates pass. See [checkpoints/progress-tracker.md](checkpoints/progress-tracker.md).
