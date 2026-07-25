# AI Radar — Docker Deployment

> Week 8 Capstone · [Architecture](architecture.md) · [Backend](backend.md)

> **Work dir:** `~/ai-learning/week-08-work/ai-radar/`

---

## Compose services

| Service | Image / build | Port | Purpose |
|---------|---------------|------|---------|
| `postgres` | `pgvector/pgvector:pg16` | 5432 | Documents + embeddings |
| `redis` | `redis:7-alpine` | 6379 | Semantic cache |
| `backend` | Dockerfile | 8000 | FastAPI |
| `worker` | Same image | — | Celery worker + beat |
| `frontend` | Dockerfile | 3000 | Next.js |

---

## Sample `docker-compose.yml`

```yaml
services:
  postgres:
    image: pgvector/pgvector:pg16
    environment:
      POSTGRES_USER: radar
      POSTGRES_PASSWORD: radar
      POSTGRES_DB: ai_radar
    ports: ["5432:5432"]
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U radar"]
      interval: 5s
      retries: 5

  redis:
    image: redis:7-alpine
    ports: ["6379:6379"]

  backend:
    build: ./backend
    env_file: .env
    ports: ["8000:8000"]
    depends_on:
      postgres: { condition: service_healthy }
      redis: { condition: service_started }

  worker:
    build: ./backend
    command: celery -A app.jobs.celery_app worker -B -l info
    env_file: .env
    depends_on: [backend, postgres, redis]

  frontend:
    build: ./frontend
    environment:
      NEXT_PUBLIC_API_URL: http://localhost:8000
    ports: ["3000:3000"]
    depends_on: [backend]
```

---

## Backend Dockerfile (sketch)

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

Run migrations on startup via entrypoint script or `alembic upgrade head` in Makefile.

---

## First boot

```bash
cd ai-radar
cp .env.example .env   # fill keys
docker compose up -d --build
docker compose exec backend alembic upgrade head
docker compose exec backend python -m app.jobs.run_ingestion
curl localhost:8000/api/v1/health
open http://localhost:3000
```

**Expected:** health OK, feed populates after ingestion.

---

## Volumes

| Volume | Mount | Why |
|--------|-------|-----|
| `pgdata` | `/var/lib/postgresql/data` | Persist corpus between restarts |
| Optional | `./artifacts` | Eval reports in dev |

---

## Production hardening (Day 7)

- [ ] Non-root user in Dockerfile
- [ ] Secrets via env — not baked in image
- [ ] Healthchecks on all services
- [ ] Resource limits (`mem_limit`) on worker
- [ ] `.dockerignore` — exclude `.venv`, `node_modules`

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `extension vector does not exist` | Use `pgvector/pgvector` image; run `CREATE EXTENSION vector` |
| Worker silent | Check Redis URL; Celery broker defaults |
| Frontend can't reach API | CORS + `NEXT_PUBLIC_API_URL` |

---

## Next

[Azure (optional)](azure.md) · [Acceptance criteria](acceptance-criteria.md)
