# Docker Compose

> Week 2 Project · Day 6 · [Lab 6](../labs/lab-06-run-history.md)

## `docker-compose.yml`

```yaml
services:
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: benchmark
      POSTGRES_PASSWORD: benchmark
      POSTGRES_DB: benchmark_studio
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U benchmark"]
      interval: 5s
      timeout: 5s
      retries: 5

  backend:
    build: ./backend
    ports:
      - "8000:8000"
    environment:
      DATABASE_URL: postgresql+asyncpg://benchmark:benchmark@postgres:5432/benchmark_studio
    env_file:
      - .env
    depends_on:
      postgres:
        condition: service_healthy

volumes:
  pgdata:
```

Frontend stays on host `npm run dev` for hot reload — full containerization in Week 5.

## Commands

```bash
docker compose up -d
docker compose logs -f backend
docker compose down
```

## Local dev without Docker

Use `DATABASE_URL` pointing to a local Postgres, or skip Lab 6 with in-memory `run_store`.

## Security notes

- Default password is for **local dev only**.
- Never commit `.env` with real keys into images — use `env_file` at runtime.
