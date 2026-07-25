# Lab 5: RAGAS Evaluation

> Week 3 Labs · [← README](README.md) · [RAGAS Theory](../theory/rag-evaluation-ragas.md)

> **Work dir:** `~/ai-learning/week-03-work/`

**Estimated cost:** $1–4 for 20–50 samples (generation + RAGAS judge)

**Goal:** Build golden dataset and produce `rag_eval_report.json` with RAGAS metrics.

When it works: report shows aggregate faithfulness, context precision/recall, answer relevancy plus per-sample breakdown.

---

## Task

1. Create `eval/golden_dataset.json` (≥20 pairs Day 5; expand to 50+ by Day 7)
2. Create `lab05_ragas_eval.py` that runs your full RAG pipeline per question
3. Evaluate with RAGAS; write `rag_eval_report.json`

### Golden pair schema

```json
{
  "id": "g001",
  "question": "What is the remote work equipment stipend?",
  "ground_truth_answer": "$500 annually for eligible remote employees.",
  "ground_truth_contexts": [
    "Equipment stipend: $500 annually for remote employees who..."
  ],
  "source_doc": "handbook.pdf",
  "source_page": 13,
  "difficulty": "keyword"
}
```

Include `difficulty`: `keyword` | `semantic` | `negative` (unanswerable).

### RAGAS run (illustrative)

```python
from ragas import evaluate
from ragas.metrics import faithfulness, context_precision, context_recall, answer_relevancy
from datasets import Dataset

dataset = Dataset.from_dict({
    "question": questions,
    "answer": predicted_answers,
    "contexts": retrieved_contexts_list,
    "ground_truth": ground_truths,
})
result = evaluate(dataset, metrics=[faithfulness, context_precision, context_recall, answer_relevancy])
```

Wire OpenAI via env vars per RAGAS docs.

### CLI

```bash
python lab05_ragas_eval.py --golden eval/golden_dataset.json --out rag_eval_report.json
```

---

## Expected output shape

```json
{
  "run_id": "2026-07-25T18:00:00Z",
  "pipeline_version": "hybrid_rrf_bge_rerank_v1",
  "embedding_model": "text-embedding-3-small",
  "num_samples": 22,
  "metrics": {
    "faithfulness": 0.78,
    "context_precision": 0.74,
    "context_recall": 0.69,
    "answer_relevancy": 0.81
  },
  "by_difficulty": {
    "keyword": {"faithfulness": 0.85, "n": 8},
    "semantic": {"faithfulness": 0.72, "n": 10},
    "negative": {"faithfulness": 0.91, "n": 4}
  },
  "per_sample": []
}
```

For **negative** questions, success = model refuses or says not in documents (high faithfulness to empty/wrong context).

---

## Acceptance

- [ ] ≥20 golden pairs with ground_truth from source docs (not LLM-generated)
- [ ] All four RAGAS metrics computed
- [ ] `pipeline_version` and embed model logged
- [ ] Identify worst 3 samples and note likely failure layer

---

## Next

[Day 5](../daily/day-05.md) → [Day 6 project build](../daily/day-06.md)
