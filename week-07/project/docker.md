# Advanced AI Studio — Docker

> Week 7 Project · [← Overview](overview.md)

## Compose services

| Service | Image / build | Port |
|---------|---------------|------|
| `api` | `./backend` Dockerfile | 8000 |
| `qdrant` | `qdrant/qdrant` | 6333 |
| `redis` | `redis:7-alpine` | 6379 |
| `mcp` | `./backend` MCP entrypoint *(Track B)* | 8080 |

## Quick start

```bash
cd ~/ai-learning/week-07-work/advanced-ai-studio
docker compose up -d --build
curl localhost:8000/health
curl localhost:8000/ready
```

## Sample `docker-compose.yml` sketch

```yaml
services:
  api:
    build: ./backend
    ports: ["8000:8000"]
    env_file: ../.env
    depends_on: [qdrant, redis]

  qdrant:
    image: qdrant/qdrant:latest
    ports: ["6333:6333"]
    volumes: [qdrant_data:/qdrant/storage]

  redis:
    image: redis:7-alpine
    ports: ["6379:6379"]

volumes:
  qdrant_data:
```

## Environment

Mount `.env` from work dir — never bake secrets into images.

Track A may run without Qdrant if pure fine-tune; Track B requires Qdrant healthy for `/ready`.

[← Overview](overview.md)
