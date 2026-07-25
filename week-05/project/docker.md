# Production AI Stack — Docker

> Week 5 Project · [← API](api.md) · [Azure](azure.md)

## Target `docker-compose.yml`

```yaml
services:
  redis:
    image: redis:7-alpine
    ports: ["6379:6379"]
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 5s
      timeout: 3s
      retries: 5

  qdrant:
    image: qdrant/qdrant:v1.11.0
    ports: ["6333:6333"]
    volumes: ["qdrant_data:/qdrant/storage"]
    profiles: ["full"]  # optional — omit if not using Week 3 vectors

  api:
    build: ./backend
    ports: ["8000:8000"]
    env_file: .env
    environment:
      REDIS_URL: redis://redis:6379/0
      QDRANT_URL: http://qdrant:6333
    depends_on:
      redis:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8000/health"]
      interval: 10s
      timeout: 5s
      retries: 3

  worker:
    build: ./backend
    command: arq app.worker.WorkerSettings
    env_file: .env
    environment:
      REDIS_URL: redis://redis:6379/0
    depends_on:
      redis:
        condition: service_healthy
      api:
        condition: service_healthy

volumes:
  qdrant_data:
```

## Commands

```bash
# Full stack
docker compose up -d --build

# API + Redis only (minimal)
docker compose up -d api redis

# Logs
docker compose logs -f api worker

# Tear down
docker compose down
docker compose down -v   # remove volumes
```

## Dockerfile (backend)

```dockerfile
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.12-slim
RUN useradd -m appuser
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY app ./app
USER appuser
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

Add `curl` to runtime stage if using curl healthchecks, or switch to Python-based probe.

## Verify stack

```bash
docker compose ps
curl -s http://localhost:8000/ready | jq .
docker compose exec worker python -c "import arq; print('worker ok')"
```

## Troubleshooting

| Issue | Fix |
|-------|-----|
| API `unhealthy` | Check `docker compose logs api` — import errors |
| Worker exits | Redis URL must use hostname `redis` |
| Port 8000 in use | Change `ports: ["8001:8000"]` |
| Qdrant optional | Remove from `/ready` checks if profile not started |

## Next

[Azure deploy](azure.md) · [Lab 2](../labs/lab-02-docker-compose.md)
