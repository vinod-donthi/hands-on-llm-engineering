# Day 2 — Open Source Models & YAML Registry

> **You are here:** Day 2 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 1](day-01.md) |
| **Today's outcome** | `models.yaml` drives provider routing; selection criteria documented |
| **Time** | 3–4h |
| **Work dir** | `week-02-work/` |
| **Stop when** | `pytest tests/test_model_registry.py` passes |

---

## Steps

### Step 1 — Theory: Open source (~20 min)

Read [open-source-models.md](../theory/open-source-models.md)

### Step 2 — Theory: Model selection (~20 min)

Read [model-selection.md](../theory/model-selection.md) — registry YAML example.

### Step 3 — Lab spec (~10 min)

Read [Lab 2](../labs/lab-02-model-registry.md)

### Step 4 — Implement registry loader (~90 min)

```bash
cd model-benchmark-studio/backend
# app/registry.py, config/models.yaml per lab spec
pytest tests/test_model_registry.py -v
```

### Step 5 — Wire registry to providers (~60 min)

Replace hardcoded `MODELS` dict with registry lookups in `main.py`.

### Step 6 — Deliverable

- [ ] `config/models.yaml` with ≥ 3 models
- [ ] `test_model_registry.py` green
- [ ] Short note in work dir: `model_selection_notes.md` (which model for which task — 5 bullets)

### Step 7 — Close out

- [ ] Mark Day 2 in [progress.md](../progress.md)

---

## Done when

- [ ] Registry tests pass
- [ ] `model_selection_notes.md` exists
- [ ] Day 2 checked in `progress.md`

---

## Tomorrow

**→ [Day 3 — Streaming](day-03.md)** — [streaming.md](../theory/streaming.md)
