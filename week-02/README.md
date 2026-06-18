# Week 2 — LLM Engineering

**8-Week AI Engineering Curriculum · Part 2 of 8**

> **Prerequisite:** Week 1 exit criteria passed · [Week 1 README](../week-01/README.md)  
> **New here?** [START-HERE.md](START-HERE.md) → [Day 1 playbook](daily/day-01.md)

---

## 1. Overview

Week 2 turns Week 1's **Prompt Playground Lite** into a production-minded **Model Benchmark Studio**: a multi-provider abstraction layer with streaming, function calling, guardrails, cost controls, PostgreSQL run history, and automated benchmarking.

You will integrate **OpenAI**, **Anthropic**, and **open-source models** (Ollama), learn when to pick which model, and ship a tool that benchmarks latency, cost, and quality across providers.

**Picked up from Week 1 deferrals:** PostgreSQL history, SSE streaming, Docker Compose, YAML model registry.

---

## 2. Learning Path vs Work Path

| | Learning path | Work path |
|---|---|---|
| **Purpose** | Read curriculum | Write code, run labs, build project |
| **Location** | This repo — `Learning/week-02/` | `Learning/week-02-work/` **or** `~/ai-learning/week-02-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, lab scripts, `model-benchmark-studio/`, `.env` |
| **Git** | Curriculum (no secrets, no venv) | Your code repo (optional) |

### Study flow

```
1. Open today's playbook       → daily/day-XX.md     (numbered steps — your driver)
2. Read theory in step order   → only files linked from that day
3. Code in work directory      → week-02-work/ or ~/ai-learning/week-02-work/
4. Confirm deliverable         → Done when checkboxes on daily page
5. Update progress.md          → tick the day
6. Follow Tomorrow link        → next daily/day-XX.md
```

**Week map:** [daily/README.md](daily/README.md) · **When short on time:** catch-up mode on each daily page (lab + deliverable first). See [roadmap.md](roadmap.md).

---

## 3. Weekly Outcomes

- [ ] Implement providers for OpenAI, Anthropic, and Ollama behind one interface
- [ ] Complete Labs 1–5 (Lab 6 optional if behind)
- [ ] YAML model registry drives provider routing
- [ ] SSE streaming works end-to-end in the UI
- [ ] Function calling with at least one tool executes correctly
- [ ] Context budget middleware prevents overflow
- [ ] PostgreSQL stores run history; Docker Compose boots the stack
- [ ] Benchmark suite exports `benchmark_report.json` + `benchmark_summary.md`
- [ ] Quiz ≥ 80% · Coding assignment ≥ 70%

Full checklist: [checkpoints/exit-criteria.md](checkpoints/exit-criteria.md)

---

## 4. Folder Map

| Folder | Purpose |
|--------|---------|
| [START-HERE.md](START-HERE.md) | One-time orientation → Day 1 |
| [daily/](daily/) | **Numbered playbooks** — one file per day |
| [theory/](theory/) | Deep dives — one topic per file |
| [labs/](labs/) | Hands-on exercises |
| [project/](project/) | Model Benchmark Studio spec |
| [interview/](interview/) | Questions + cheat sheet |
| [checkpoints/](checkpoints/) | Quiz, exit criteria, progress |
| [resources/](resources/) | Reading, glossary, references |
| [appendix/](../appendix/) | **Optional** deep dives — never blocks week progress |
| [portfolio/](portfolio/) | Resume, LinkedIn, showcase |
| [requirements.txt](requirements.txt) | Python deps (copied to work path) |
| [scripts/setup-work.sh](scripts/setup-work.sh) | Bootstrap work directory |

---

## 5. Setup

### One-time: bootstrap work directory

```bash
cd week-02
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Creates `~/ai-learning/week-02-work/`, copies `requirements.txt` and `.env.example`, creates `.venv`, installs deps.

Custom work location:

```bash
./scripts/setup-work.sh ~/projects/my-week-02
# or
WORK_DIR=~/projects/my-week-02 ./scripts/setup-work.sh
```

### Migrate from Week 1 (recommended)

Copy your `prompt-playground-lite/` backend provider code as a starting point — Week 2 extends it, not replaces it.

```bash
cp -r ~/ai-learning/week-01-work/prompt-playground-lite/backend/app/providers \
      ~/ai-learning/week-02-work/model-benchmark-studio/backend/app/ 2>/dev/null || true
```

### Every session

```bash
cd ~/ai-learning/week-02-work
source .venv/bin/activate
```

### API keys (`.env`)

| Key | Required | Provider |
|-----|----------|----------|
| `OPENAI_API_KEY` | Yes | GPT-4o Mini (primary cloud) |
| `ANTHROPIC_API_KEY` | Yes | Claude 3.5 Haiku (second cloud) |
| Ollama local | Yes (free) | Llama 3.1 8B, optional Mistral 7B |

**Estimated cloud spend:** $3–8 for the full week.

### Docker (Day 6+)

```bash
docker compose -f model-benchmark-studio/docker-compose.yml up -d
```

---

## 6. Navigation

### Theory

Full index: [theory/README.md](theory/README.md)

[OpenAI API](theory/openai-api.md) · [Anthropic API](theory/anthropic-api.md) · [Open Source Models](theory/open-source-models.md) · [Model Selection](theory/model-selection.md) · [Streaming](theory/streaming.md) · [Function Calling](theory/function-calling.md) · [Structured Outputs](theory/structured-outputs-engineering.md) · [Context Management](theory/context-management.md) · [Guardrails](theory/guardrails.md) · [Cost Optimization](theory/cost-optimization.md)

### Labs

[Overview](labs/README.md) · [Lab 1](labs/lab-01-provider-apis.md) · [Lab 2](labs/lab-02-model-registry.md) · [Lab 3](labs/lab-03-streaming-sse.md) · [Lab 4](labs/lab-04-function-calling.md) · [Lab 5](labs/lab-05-context-cost.md) · [Lab 6](labs/lab-06-run-history.md) *(optional)*

### Project

[Overview](project/overview.md) · [Architecture](project/architecture.md) · [Backend](project/backend.md) · [Frontend](project/frontend.md) · [API](project/api.md) · [Docker](project/docker.md) · [Benchmarking Spec](project/benchmarking-spec.md) · [Acceptance Criteria](project/acceptance-criteria.md)

### Interview & Validation

[Concepts](interview/concepts.md) · [System Design](interview/system-design.md) · [Coding](interview/coding.md) · [Cheat Sheet](interview/cheat-sheet.md) · [Quiz](checkpoints/quiz.md) · [Exit Criteria](checkpoints/exit-criteria.md)

---

## 7. Daily Checklist

| Day | Must Complete | Optional |
|-----|---------------|----------|
| 1 | Lab 1, OpenAI + Anthropic theory | Extra API doc reading |
| 2 | Lab 2, model selection | Pull Mistral 7B |
| 3 | Lab 3, streaming UI | TTFT micro-benchmark |
| 4 | Lab 4, function calling | Extra tool schemas |
| 5 | Lab 5, guardrails + cost | NeMo Guardrails skim |
| 6 | Lab 6, Docker + Postgres | pgAdmin |
| 7 | Capstone benchmark suite | Portfolio docs |

Details: [daily/](daily/)

---

## 8. Progress Tracker

```bash
cp progress.md ~/ai-learning/week-02-work/
```

---

## 9. Week Completion Criteria

| Gate | Requirement |
|------|-------------|
| **Knowledge** | Quiz ≥ 12/15 |
| **Build** | All [acceptance criteria](project/acceptance-criteria.md) checked |
| **Providers** | OpenAI + Anthropic + Ollama behind `BaseLLMProvider` |
| **Streaming** | SSE `/api/v1/stream` works in UI |
| **Benchmark** | `benchmark_report.json` with ≥ 3 models × 5 prompts |
| **Checkpoint** | ≥ 4/5 interview self-assessment parts at hire-ready |

Proceed to Week 3 (RAG) only when all gates pass. See [checkpoints/progress-tracker.md](checkpoints/progress-tracker.md).
