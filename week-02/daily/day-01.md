# Day 1 — OpenAI & Anthropic APIs

> **You are here:** Day 1 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Start Here](../START-HERE.md) (setup once) |
| **Today's outcome** | Three-provider smoke test; Anthropic adapter working |
| **Time** | 3–4h (hard cap 5h) |
| **Work dir** | `week-02-work/` or `~/ai-learning/week-02-work/` |
| **Stop when** | `provider_smoke_results.json` exists |

**Catch-up:** skip to Step 5 (lab) if needed; skim theory Concepts only.

---

## Steps

### Step 1 — Theory: OpenAI API (~25 min)

Read [openai-api.md](../theory/openai-api.md) — Concepts, error table, checkpoint.

### Step 2 — Theory: Anthropic API (~25 min)

Read [anthropic-api.md](../theory/anthropic-api.md) — focus on system prompt placement and content blocks.

### Step 3 — Lab spec (~10 min)

Read [Lab 1](../labs/lab-01-provider-apis.md).

### Step 4 — Scaffold project (~30 min)

```bash
cd week-02-work
source .venv/bin/activate
mkdir -p model-benchmark-studio/backend/app/providers
# Copy Week 1 providers if available (see README)
```

### Step 5 — Code: provider smoke test (~90 min)

Implement `AnthropicProvider` alongside existing OpenAI + Ollama. Run:

```bash
python lab01_provider_smoke.py
```

### Step 6 — Deliverable

- [ ] `provider_smoke_results.json` — one row per provider with latency, tokens, cost, error
- [ ] All three providers return text for a simple prompt (or documented failure)

### Step 7 — Close out (~15 min)

- [ ] Self-test checkpoint questions in theory files
- [ ] Mark Day 1 in [progress.md](../progress.md)

---

## Done when

- [ ] `provider_smoke_results.json` in work dir
- [ ] Day 1 row checked in `progress.md`

---

## Tomorrow

**→ [Day 2 — Open Source & Model Registry](day-02.md)** — start with [open-source-models.md](../theory/open-source-models.md)
