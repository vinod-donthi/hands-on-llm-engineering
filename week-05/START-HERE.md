# Week 5 — Start Here

> One-time orientation · then live in [daily/day-01.md](daily/day-01.md)

**Prerequisite:** Complete Week 3/4 exit criteria (RAG or agent service working locally) before starting.

---

## 1. Setup (once)

```bash
cd Learning/week-05
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Add to `.env` in your work dir:

- `OPENAI_API_KEY`
- `LANGFUSE_PUBLIC_KEY` and `LANGFUSE_SECRET_KEY` (create free project at [langfuse.com](https://langfuse.com) — Day 6)
- `REDIS_URL=redis://localhost:6379/0`

Never commit `.env`.

Optional: copy Week 3 RAG or Week 4 agent code as a head start (see [README](README.md#migrate-from-week-34-recommended)).

Install Docker Desktop before Day 2.

---

## 2. Your two folders

| | Where | What you do |
|---|--------|-------------|
| **Learning path** | `Learning/week-05/` | Read playbooks, theory, lab specs |
| **Work path** | `week-05-work/` or `~/ai-learning/week-05-work/` | Python, deliverables, `production-ai-stack/` |

---

## 3. Every study session

```
Open daily/day-XX.md  →  follow steps 1…N  →  tick progress.md  →  Tomorrow link
```

Do **not** read all 8 theory files before Day 1. The daily playbook links only what you need that day.

---

## 4. First step

**→ [Day 1 playbook](daily/day-01.md)**
