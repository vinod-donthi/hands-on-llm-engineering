# AI Engineering — 8-Week Learning Curriculum

A structured, hands-on path from experienced software engineer to **LLM systems, AI agents, and production AI products** — with interview readiness built in.

**Status:** Week 1 is fully implemented. Weeks 2–8 are defined in [prompt.md](prompt.md) and will be added using the same modular pattern.

---

## Quick start

| Step | Action                                                                            |
| ---- | --------------------------------------------------------------------------------- |
| 1    | Read [week-01/START-HERE.md](week-01/START-HERE.md) (one-time setup)              |
| 2    | Open [week-01/daily/day-01.md](week-01/daily/day-01.md) and follow numbered steps |
| 3    | Code in your **work directory** (see below)                                       |
| 4    | Track progress in [week-01/progress.md](week-01/progress.md)                      |

**Each study session:** open only **today's daily playbook** — do not read all theory upfront.

---

## Two folders (learning vs work)

|              | Learning path                       | Work path                                                    |
| ------------ | ----------------------------------- | ------------------------------------------------------------ |
| **Purpose**  | Read curriculum                     | Run labs, write code, store deliverables                     |
| **Location** | `week-01/` (this repo)              | `week-01-work/` in repo **or** `~/ai-learning/week-01-work/` |
| **Contains** | Markdown, specs, `requirements.txt` | `.venv`, Python scripts, `.env`, project code                |
| **Git**      | Committed curriculum                | `week-01-work/` is gitignored — your code stays local        |

Bootstrap work dir (optional):

```bash
cd week-01
chmod +x scripts/setup-work.sh
./scripts/setup-work.sh
```

---

## Repository layout

```
Learning/
├── README.md                 ← you are here
├── prompt.md                 ← master 8-week curriculum spec
├── cursor-context-guide.md   ← using Cursor without losing state
├── appendix/                 ← optional deep dives (never block week progress)
├── week-01/                  ← Week 1 curriculum (complete)
│   ├── START-HERE.md
│   ├── daily/                ← numbered playbooks (driver each day)
│   ├── theory/
│   ├── labs/
│   ├── project/
│   ├── checkpoints/
│   └── ...
├── week-02/ … week-08/      ← planned (see prompt.md)
└── .cursor/rules/            ← AI authoring conventions for this repo
```

---

## 8-week roadmap (overview)

| Week | Focus                                           | Capstone direction                      |
| ---- | ----------------------------------------------- | --------------------------------------- |
| 1    | LLM foundations, tokens, prompts, observability | Prompt Playground Lite                  |
| 2    | LLM engineering, APIs, streaming, abstraction   | Model benchmarking tool                 |
| 3    | RAG — chunking, embeddings, vector DB           | Document Q&A chatbot                    |
| 4    | AI agents, tools, MCP                           | Research agent                          |
| 5    | Production systems — FastAPI, Docker, scaling   | Deployed AI service                     |
| 6    | Evaluation, monitoring, tracing                 | Eval pipeline                           |
| 7    | Fine-tuning, LoRA, advanced patterns            | Fine-tuned assistant                    |
| 8    | Capstone                                        | AI Radar (full production-style system) |

Full requirements: [prompt.md](prompt.md)

---

## Week 1 entry points

| Resource                                                       | Use                                             |
| -------------------------------------------------------------- | ----------------------------------------------- |
| [week-01/START-HERE.md](week-01/START-HERE.md)                 | Orientation + setup                             |
| [week-01/daily/README.md](week-01/daily/README.md)             | Week-at-a-glance                                |
| [week-01/daily/day-XX.md](week-01/daily/)                      | **Today's steps** (one file per day)            |
| [week-01/progress.md](week-01/progress.md)                     | Completion tracker                              |
| [week-01/roadmap.md](week-01/roadmap.md)                       | Time budget, models, outcomes                   |
| [appendix/](appendix/README.md)                                | Optional tangents (classical ML, RNNs/LSTMs, …) |
| [week-01/resources/glossary.md](week-01/resources/glossary.md) | Term lookup while reading                       |

---

## Principles

- **Learning by building** — labs and a weekly project artifact, not theory-only
- **Production-minded** — observability, cost, failure handling from Week 1
- **Anti-burnout** — ~5h/day max; catch-up mode on each daily page
- **Optional depth** — appendix and Go Deeper links never block week completion

---

## License / usage

Personal learning curriculum. Adapt freely for your own study path.
