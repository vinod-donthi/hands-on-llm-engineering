# Tokens and Tokenization

> Week 1 Theory · Day 1 · [← README](../README.md) · Prev: [transformers](transformers.md) · Next: [Lab 1](../labs/lab-01-tokenization.md)

Models do not read letters or whole words — they read **tokens** (subword chunks). Providers bill you per token. Context limits are in tokens. Lab 1 has you count them so cost surprises stop being mysterious.

---

## Concepts

### What problem are we solving?

You paste a prompt and get an invoice line like *"2,847 input tokens."* That number drives **cost**, **speed**, and whether you fit in the **context window**. If you guess from character count, you will be wrong — especially on code and JSON.

### What is a token?

A **token** is a chunk of text from a **tokenizer** — a model-specific splitting ruleset.

| Text | Might become | Note |
|------|--------------|------|
| `"hello"` | 1 token | Common English word |
| `"unhappiness"` | `["un", "happiness"]` | Split into subwords |
| `"ChatGPT"` | 1–2 tokens | Depends on vocabulary |
| `{"key": "value"}` | Many tokens | `{`, `"`, `:`, spaces each often cost extra |
| Emoji / CJK | Often more tokens per character | Than equivalent English |

**Rough rule of thumb for English prose:** ~4 characters per token. **Do not rely on this for code, JSON, or billing** — always count with the right tool.

### How BPE works

**Byte-Pair Encoding (BPE)** is the algorithm behind most modern LLM tokenizers (GPT's tiktoken, Llama's SentencePiece, and others). The goal is simple: build a vocabulary of useful chunks — whole common words when possible, smaller pieces when not — so the model sees a compact sequence of IDs instead of raw characters.

#### Step by step

1. **Start small** — Begin with every byte or character as its own token (plus a few special tokens like end-of-text).
2. **Count pairs** — Scan the training corpus and count which **adjacent pairs** appear most often (e.g. `"t" + "h"`, `"th" + "e"`, `"the" + " "`).
3. **Merge the winner** — Replace the most frequent pair with one new token. `"t" + "h"` might become a single token `th`.
4. **Repeat** — Run steps 2–3 thousands of times until you hit the target vocabulary size (often 32k–128k tokens for production models).

After training, **new text** is encoded at runtime: the tokenizer applies its learned vocabulary and merge rules to split your string into a sequence of token IDs. Exact algorithms differ by library (tiktoken vs SentencePiece), but the outcome is the same — text becomes numbered chunks the model understands.

#### Worked example (simplified)

Imagine a tiny corpus that says `"the cat"`, `"the dog"`, and `"cat sat"` over and over. Spaces count as separate pieces until merged — `" cat"` includes the leading space.

| Merge step | New token | Effect on `"the cat"` |
|------------|-----------|------------------------|
| 1 | `th` | `"th" + "e" + " cat"` |
| 2 | `the` | `"the" + " cat"` |
| 3 | `cat` | `"the" + " cat"` (one token for the common word) |

Rare words never seen enough to merge stay split: `"unhappiness"` might become `["un", "happiness"]` or similar — still readable to the model, just more tokens.

#### Why the same string tokenizes differently

Each model family ships its **own** merge table and vocabulary, trained on different data:

| Model family | Tokenizer | Same `"Hello, world!"` |
|--------------|-----------|-------------------------|
| GPT-4o Mini | tiktoken (BPE) | Often ~4 tokens |
| Llama 3.1 | SentencePiece (BPE variant) | Often ~4–5 tokens — not identical |

**Code and JSON** tokenize poorly on every model: `{`, `"`, `:`, and newlines often each cost a token — see the table under [What is a token?](#what-is-a-token) above.

**Different models → different token counts for the same string.** Lab 1 has you compare tokenizers on the same snippet instead of assuming one count.

#### What you do not need to memorize

You will not retrain a BPE vocabulary in Week 1. What matters for engineering:

- Tokenizers are **model-specific** — always use the tokenizer that matches the model you call.
- Common English compresses well; **code, JSON, and rare Unicode** do not.
- Billing and context limits use **token IDs**, not words or characters.

### Worked cost example

GPT-4o Mini pricing (verify current rates on OpenAI's site):

| | Tokens | Price per 1M | Cost |
|---|--------|--------------|------|
| Input | 2,000 | $0.15 | $0.00030 |
| Output | 500 | $0.60 | $0.00030 |
| **Total** | | | **$0.00060** |

Same prompt on Llama via Ollama: **$0** — but different token count and quality.

Lab 1: compare `tiktoken` vs Llama tokenizer on the **same** code snippet — expect **≥15% difference**.

### Why tokenization matters in production

| Impact | Example |
|--------|---------|
| **Billing** | 1M requests × 500 extra tokens = real money |
| **Context limit** | 120K-token PDF + history → overflow |
| **Cross-model compare** | "Same prompt" ≠ same tokens in Lab 5 |
| **Latency** | More tokens → longer prefill ([inference.md](inference.md)) |

### AI engineer takeaway

Count tokens before shipping prompts. Log `input_tokens` and `output_tokens` on every call from day one.

---

## Cost formula

```
total_cost = (input_tokens / 1e6 × input_price) + (output_tokens / 1e6 × output_price)
```

Output is often priced **higher** per token than input.

---

## Counting tools

| Model family | Tool |
|--------------|------|
| OpenAI (GPT-4o Mini) | `tiktoken` |
| Anthropic | SDK token counter |
| Llama / local | Hugging Face `AutoTokenizer` |

---

## Tradeoffs

| Choice | Effect |
|--------|--------|
| Verbose system prompt | Pays same token tax every request |
| Pretty-printed JSON in prompt | More tokens than minified |
| Long few-shot examples | Eats context fast |

---

## Best Practices

- Count before deploy; log in observability envelope.
- Minify JSON in high-volume paths.
- Budget: `system + history + RAG + user + reserved_output ≤ context_limit`.

---

## Common Mistakes

- Estimating cost from character count on code.
- Assuming all models tokenize identically.
- Ignoring system prompt tokens in every-call cost math.

---

## Checkpoint

1. Why does JSON often use more tokens than plain English?
2. Why might `"unhappiness"` use more tokens than `"hello"`?
3. Input 2,000 tokens + output 500 — which side usually costs more per token?
4. What tool counts tokens for GPT-4o Mini?

---

## Go Deeper

| Resource | Link | Why |
|----------|------|-----|
| OpenAI Tokenizer | https://platform.openai.com/tokenizer | Interactive |
| tiktoken repo | https://github.com/openai/tiktoken | Lab 1 |

---

## Next

[Lab 1](../labs/lab-01-tokenization.md) → **[Day 2](../daily/day-02.md)** starts with [attention.md](attention.md)
