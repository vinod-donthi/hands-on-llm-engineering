# Guardrails

> Week 2 Theory · Day 5 · [← README](../README.md) · [Context Management](context-management.md)

**Guardrails** are checks before and after the model runs — block bad inputs, catch policy violations in outputs, and prevent your app from becoming a liability.

---

## Concepts

### What problem are we solving?

LLMs will follow malicious instructions, leak secrets from context, and generate harmful content if you let them. Guardrails are the **safety and policy layer** between users and providers.

### Two checkpoints

```mermaid
flowchart LR
    User --> IN[Input_Guardrails]
    IN -->|pass| LLM[Model]
    IN -->|block| Reject1[4xx_refusal]
    LLM --> OUT[Output_Guardrails]
    OUT -->|pass| User
    OUT -->|block| Reject2[Sanitize_or_refusal]
```

| Phase | Examples |
|-------|----------|
| **Input** | PII regex, prompt injection patterns, max length, blocklist topics |
| **Output** | Secret leakage scan, toxicity threshold, JSON schema validation |

### Week 2 minimum implementation

| Guardrail | Implementation |
|-----------|----------------|
| Max prompt length | Character + token limit |
| Empty prompt rejection | 422 validation |
| API key / secret patterns in output | Regex scan on response text |
| Cost cap | Reject if estimated cost > `MAX_COST_USD_PER_REQUEST` |
| Rate limit (basic) | In-memory counter per IP (stretch) |

### AI engineer takeaway

Guardrails are **deterministic code**, not another LLM call (usually). Add LLM-based moderation only when rules fail — it costs money and adds latency.

---

## Prompt injection (awareness)

Attackers embed "ignore previous instructions" in user content. Mitigations:

- Separate system from user clearly; never concatenate unsanitized HTML/docs into system.
- **Instruction hierarchy** — system rules win (provider-dependent).
- For RAG (Week 3): treat retrieved text as untrusted data, not instructions.

Week 2: log suspicious patterns; do not over-engineer.

---

## Provider-native safety

| Provider | Feature |
|----------|---------|
| OpenAI | Moderation API (optional), model refusals |
| Anthropic | Constitutional training, refusals |

Use provider refusals as a signal in benchmarks (`finish_reason`, empty content).

---

## Tradeoffs

| Rule-based guards | LLM moderator |
|-------------------|---------------|
| Fast, cheap, explainable | Catches nuance |
| False positives on edge cases | $ + latency per request |
| Required baseline | Layer on top |

---

## Best Practices

- Return consistent error shape: `{ "error": "guardrail_blocked", "rule": "pii_in_input" }`.
- Never echo blocked content back to the client.
- Audit guardrail triggers (metric: `guardrail_blocks_total{rule=}`).
- Test guardrails in unit tests — they regress easily.

---

## Common Mistakes

- Only output moderation, no input checks.
- Blocking legitimate JSON that contains regex false positives.
- Guardrails in the frontend only (bypass trivial).
- Using the same LLM to moderate itself with no fallback.

---

## Checkpoint

1. Name two input and two output guardrail examples.
2. Why prefer rule-based guards for Week 2?
3. What is prompt injection?
4. Where should cost-cap guardrails run?

---

## Go Deeper

| Resource | Why |
|----------|-----|
| [OWASP LLM Top 10](https://owasp.org/www-project-top-10-for-large-language-model-applications/) | Threat model |
| [NeMo Guardrails](https://github.com/NVIDIA/NeMo-Guardrails) | Optional framework — not required |
| [OpenAI moderation](https://platform.openai.com/docs/guides/moderation) | API option |

---

## Next

[cost-optimization.md](cost-optimization.md) → **Lab:** [Lab 5](../labs/lab-05-context-cost.md) → [Day 6 playbook](../daily/day-06.md)
