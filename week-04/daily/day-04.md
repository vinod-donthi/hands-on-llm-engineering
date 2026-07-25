# Day 4 — Memory, Planning & Reflection

> **You are here:** Day 4 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 3](day-03.md) |
| **Today's outcome** | Plan + findings memory; reflection loop with coverage score |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-04-work/` or `~/ai-learning/week-04-work/` |
| **Stop when** | `reflection_report.json` exists |

**Catch-up:** Lab 4 + deliverable; skim reflection Concepts only.

---

## Steps

### Step 1 — Theory: Memory & planning (~30 min)

Read [agent-memory-planning.md](../theory/agent-memory-planning.md) — plan node, working memory, summarization.

### Step 2 — Theory: Reflection (~25 min)

Read [reflection-self-correction.md](../theory/reflection-self-correction.md) — coverage_score, routing.

### Step 3 — Lab spec (~10 min)

Read [Lab 4](../labs/lab-04-memory-reflection.md).

### Step 4 — Code: extend graph (~2.5h)

Add `plan`, `findings`, `reflect` nodes. Integrate Week 3 `doc_search` as a tool. Run:

```bash
python lab04_memory_reflection.py
```

Use a question that requires **both** web and doc sources.

### Step 5 — Deliverable

- [ ] `reflection_report.json` — plan, findings, at least one reflection with `coverage_score`
- [ ] Agent re-searches when coverage is low (visible in trace)

### Step 6 — Close out (~15 min)

- [ ] Mark Day 4 in [progress.md](../progress.md)

---

## Done when

- [ ] `reflection_report.json` in work dir
- [ ] Day 4 row checked in `progress.md`

---

## Tomorrow

**→ [Day 5 — Human-in-the-Loop](day-05.md)** — start with [human-in-the-loop.md](../theory/human-in-the-loop.md)
