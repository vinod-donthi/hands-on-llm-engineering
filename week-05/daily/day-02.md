# Day 2 — Docker Compose Multi-Service

> **You are here:** Day 2 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 1 — FastAPI Production](day-01.md) |
| **Today's outcome** | `docker compose up` boots API + Redis with passing healthchecks |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-05-work/` or `~/ai-learning/week-05-work/` |
| **Stop when** | `docker compose ps` shows `healthy` for api and redis |

**Catch-up:** skip to Step 4 (Compose file) + Step 6 (verify).

---

## Steps

### Step 1 — Theory: Docker Compose (~25 min)

Read [docker-compose.md](../theory/docker-compose.md) — service graph, env files, healthchecks, depends_on.

### Step 2 — Lab spec (~10 min)

Read [Lab 2](../labs/lab-02-docker-compose.md).

### Step 3 — Project docker spec (~15 min)

Skim [project/docker.md](../project/docker.md) for target topology.

### Step 4 — Write Compose + Dockerfile (~90 min)

Create `production-ai-stack/docker-compose.yml` with at least:

- `api` — builds from `backend/Dockerfile`, exposes 8000
- `redis` — `redis:7-alpine`, volume optional

Wire `/ready` to ping Redis (fail until Redis up).

### Step 5 — Boot and verify (~60 min)

```bash
cd ~/ai-learning/week-05-work/production-ai-stack
docker compose up -d --build
docker compose ps
curl -s http://localhost:8000/health | jq .
curl -s http://localhost:8000/ready | jq .
```

### Step 6 — Deliverable

- [ ] Both services `healthy` in `docker compose ps`
- [ ] `/ready` returns `"redis": "ok"` when stack is up

### Step 7 — Close out (~15 min)

- [ ] Mark Day 2 in [progress.md](../progress.md)

---

## Done when

- [ ] Compose stack runs from cold start without manual steps
- [ ] Day 2 row checked in `progress.md`

---

## Tomorrow

**→ [Day 3 — Redis Patterns](day-03.md)** — start with [redis-patterns.md](../theory/redis-patterns.md)
