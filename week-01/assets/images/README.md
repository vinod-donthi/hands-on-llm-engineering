# Week 1 — Visual Assets

> Image inventory for theory, labs, and project docs. **Learning path only** — no secrets or generated lab output with API keys.

## Conventions

| Rule | Value |
|------|--------|
| **Location** | `week-01/assets/images/day-NN/` (theory) · `labs/` · `project/` |
| **Naming** | `{topic}-{concept}.svg` or `.png` |
| **Embed** | `![Alt text](../assets/images/day-NN/file.svg)` from theory files |
| **Caption** | Italic line below: *Figure: …* |
| **Formats** | Prefer **SVG** for diagrams; **PNG** for terminal/UI screenshots |

From `week-01/theory/tokenization.md`, use relative path: `../assets/images/day-01/…`

---

## Inventory

| File | Image | Status |
|------|-------|--------|
| [theory/tokenization.md](../theory/tokenization.md) | [day-01/tokenization-text-to-ids.svg](day-01/tokenization-text-to-ids.svg) | done |
| [theory/tokenization.md](../theory/tokenization.md) | [day-01/tokenization-bpe-merge-steps.svg](day-01/tokenization-bpe-merge-steps.svg) | done |
| [theory/tokenization.md](../theory/tokenization.md) | [day-01/tokenization-cross-model-bars.svg](day-01/tokenization-cross-model-bars.svg) | done |

---

## Phases (remaining)

| Phase | Scope | Status |
|-------|--------|--------|
| **0** | Conventions + `tokenization.md` | done |
| **1** | Day 1–2: ai-vs-ml, transformers, attention, embeddings | pending |
| **2** | Day 3: context, inference, temperature + Labs 1–3 screenshots | pending |
| **3** | Day 4–5: training, hallucinations, JSON, observability, prompts | pending |
| **4** | Project, RSS, cheat-sheet, START-HERE | pending |

---

## Style guide

- Light background (`#fafafa`), dark text (`#1a1a1a`)
- Accent blue `#2563eb` (model / tokenizer), accent orange `#ea580c` (cost / limits)
- Max width ~720px in SVG `viewBox`; figures should read on mobile GitHub preview
- Alt text: one sentence describing what to notice
- **SVG must be valid XML:** use `&quot;` for quotes, `&amp;` for ampersands, ASCII punctuation only (no smart quotes or special Unicode arrows)
