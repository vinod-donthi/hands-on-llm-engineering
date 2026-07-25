# Doc Q&A Studio — Eval Spec

> Week 3 Project · [← Overview](overview.md) · [Acceptance Criteria](acceptance-criteria.md)

## Deliverable

`rag_eval_report.json` in work dir root — produced by `scripts/run_ragas_eval.py`.

## Golden dataset

**Location:** `~/ai-learning/week-03-work/eval/golden_dataset.json`

**Minimum size:** 50 pairs by Day 7

### Required fields per row

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique e.g. `g001` |
| `question` | string | User-style question |
| `ground_truth_answer` | string | Short factual answer from source |
| `ground_truth_contexts` | string[] | Supporting text spans |
| `source_doc` | string | Filename for audit |
| `difficulty` | enum | `keyword` \| `semantic` \| `negative` |

### Coverage requirements

| Category | Min count | Example |
|----------|-----------|---------|
| keyword | 15 | "equipment stipend $500" |
| semantic | 25 | "laptop allowance for WFH" |
| negative | 5 | Question not in any doc |
| multi-doc | 5 | Answer spans 2+ files |

**Negative questions:** ground_truth_answer = `"NOT_IN_CORPUS"` — success = model refuses or states info unavailable; faithfulness to empty/wrong context still measurable.

### Quality rules

- Ground truth written **from source text**, not from LLM answers
- No duplicate questions paraphrased <30% different
- Tag `source_page` when available for manual audit

## RAGAS metrics (required)

| Metric | Week 3 gate |
|--------|-------------|
| **faithfulness** | **≥ 0.75** aggregate |
| context_precision | Report (no hard gate) |
| context_recall | Report (no hard gate) |
| answer_relevancy | Report (no hard gate) |

## Report schema

```json
{
  "run_id": "uuid-or-iso-timestamp",
  "pipeline_version": "hybrid_rrf_bge_rerank_v1",
  "embedding_model": "text-embedding-3-small",
  "chat_model": "gpt-4o-mini",
  "chunk_strategy": "fixed_512_64",
  "num_samples": 52,
  "metrics": {
    "faithfulness": 0.81,
    "context_precision": 0.76,
    "context_recall": 0.72,
    "answer_relevancy": 0.79
  },
  "by_difficulty": {
    "keyword": {"faithfulness": 0.88, "n": 16},
    "semantic": {"faithfulness": 0.78, "n": 26},
    "negative": {"faithfulness": 0.85, "n": 5}
  },
  "worst_samples": [
    {"id": "g014", "faithfulness": 0.2, "likely_layer": "retrieval"}
  ],
  "per_sample": [
    {
      "id": "g001",
      "question": "...",
      "predicted_answer": "...",
      "faithfulness": 0.92,
      "context_recall": 0.85
    }
  ]
}
```

## CLI

```bash
cd doc-qa-studio/backend
python -m scripts.run_ragas_eval \
  --golden ../../eval/golden_dataset.json \
  --out ../../rag_eval_report.json \
  --pipeline-version hybrid_rrf_bge_rerank_v1
```

## Regression workflow

1. Baseline eval after Day 5 draft
2. Tune retrieval (hybrid, rerank, chunk size)
3. Re-run full 50+ eval
4. Compare `faithfulness` — must not drop >0.05 vs baseline without documented tradeoff

## CI placeholder (Week 6)

Same golden set will feed DeepEval pytest — keep JSON schema stable.

## Next

[acceptance-criteria.md](acceptance-criteria.md) · [Day 7 playbook](../daily/day-07.md)
