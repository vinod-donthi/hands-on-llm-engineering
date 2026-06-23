# Week 1 — Daily Playbooks

> **Start here:** [Day 1](day-01.md) · [← Week README](../README.md) · [Where am I?](../WHERE-AM-I.md) · [Progress](../progress.md)

Each day is a **numbered playbook**. Follow steps in order — do not read all theory upfront.

**Work dir** (code + deliverables): `Learning/week-01-work/` in this repo, or `~/ai-learning/week-01-work/` if you used [setup-work.sh](../scripts/setup-work.sh).

---

## Week at a glance

| Day | Playbook | Theory (in order) | Lab / build | Deliverable(s) | **After day — you have** |
|-----|----------|-------------------|-------------|----------------|--------------------------|
| **1** | [day-01.md](day-01.md) | ai-vs-ml → transformers → tokenization | [Lab 1](../labs/lab-01-tokenization.md) | `token_cost_report.csv` | Token intuition + cost CSV |
| **2** | [day-02.md](day-02.md) | attention → embeddings | [Lab 2](../labs/lab-02-embeddings.md) *(skippable)* | `similarity_results.md` | Embedding similarity report |
| **3** | [day-03.md](day-03.md) | context-window → inference → temperature-top-p | [Lab 3](../labs/lab-03-sampling.md) | `sampling_analysis.md`, `sampling_grid_results.jsonl` | Sampling grid + analysis |
| **4** | [day-04.md](day-04.md) | training-vs-finetuning → hallucinations → structured-output | Writing (no new lab) | `rlhf_hallucination_summary.md` | Hallucination mitigation writeup |
| **5** | [day-05.md](day-05.md) | observability → prompt-engineering (skim) | [Lab 4](../labs/lab-04-provider-abstraction.md) | Backend :8000 + observability | `lab04_backend/` API |
| **6** | [day-06.md](day-06.md) | rss-ingestion-primer | [Lab 5](../labs/lab-05-model-comparison.md), [Lab 6](../labs/lab-06-local-benchmark.md) *(optional)* | `compare_sample_output.json` | + `/compare`, optional benchmark |
| **7** | [day-07.md](day-07.md) | — (build day) | [BUILD-GUIDE](../project/BUILD-GUIDE.md) + capstone | `capstone_comparison.json`, `model_comparison_report.md` | Week 1 complete |

---

## How to use each day

1. Open **only** that day's playbook (`day-XX.md`).
2. Complete steps **1 → N** in order.
3. Stop when **Done when** checkboxes are satisfied — not when theory is perfect.
4. Update [progress.md](../progress.md).
5. Open the **Tomorrow** link at the bottom.

**Catch-up mode** (behind schedule): do numbered **lab/build steps** and deliverables only; skim theory Concepts + AI engineer takeaway, skip Go Deeper.

**Finished Day 6 and confused?** → [WHERE-AM-I.md](../WHERE-AM-I.md) · [project/BUILD-GUIDE.md](../project/BUILD-GUIDE.md)

---

## Where else to look (not your daily driver)

| Resource | Use when |
|----------|----------|
| [WHERE-AM-I.md](../WHERE-AM-I.md) | "What's next?" after any day |
| [theory/README.md](../theory/README.md) | Map of topics by day — not a reading list |
| [project/BUILD-GUIDE.md](../project/BUILD-GUIDE.md) | Day 7 — labs → product |
| [project/CAPSTONE-PROMPTS.md](../project/CAPSTONE-PROMPTS.md) | Day 7 — five benchmark prompts |
| [roadmap.md](../roadmap.md) | Weekly outcomes, time budget, model scope |
| [resources/glossary.md](../resources/glossary.md) | Unknown term while reading |
| [appendix/](../../appendix/README.md) | Optional deep dives — never blocks the day |
