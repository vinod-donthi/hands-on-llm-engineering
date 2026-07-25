# Lab 4: Agentic RAG Integration

> Week 7 Labs · [← README](README.md) · [Agentic RAG Theory](../theory/agentic-rag.md)

> **Work path:** `~/ai-learning/week-07-work/`

**Estimated cost:** $0.50–2.00 (multi-step retrieval + grader calls)

**Goal:** LangGraph agentic RAG beats classic single-shot RAG on multi-hop golden cases.

---

## Task

Implement `app/graph/agentic_rag.py` with nodes:

| Node | Responsibility |
|------|----------------|
| `plan_query` | Decompose question into 1–2 search queries |
| `retrieve` | Hybrid search (BM25 + dense from Week 3) |
| `grade_context` | Structured `{sufficient, missing}` |
| `rewrite_query` | New query from `missing` field |
| `generate` | Answer with `[doc_id:chunk]` citations |

```bash
python lab04_agentic_rag_eval.py \
  --cases data/golden/multihop.jsonl \
  --max-steps 3 \
  --output agentic_rag_trace.json
```

### Sample multihop case (`data/golden/multihop.jsonl`)

```json
{"question": "Does EU retention match US SOC2 backup window?", "requires_hops": 2, "expected_citations": ["eu-policy", "soc2-appendix"]}
```

### Expected output: `agentic_rag_trace.json`

```json
{
  "cases": [
    {
      "question": "Does EU retention match US SOC2 backup window?",
      "classic_rag": {"faithfulness": 0.4, "steps": 1},
      "agentic_rag": {
        "faithfulness": 0.9,
        "steps": [
          {"node": "retrieve", "query": "EU data retention policy", "chunks": 4},
          {"node": "grade_context", "sufficient": false, "missing": "US SOC2 backup"},
          {"node": "rewrite_query", "query": "SOC2 appendix backup retention"},
          {"node": "retrieve", "chunks": 3},
          {"node": "generate", "answer": "...", "citations": ["eu-policy:2", "soc2-appendix:1"]}
        ]
      }
    }
  ],
  "summary": {"agentic_wins": 4, "classic_wins": 1, "ties": 0}
}
```

---

## Acceptance

- [ ] Graph runs without infinite loop (`max_steps` enforced)
- [ ] ≥5 multihop cases evaluated
- [ ] Agentic wins on ≥3 cases vs classic OR documented corpus limitation
- [ ] Trace includes per-step queries and chunk counts

---

## Next

[Day 5](../daily/day-05.md) → [Lab 5](lab-05-long-context-benchmark.md)
