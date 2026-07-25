# Week 6 — Start Here

> One-time orientation · then live in [daily/day-01.md](daily/day-01.md)

**Prerequisite:** Complete [Week 5 exit criteria](../week-05/checkpoints/exit-criteria.md) before starting. Week 3 RAG golden dataset strongly recommended.

---

## 1. Setup (once)

```bash
cd Learning/week-06
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
npm install -g promptfoo@latest   # or use npx promptfoo
```

Add to `.env` in your work dir:

- `OPENAI_API_KEY`
- `LANGFUSE_PUBLIC_KEY` and `LANGFUSE_SECRET_KEY` (free tier at [langfuse.com](https://langfuse.com))

Never commit `.env`.

Optional: copy Week 3 golden dataset and Week 5 RAG service (see [README](README.md#migrate-from-week-35-recommended)).

---

## 2. Your two folders

| | Where | What you do |
|---|--------|-------------|
| **Learning path** | `Learning/week-06/` | Read playbooks, theory, lab specs |
| **Work path** | `week-06-work/` or `~/ai-learning/week-06-work/` | Python, Promptfoo configs, `eval-pipeline-studio/` |

---

## 3. Every study session

```
Open daily/day-XX.md  →  follow steps 1…N  →  tick progress.md  →  Tomorrow link
```

Do **not** read all 10 theory files before Day 1. The daily playbook links only what you need that day.

---

## 4. What you'll ship

By Day 7 you will have **Eval Pipeline Studio**:

- Layered eval: RAGAS → DeepEval → Promptfoo
- GitHub Actions CI gate (blocks > 5% regression)
- Langfuse dashboard for traces, cost, faithfulness drift
- Red-team and agent trajectory eval reports

---

## 5. First step

**→ [Day 1 playbook](daily/day-01.md)**
