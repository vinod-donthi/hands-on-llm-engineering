# Week 5 — Production AI Systems

**8-Week AI Engineering Curriculum · Part 5 of 8**

> **Prerequisite:** Week 4 exit criteria passed · [Week 4 README](../week-04/README.md) *(when published)*  
> **New here?** [START-HERE.md](START-HERE.md) → [Day 1 playbook](daily/day-01.md)

---

## 1. Overview

Week 5 takes your Week 3/4 **RAG pipeline** or **research agent** and hardens it into a **Production AI Stack**: FastAPI with production middleware, Redis for caching and rate limits, semantic cache for repeated queries, background job workers, OpenTelemetry traces, Langfuse for LLM observability, and Docker Compose (with an optional Azure Container Apps path).

You will ship a multi-service stack with health checks, backpressure, cost controls, and traces you can show in an interview system-design round.

**Picked up from prior weeks:** FastAPI basics (Week 1–2), RAG/agent logic (Week 3–4), embeddings (Week 3).

---

## 2. Learning Path vs Work Path

| | Learning path | Work path |
|---|---|---|
| **Purpose** | Read curriculum | Write code, run labs, build project |
| **Location** | This repo — `Learning/week-05/` | `Learning/week-05-work/` **or** `~/ai-learning/week-05-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, lab scripts, `production-ai-stack/`, `.env` |
| **Git** | Curriculum (no secrets, no venv) | Your code repo (optional) |

### Study flow

```
1. Open today's playbook       → daily/day-XX.md     (numbered steps — your driver)
2. Read theory in step order   → only files linked from that day
3. Code in work directory      → week-05-work/ or ~/ai-learning/week-05-work/
4. Confirm deliverable         → Done when checkboxes on daily page
5. Update progress.md          → tick the day
6. Follow Tomorrow link        → next daily/day-XX.md
```

**Week map:** [daily/README.md](daily/README.md) · **When short on time:** catch-up mode on each daily page (lab + deliverable first). See [roadmap.md](roadmap.md).

---

## 3. Weekly Outcomes

- [ ] FastAPI app with lifespan hooks, structured logging, and `/health` + `/ready` endpoints
- [ ] Docker Compose boots API, Redis, worker, and optional Postgres/Qdrant from Week 3
- [ ] Redis exact cache + rate limiting + session store working
- [ ] Semantic cache hits on paraphrased queries (embedding similarity threshold)
- [ ] ARQ worker processes async jobs (index refresh, eval runs, long RAG)
- [ ] OpenTelemetry traces export; Langfuse shows LLM spans and costs
- [ ] Backpressure and per-user cost caps enforced under load
- [ ] Complete Labs 1–5 (Lab 6 optional if behind)
- [ ] **Production AI Stack** deployed locally (Compose) or Azure Container Apps
- [ ] Quiz ≥ 80% · Interview checkpoint ≥ 4/5 hire-ready

Full checklist: [checkpoints/exit-criteria.md](checkpoints/exit-criteria.md)

---

## 4. Folder Map

| Folder | Purpose |
|--------|---------|
| [START-HERE.md](START-HERE.md) | One-time orientation → Day 1 |
| [daily/](daily/) | **Numbered playbooks** — one file per day |
| [theory/](theory/) | Deep dives — one topic per file |
| [labs/](labs/) | Hands-on exercises |
| [project/](project/) | Production AI Stack spec |
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
cd week-05
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Creates `~/ai-learning/week-05-work/`, copies `requirements.txt` and `.env.example`, creates `.venv`, installs deps.

Custom work location:

```bash
./scripts/setup-work.sh ~/projects/my-week-05
# or
WORK_DIR=~/projects/my-week-05 ./scripts/setup-work.sh
```

### Migrate from Week 3/4 (recommended)

Copy your RAG or agent service as the starting API — Week 5 wraps it in production infrastructure, not replaces the core logic.

```bash
cp -r ~/ai-learning/week-03-work/rag-pipeline/backend/app/rag \
      ~/ai-learning/week-05-work/production-ai-stack/backend/app/ 2>/dev/null || true
cp -r ~/ai-learning/week-04-work/research-agent/backend/app/agent \
      ~/ai-learning/week-05-work/production-ai-stack/backend/app/ 2>/dev/null || true
```

### Every session

```bash
cd ~/ai-learning/week-05-work
source .venv/bin/activate
```

### API keys (`.env`)

| Key | Required | Purpose |
|-----|----------|---------|
| `OPENAI_API_KEY` | Yes | LLM + embeddings for semantic cache |
| `LANGFUSE_PUBLIC_KEY` | Yes (Day 6+) | LLM trace UI |
| `LANGFUSE_SECRET_KEY` | Yes (Day 6+) | LLM trace UI |
| Redis | Yes (local Docker) | Cache, rate limits, ARQ broker |
| Azure credentials | Optional (Day 7) | Container Apps deploy |

**Estimated cloud spend:** $5–15 for the full week (embedding calls for semantic cache + Langfuse free tier).

### Docker (Day 2+)

```bash
docker compose -f production-ai-stack/docker-compose.yml up -d
```

---

## 6. Navigation

### Theory

Full index: [theory/README.md](theory/README.md)

[FastAPI Production](theory/fastapi-production.md) · [Docker Compose](theory/docker-compose.md) · [Redis Patterns](theory/redis-patterns.md) · [Semantic Caching](theory/semantic-caching.md) · [Background Queues](theory/background-queues.md) · [Observability](theory/observability.md) · [Scaling & Cost](theory/scaling-cost-backpressure.md) · [Azure Deployment](theory/azure-deployment.md)

### Labs

[Overview](labs/README.md) · [Lab 1](labs/lab-01-fastapi-production.md) · [Lab 2](labs/lab-02-docker-compose.md) · [Lab 3](labs/lab-03-redis.md) · [Lab 4](labs/lab-04-semantic-cache.md) · [Lab 5](labs/lab-05-background-jobs.md) · [Lab 6](labs/lab-06-observability.md) *(optional)*

### Project

[Overview](project/overview.md) · [Architecture](project/architecture.md) · [Backend](project/backend.md) · [API](project/api.md) · [Docker](project/docker.md) · [Azure](project/azure.md) · [Acceptance Criteria](project/acceptance-criteria.md)

### Interview & Validation

[Concepts](interview/concepts.md) · [System Design](interview/system-design.md) · [Coding](interview/coding.md) · [Cheat Sheet](interview/cheat-sheet.md) · [Quiz](checkpoints/quiz.md) · [Exit Criteria](checkpoints/exit-criteria.md)

---

## 7. Daily Checklist

| Day | Must Complete | Optional |
|-----|---------------|----------|
| 1 | Lab 1, FastAPI production patterns | Extra middleware patterns |
| 2 | Lab 2, Docker Compose multi-service | Health check deep dive |
| 3 | Lab 3, Redis cache + rate limits | Session store variant |
| 4 | Lab 4, semantic cache | Tune similarity threshold |
| 5 | Lab 5, ARQ background jobs | Celery comparison notes |
| 6 | Lab 6, OpenTelemetry + Langfuse | Custom dashboards |
| 7 | Capstone deploy + load smoke test | Azure Container Apps |

Details: [daily/](daily/)

---

## 8. Progress Tracker

```bash
cp progress.md ~/ai-learning/week-05-work/
```

---

## 9. Week Completion Criteria

| Gate | Requirement |
|------|-------------|
| **Knowledge** | Quiz ≥ 12/15 |
| **Build** | All [acceptance criteria](project/acceptance-criteria.md) checked |
| **Stack** | `docker compose up` boots API + Redis + worker |
| **Cache** | Semantic cache hit on paraphrased query (documented in `cache_report.json`) |
| **Observability** | Langfuse trace for at least one RAG request |
| **Checkpoint** | ≥ 4/5 interview self-assessment parts at hire-ready |

Proceed to Week 6 (Evaluation + Monitoring) only when all gates pass. See [checkpoints/progress-tracker.md](checkpoints/progress-tracker.md).
