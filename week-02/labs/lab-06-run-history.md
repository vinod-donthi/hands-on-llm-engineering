# Lab 6: PostgreSQL Run History

> Week 2 Labs · [← README](README.md) · [Docker](../project/docker.md) · **Optional**

> **Work dir:** `~/ai-learning/week-02-work/model-benchmark-studio/`

**Goal:** Persist every compare/stream run to Postgres; list via API.

**Skip if behind:** use in-memory list; note skip in [progress.md](../progress.md).

---

## Schema: `app/db/models.py`

```python
class Run(Base):
    __tablename__ = "runs"
    id = Column(UUID, primary_key=True, default=uuid4)
    request_id = Column(String, index=True)
    model_id = Column(String)
    provider_id = Column(String)
    prompt_preview = Column(String)  # first 200 chars
    input_tokens = Column(Integer)
    output_tokens = Column(Integer)
    cost_usd = Column(Float)
    latency_ms = Column(Float)
    ttft_ms = Column(Float, nullable=True)
    error = Column(String, nullable=True)
    created_at = Column(DateTime, server_default=func.now())
```

---

## Migrations

```bash
cd backend
alembic revision --autogenerate -m "runs table"
alembic upgrade head
```

Or `create_all` for week scope if Alembic feels heavy — document choice in README.

---

## API

`GET /api/v1/runs?limit=20` — newest first, no full prompt bodies (privacy).

Hook: after each successful `compare` or `stream` `done` event, `save_run()`.

---

## Docker

See [project/docker.md](../project/docker.md). Verify:

```bash
docker compose exec postgres psql -U benchmark -d benchmark_studio -c "SELECT count(*) FROM runs;"
```

---

## Acceptance

- [ ] ≥ 3 rows after exercising the UI
- [ ] `DATABASE_URL` from `.env` used by backend
- [ ] Runs survive backend restart

---

## Next

[Day 7 playbook](../daily/day-07.md)
