# Lab 2: Docker Compose Multi-Service

> Week 5 Labs · [← README](README.md) · [Docker Theory](../theory/docker-compose.md)

> **Learning path:** This file — specs only.  
> **Work dir:** `~/ai-learning/week-05-work/production-ai-stack/`

## Setup

```bash
cd ~/ai-learning/week-05-work/production-ai-stack
docker compose version   # requires Compose v2
```

**Estimated cost:** $0

**Goal:** `docker compose ps` shows `api` and `redis` both **healthy**; curl to `/ready` confirms Redis connectivity from inside the API container network.

---

## Task

Create:

1. `backend/Dockerfile` — multi-stage Python 3.12, non-root user
2. `docker-compose.yml` — services `api`, `redis`
3. Update `/ready` to `PING` Redis using `REDIS_URL=redis://redis:6379/0`

### Expected `docker compose ps`

```
NAME                        STATUS                   PORTS
production-ai-stack-api-1   Up (healthy)             0.0.0.0:8000->8000/tcp
production-ai-stack-redis-1 Up (healthy)             6379/tcp
```

### Verify

```bash
docker compose up -d --build
docker compose ps
curl -s http://localhost:8000/ready | jq .
# Expected: {"ready": true, "checks": {"redis": "ok"}}
```

---

## Dockerfile checklist

- [ ] Copy `requirements.txt` before app code (layer cache)
- [ ] `CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]`
- [ ] `.dockerignore` excludes `.venv`

---

## Acceptance

- [ ] Cold start: `docker compose up -d --build` succeeds without manual Redis start
- [ ] Both services show `(healthy)` within 60s
- [ ] `/ready` fails when `redis` service stopped (`docker compose stop redis`)

---

## Next

Mark [Day 2](../daily/day-02.md) done → [Day 3 playbook](../daily/day-03.md)
