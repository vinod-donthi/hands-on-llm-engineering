# Tokens and Tokenization

> Week 1 Theory · Day 1 · [← README](../README.md) · Prev: [transformers](transformers.md) · Next: [Lab 1](../labs/lab-01-tokenization.md)

Models read **tokens**, not words or characters. Tokenization drives **cost**, **context limits**, and **multilingual behavior** — measure it before every production prompt.

---

## Concepts

### What problem are we solving?

You paste a prompt into an API and get charged — but **not by character count**. Providers bill per **token**: subword chunks the model actually processes. The same English sentence can be 10 tokens in one model and 15 in another; code and JSON often cost more per character than plain prose.

If you skip tokenization, you will misestimate cost, hit context limits unexpectedly, and break cross-model comparisons.

### What is a token?

A **token** is a subword unit produced by a **tokenizer**. Common English words may be one token; rare words, code symbols, and non-Latin scripts split into multiple tokens.

| Text type | Typical behavior |
|-----------|------------------|
| Plain English | ~4 characters per token (rough estimate) |
| Code / JSON | More tokens per character (`{`, `"`, indentation) |
| CJK / emoji | Often more tokens than equivalent English |
| Rare proper nouns | Split into subwords |

### How tokenization works (BPE)

**Byte-Pair Encoding (BPE)** is the most common scheme (GPT family):

1. Start with character-level vocabulary
2. Iteratively merge the most frequent adjacent pairs
3. Common words → single tokens; rare words → subwords

```
"unhappiness" → ["un", "happiness"]
"ChatGPT"     → may be 1–2 tokens depending on vocab
```

Other schemes: **SentencePiece** (Llama), **byte-level BPE** (handles any Unicode without unknown tokens).

### Why this matters in production

| Impact | Detail |
|--------|--------|
| **Billing** | APIs charge per input + output [token](../resources/glossary.md#llm--week-1-terms) |
| **Context window** | Limits are in tokens, not characters |
| **Efficiency** | English often cheaper than code, JSON, CJK, emoji |
| **Cross-model compare** | Same prompt ≠ same token count across models ([Lab 1](../labs/lab-01-tokenization.md)) |

### AI engineer takeaway

Count tokens before shipping prompts — tokenizer differences across models break cost estimates and context budgets. Log token counts in your observability envelope from day one.

---

## Cost formula

```
total_cost = (input_tokens × input_price) + (output_tokens × output_price)
```

Output tokens are often priced **higher** than input tokens.

---

## Token Counting Tools

| Model family | Tool |
|--------------|------|
| OpenAI (GPT-4o Mini) | `tiktoken` |
| Anthropic | SDK token counter / API |
| Llama / local | Hugging Face `AutoTokenizer` |
| Quick estimate | Provider `/models` docs for rough chars/token |

**Week 1 Lab 1:** Compare `tiktoken` vs Llama tokenizer on code and JSON — expect ≥15% delta.

---

## Tradeoffs

| Factor | Impact |
|--------|--------|
| Verbose system prompts | Fixed token cost every request |
| Pretty-printed JSON in prompts | Wastes tokens |
| Long few-shot examples | Eats context budget fast |

---

## Best Practices

- Count tokens **before** shipping prompts; log counts in observability envelope.
- Use provider **prompt caching** for static system prompts (Week 2+).
- Minify JSON in high-volume paths.
- Budget: `system + history + RAG chunks + user message + reserved output ≤ context limit`.

---

## Common Mistakes

- Estimating cost by character count (30–50% error on code).
- Hitting context limits without measuring.
- Assuming all models tokenize identically (breaks cost comparison in Lab 5).

---

## Checkpoint

1. Why does JSON often use more tokens per character than plain English?
2. If input is 2,000 tokens and output is 500, which usually costs more per token?
3. What tool do you use for GPT-4o Mini token counts?

---

## Go Deeper

| Resource | Link | Why |
|----------|------|-----|
| OpenAI — Token counting | https://platform.openai.com/tokenizer | Interactive tokenizer |
| tiktoken repo | https://github.com/openai/tiktoken | Lab 1 dependency |
| Hugging Face Tokenizers docs | https://huggingface.co/docs/tokenizers | How BPE/SentencePiece work |
| OpenAI pricing | https://openai.com/api/pricing/ | GPT-4o Mini $/MTok |

---

## Next

[Lab 1](../labs/lab-01-tokenization.md) in work dir → mark [Day 1](../daily/day-01.md) done → **[Day 2](../daily/day-02.md)** starts with [attention.md](attention.md)
