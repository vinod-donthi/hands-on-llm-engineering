# Week 7 — Start Here

> One-time orientation · then live in [daily/day-01.md](daily/day-01.md)

**Prerequisite:** Week 3 RAG pipeline working · Week 4 LangGraph agent basics · Week 5 production patterns (Redis, Docker). Week 6 eval baseline recommended.

---

## 1. Setup (once)

```bash
cd Learning/week-07
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

Add to `.env` in your work dir:

- `OPENAI_API_KEY` (required — fine-tune, eval, agents)
- `AZURE_OPENAI_API_KEY` (optional — Azure fine-tune path)
- Copy Week 3/4 code if available (see [README](README.md#migrate-from-prior-weeks-recommended))

Never commit `.env`.

---

## 2. Your two folders

| | Where | What you do |
|---|--------|-------------|
| **Learning path** | `Learning/week-07/` | Read playbooks, theory, lab specs |
| **Work path** | `week-07-work/` or `~/ai-learning/week-07-work/` | Python, deliverables, `advanced-ai-studio/` |

---

## 3. Pick your capstone track (Day 1 decision)

Read [decision-framework.md](theory/decision-framework.md) on Day 1, then commit to **one** track for the week:

| Track | You build | Typical trigger |
|-------|-----------|-----------------|
| **A** | Fine-tuned domain assistant | Locked format/style, stable domain, high QPS |
| **B** | Agentic RAG module | Multi-hop docs, changing corpus, tools + retrieval |

You can revisit the other track after Week 7 — do not try both in one week unless you have extra time.

---

## 4. Every study session

```
Open daily/day-XX.md  →  follow steps 1…N  →  tick progress.md  →  Tomorrow link
```

Do **not** read all 8 theory files before Day 1. The daily playbook links only what you need that day.

---

## 5. First step

**→ [Day 1 playbook](daily/day-01.md)**
