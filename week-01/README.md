# Week 1 — Foundations of Modern AI + LLMs

**8-Week AI Engineering Curriculum · Part 1 of 8**

> **New here?** [START-HERE.md](START-HERE.md) → [Day 1 playbook](daily/day-01.md)

---

## 1. Overview

Week 1 builds LLM literacy and a portfolio artifact (**Prompt Playground Lite**) without infrastructure overload. You will understand transformers, tokens, inference, prompt design, structured outputs, and observability — then compare **GPT-4o Mini** (cloud) and **Llama 3.1 8B** (local) with production-style telemetry.

**Deferred to Week 2:** PostgreSQL history, SSE streaming, Docker Compose, YAML model registry.

---

## 2. Learning Path vs Work Path

| | Learning path | Work path |
|---|---------------|-----------|
| **Purpose** | Read curriculum | Write code, run labs, build project |
| **Location** | This repo — `Learning/week-01/` | `Learning/week-01-work/` **or** `~/ai-learning/week-01-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, lab scripts, deliverables, `prompt-playground-lite/` |
| **Git** | Curriculum (no secrets, no venv) | Your code repo (optional) |

### Study flow

```
1. Open today's playbook       → daily/day-XX.md     (numbered steps — your driver)
2. Read theory in step order   → only files linked from that day
3. Code in work directory      → week-01-work/ or ~/ai-learning/week-01-work/
4. Confirm deliverable         → Done when checkboxes on daily page
5. Update progress.md          → tick the day
6. Follow Tomorrow link        → next daily/day-XX.md
```

**Week map:** [daily/README.md](daily/README.md) · **When short on time:** catch-up mode on each daily page (lab + deliverable first). See [roadmap.md](roadmap.md).

---

## 3. Weekly Outcomes

- [ ] Explain transformers and attention without notes
- [ ] Complete Labs 1–5 (Lab 6 or Lab 2 optional skip)
- [ ] Prompt Playground Lite runs locally
- [ ] JSON extraction ladder works with `parse_status`
- [ ] Resiliency test passes (`test_compare_partial_failure`)
- [ ] Scored capstone report exported
- [ ] Quiz ≥ 80% · Coding assignment ≥ 70%

Full checklist: [checkpoints/exit-criteria.md](checkpoints/exit-criteria.md)

---

## 4. Folder Map

| Folder | Purpose |
|--------|---------|
| [START-HERE.md](START-HERE.md) | One-time orientation → Day 1 |
| [daily/](daily/) | **Numbered playbooks** — one file per day (start here each session) |
| [theory/](theory/) | Deep dives — one topic per file |
| [labs/](labs/) | Hands-on exercises |
| [project/](project/) | Prompt Playground Lite spec |
| [interview/](interview/) | Questions + cheat sheet |
| [checkpoints/](checkpoints/) | Quiz, exit criteria, progress |
| [resources/](resources/) | Reading, glossary, references |
| [appendix/](../appendix/) | **Optional** deep dives (classical ML, etc.) — never blocks week progress |
| [portfolio/](portfolio/) | Resume, LinkedIn, showcase |
| [requirements.txt](requirements.txt) | Python deps (copied to work path) |
| [scripts/setup-work.sh](scripts/setup-work.sh) | Bootstrap work directory |

---

## 5. Setup

### One-time: bootstrap work directory

From the curriculum repo:

```bash
cd week-01
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

This creates `~/ai-learning/week-01-work/`, copies `requirements.txt` and `.env.example`, creates `.venv`, and runs `pip install -r requirements.txt`.

Custom work location (argument or env — argument wins):

```bash
./scripts/setup-work.sh ~/projects/my-week-01
# or
WORK_DIR=~/projects/my-week-01 ./scripts/setup-work.sh
```

### Manual setup (equivalent)

```bash
mkdir -p ~/ai-learning/week-01-work
cd ~/ai-learning/week-01-work
cp /path/to/Learning/week-01/requirements.txt .
cp /path/to/Learning/week-01/.env.example .
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env   # then add API keys
```

### Every session

```bash
cd ~/ai-learning/week-01-work
source .venv/bin/activate
```

### Ollama (local model)

```bash
ollama pull llama3.1:8b
```

Edit `~/ai-learning/week-01-work/.env` with `OPENAI_API_KEY` (never commit). Pin exact versions in `requirements.txt` after completing the week if you want a frozen environment.

---

## 6. Navigation

### Theory

Full index: [theory/README.md](theory/README.md)

[AI vs ML](theory/ai-vs-ml.md) · [Transformers](theory/transformers.md) · [Attention](theory/attention.md) · [Embeddings](theory/embeddings.md) · [Tokenization](theory/tokenization.md) · [Context Window](theory/context-window.md) · [Inference](theory/inference.md) · [Training/RLHF](theory/training-vs-finetuning.md) · [Prompt Engineering](theory/prompt-engineering.md) · [Temperature](theory/temperature-top-p.md) · [Hallucinations](theory/hallucinations.md) · [Structured Output](theory/structured-output.md) · [Observability](theory/observability.md) · [RSS Primer](theory/rss-ingestion-primer.md)

### Labs
[Overview](labs/README.md) · [Lab 1](labs/lab-01-tokenization.md) · [Lab 2](labs/lab-02-embeddings.md) · [Lab 3](labs/lab-03-sampling.md) · [Lab 4](labs/lab-04-provider-abstraction.md) · [Lab 5](labs/lab-05-model-comparison.md) · [Lab 6](labs/lab-06-local-benchmark.md) *(optional)*

### Project
[Overview](project/overview.md) · [Architecture](project/architecture.md) · [Backend](project/backend.md) · [Frontend](project/frontend.md) · [API](project/api.md) · [Observability](project/observability.md) · [Evaluation Rubric](project/evaluation-rubric.md) · [Failure Recovery](project/failure-recovery.md) · [Acceptance Criteria](project/acceptance-criteria.md)

### Interview & Validation
[Concepts](interview/concepts.md) · [System Design](interview/system-design.md) · [Coding](interview/coding.md) · [Cheat Sheet](interview/cheat-sheet.md) · [Quiz](checkpoints/quiz.md) · [Exit Criteria](checkpoints/exit-criteria.md)

---

## 7. Daily Checklist

| Day | Must Complete | Optional |
|-----|---------------|----------|
| 1 | Lab 1, theory skim | Extra tokenizer comparison |
| 2 | Lab 2 | — |
| 3 | Lab 3 | — |
| 4 | Summary doc | InstructGPT paper |
| 5 | Lab 4, repo standards | — |
| 6 | Lab 5, UI scaffold | Lab 6 |
| 7 | Capstone + acceptance criteria | Portfolio docs |

Details: [daily/](daily/)

---

## 8. Progress Tracker

Copy [progress.md](progress.md) into your work directory and update daily:

```bash
cp progress.md ~/ai-learning/week-01-work/
```

---

## 9. Week Completion Criteria

| Gate | Requirement |
|------|-------------|
| **Knowledge** | Quiz ≥ 12/15 |
| **Build** | All [acceptance criteria](project/acceptance-criteria.md) checked |
| **Resiliency** | `test_compare_partial_failure` passes |
| **Capstone** | `capstone_comparison.json` + `model_comparison_report.md` |
| **Checkpoint** | ≥ 4/5 interview self-assessment parts at hire-ready |

Proceed to Week 2 only when all gates pass. See [checkpoints/progress-tracker.md](checkpoints/progress-tracker.md).
