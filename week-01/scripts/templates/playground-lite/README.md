# Prompt Playground Lite

Week 1 capstone project — multi-model compare with observability.

Scaffolded by `Learning/week-01/scripts/scaffold-playground-lite.sh`.

## Prerequisites

- Python venv at `../.venv` (from setup-work.sh)
- `ollama serve` + `ollama pull llama3.1:8b`
- `OPENAI_API_KEY` in `../.env` for cloud compare

## Run

```bash
# Terminal 1 — API
cd backend
source ../../.venv/bin/activate
uvicorn app.main:app --reload --port 8000

# Terminal 2 — UI
cd frontend
npm install   # first time only
npm run dev
```

Open http://localhost:3000

## Enable CORS (required for browser → API)

Add to `backend/app/main.py` after creating `app = FastAPI(...)`:

```python
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_methods=["*"],
    allow_headers=["*"],
)
```

Or copy from `Learning/week-01/scripts/templates/playground-lite/backend-cors-snippet.py`.

## Tests

```bash
make test
# or: cd backend && pytest -q
```

## Day 7 checklist

- [ ] `/api/v1/extract` implemented
- [ ] Capstone: [CAPSTONE-PROMPTS.md](../../project/CAPSTONE-PROMPTS.md)
- [ ] [minimum-viable-week1.md](../../project/minimum-viable-week1.md) or full acceptance criteria

## Curriculum links

- [BUILD-GUIDE.md](../../project/BUILD-GUIDE.md)
- [frontend.md](../../project/frontend.md)
