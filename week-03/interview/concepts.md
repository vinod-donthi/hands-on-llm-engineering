# Week 3 Interview — Concepts

> Week 3 · [← Cheat Sheet](cheat-sheet.md) · [System Design](system-design.md)

## Retrieval fundamentals

**1. What is RAG and why not fine-tune for every doc update?**  
RAG retrieves relevant chunks at query time and grounds the LLM answer. Fine-tuning is expensive, slow to update, and does not cite sources. RAG wins when documents change frequently.

**2. Fixed vs semantic vs parent-child chunking?**  
Fixed splits by token count — simple, may cut mid-thought. Semantic splits on embedding similarity drops — better topic boundaries. Parent-child embeds small children, returns large parents to LLM — precise search + rich context.

**3. Why hybrid search instead of vectors alone?**  
Dense search misses exact tokens (SKUs, error codes, legal phrases). BM25 catches keywords; embeddings catch paraphrases. Hybrid improves recall on real enterprise queries.

**4. What is RRF and why use it?**  
Reciprocal Rank Fusion merges ranked lists without normalizing incompatible scores: `score(d) += 1/(k+rank)`. Robust default with k≈60.

**5. Bi-encoder vs cross-encoder?**  
Bi-encoder embeds query and doc separately — fast, pre-computable. Cross-encoder scores query+doc together — accurate but slow. Use bi-encoder for recall (top-50), cross-encoder for precision (top-5).

**6. Chroma vs pgvector?**  
Chroma: fast local dev. pgvector: production Postgres with ACLs, backups, SQL filters — one database for app + vectors.

**7. What is faithfulness in RAGAS?**  
Measures whether the generated answer is supported by retrieved context — catches hallucinations when retrieval was wrong or LLM ignored context.

**8. How do you debug a wrong RAG answer?**  
Check tuning order: ingestion → chunking → retrieval → rerank → prompt. Inspect retrieved chunks before blaming the LLM.

**9. When re-index after embedding model change?**  
Always full re-index — vectors from different models are incomparable.

**10. Agentic RAG vs single-shot?**  
Single-shot: one retrieve + generate. Agentic: loop retrieve/grade/re-query for multi-hop. Use agentic only when eval proves multi-hop failures and latency budget allows.

## Follow-up probes

- How big should chunks be? → Start 512/64, measure context recall on golden set.
- What if retrieval scores are all low? → Refuse to answer; don't let LLM freestyle.
- How cite sources? → SOURCE labels in context + structured citation in response.

## Practice

Explain your Doc Q&A Studio pipeline in 90 seconds: ingest → chunk → embed → hybrid → rerank → generate → cite → eval.

## Next

[System Design](system-design.md) · [Coding](coding.md)
