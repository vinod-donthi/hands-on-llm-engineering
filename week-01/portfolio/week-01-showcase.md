# Week 1 Portfolio Showcase

> [Resume bullets](resume-bullets.md) · [Acceptance criteria](../project/acceptance-criteria.md)

## Artifact

**Prompt Playground Lite** — multi-model prompt comparison with observability and evaluation scoring.

## Demo Checklist

- [ ] Screen recording: compare same prompt on GPT-4o Mini + Llama 3.1 8B
- [ ] Show metrics bar (latency, tokens, cost, request_id)
- [ ] Demo JSON extraction with `parse_status: success`
- [ ] Demo partial failure (stop Ollama mid-compare → cloud still works)
- [ ] Export `capstone_comparison.json`

## Capstone Attachments

1. `capstone_comparison.json` — 5 prompts × models with scores
2. `model_comparison_report.md` — 1–2 page analysis
3. Architecture screenshot from [project/architecture.md](../project/architecture.md)

## Talking Points (interviews)

1. Why GPT-4o Mini for extraction and Llama for free iteration
2. How `test_compare_partial_failure` proves production thinking
3. JSON ladder vs naive `json.loads(prompt)`
4. What ships in Week 2 (persistence, streaming, registry)
