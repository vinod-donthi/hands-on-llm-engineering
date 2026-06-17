# Labs Overview

> Week 1 Labs · [← README](../README.md) · [Project](../project/overview.md)

Six labs — **5 required, 1 optional** (skip Lab 2 or Lab 6 if behind). Labs 1–3 are standalone scripts. Labs 4–5 build the backend. Lab 6 benchmarks local inference.

| Lab | Link | Required |
|-----|------|----------|
| 1 | [lab-01-tokenization.md](lab-01-tokenization.md) | Yes |
| 2 | [lab-02-embeddings.md](lab-02-embeddings.md) | Yes* |
| 3 | [lab-03-sampling.md](lab-03-sampling.md) | Yes |
| 4 | [lab-04-provider-abstraction.md](lab-04-provider-abstraction.md) | Yes |
| 5 | [lab-05-model-comparison.md](lab-05-model-comparison.md) | Yes |
| 6 | [lab-06-local-benchmark.md](lab-06-local-benchmark.md) | Optional |

*Skippable per [roadmap](../roadmap.md).

**Models:** GPT-4o Mini (cloud) + Llama 3.1 8B (local). See [evaluation rubric](../project/evaluation-rubric.md).

### Prerequisites

**Work path** (all lab code and deliverables go here — not in the curriculum repo):

```bash
# One-time — from Learning/week-01/
./scripts/setup-work.sh                    # default ~/ai-learning/week-01-work
# ./scripts/setup-work.sh ~/my/custom/path

# Every session
cd ~/ai-learning/week-01-work
source .venv/bin/activate
```

Package list: [requirements.txt](../requirements.txt) (copied into work dir by setup script).

Edit `~/ai-learning/week-01-work/.env` (from `.env.example`) — never commit:

```bash
OPENAI_API_KEY=sk-...
OLLAMA_BASE_URL=http://localhost:11434
```

### Cost Guidance for Labs

| Lab | Estimated Cost | Notes |
|-----|---------------|-------|
| Lab 1 | $0 | Local tokenization only |
| Lab 2 | $0–0.05 | Use Ollama `nomic-embed-text` (free) or OpenAI embed small |
| Lab 3 | $0.10–0.30 | GPT-4o Mini; cap at 10 runs |
| Lab 4 | $0–0.15 | Ollama free; 2–3 GPT-4o Mini calls for smoke test |
| Lab 5 | $0.10–0.50 | Parallel compare; cap at 3 models × 2 prompts |
| Lab 6 | $0 | Local Ollama only — inference benchmark |

**Weekly cloud spend target (disciplined):** $1–4 total (reduced vs. original plan).

### Evaluation Scoring

Use the [evaluation rubric](../project/evaluation-rubric.md) for Labs 3, 5, 6, and the Day 7 capstone.

---
