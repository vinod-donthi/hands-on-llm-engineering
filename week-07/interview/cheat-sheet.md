# Week 7 Interview Cheat Sheet

> [← README](../README.md) · Printable one-pager

## Decision matrix (quick)

| Need | Pick |
|------|------|
| Fresh docs | RAG / agentic RAG |
| Locked style, stable facts | LoRA fine-tune |
| Quick pilot | Prompt → bigger model |
| High QPS, narrow task | Distill + router |
| Summarize one huge doc | Long context (measure cost) |
| Themes across 10K docs | GraphRAG *(optional)* |

## LoRA

- Trains **adapters** not full weights · rank 8–32 typical
- Fine-tune **behavior**, RAG for **facts**
- OpenAI: JSONL `messages` → job → `ft:...` model id

## Agentic RAG loop

`plan → retrieve → grade → (rewrite → retrieve)* → generate` · **max 3 steps**

## Long context vs RAG

- Stuff = simple, expensive prefill, good for whole-doc summary
- RAG = cheaper per query, better multi-doc, needle precision

## MCP production

Auth header · rate limit · SSRF deny private IPs · `/health` · secrets in server env only

## ADR skeleton

Context → Decision → Options → Consequences → Metrics

## Your numbers (fill in)

| Metric | Baseline | Capstone |
|--------|----------|----------|
| Quality | | |
| p95 ms | | |
| $/1K req | | |

## Portfolio one-liner

*"Built Advanced AI Studio — [Track A fine-tuned triage | Track B agentic RAG] with ADR, beating baseline by X% at Y% lower cost."*

[Concepts](concepts.md) · [System Design](system-design.md)
