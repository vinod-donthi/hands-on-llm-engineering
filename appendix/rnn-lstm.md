# RNNs and LSTMs — Sequence Models Before Transformers

> Appendix · **Optional** — not required for Week 1 · [← Appendix](README.md) · Referenced from [Transformers](../week-01/theory/transformers.md)

Before transformers (2017), most NLP and sequence tasks used **recurrent neural networks (RNNs)** and their improved variant **LSTMs**. You do not need to build these in Week 1 — but understanding *why* they existed helps explain *why* transformers replaced them.

---

## The problem: language is a sequence

A sentence is not a bag of random words — **order matters**.

> "The dog bit the man" ≠ "The man bit the dog"

Models need to read text **left to right** (or both directions) and remember what came earlier when interpreting what comes next. That is a **sequence modeling** problem: input is a series of tokens; output may be another series (translation) or a single label (sentiment).

---

## RNN — Recurrent Neural Network

**What it does:** Processes one token at a time and carries a **hidden state** — a compact memory of everything seen so far — from step to step.

**Plain-language analogy:** Reading a book one word at a time while keeping a running mental summary. Each new word updates your summary.

```
word_1 → [memory] → word_2 → [updated memory] → word_3 → ...
```

**Strengths:**
- Natural fit for sequences (text, time series, speech)
- Can handle variable-length input
- Conceptually simple: same weights applied at each time step

**Weaknesses:**
- **Slow to train** — steps are sequential; hard to parallelize on GPUs
- **Vanishing gradients** — memory fades over long sequences; early words are "forgotten"
- **Short effective memory** — struggles with long-range dependencies ("The keys that I left in the drawer yesterday are ...")

**AI engineer takeaway:** RNNs were the default for early machine translation, speech, and sentiment before 2017. You will rarely deploy a plain RNN for NLP today, but the idea of "carry state across time steps" still appears in streaming and agent memory design.

---

## LSTM — Long Short-Term Memory

**What it does:** A specialized RNN with **gates** that control what to remember, forget, and output at each step — designed to keep useful information across longer spans.

**Plain-language analogy:** Instead of one scribbled note, you have a notebook with three actions at each word: *write this down*, *erase that*, *read from this page*.

**The three gates (intuition only):**

| Gate | Role |
|------|------|
| **Forget** | Drop information that is no longer relevant |
| **Input** | Add new information from the current token |
| **Output** | Decide what part of memory to expose for the next prediction |

**Strengths:**
- Much better than plain RNNs at **longer contexts** (dozens to hundreds of tokens)
- Dominated NLP from ~2014–2017 (Google Translate, early chatbots, speech)

**Weaknesses:**
- Still **sequential** — cannot process all tokens in parallel during training
- Expensive at scale compared to attention-based models
- Still struggles with very long documents (thousands of tokens)

**AI engineer takeaway:** When someone says "pre-transformer NLP," they often mean LSTMs. Interviewers may ask what problem transformers solved that LSTMs could not scale past.

---

## RNN/LSTM vs Transformer (why the switch happened)

| Dimension | RNN / LSTM | Transformer |
|-----------|------------|-------------|
| **How it reads** | One token at a time, left to right | All tokens at once via attention |
| **Training speed** | Sequential — slow on GPUs | Highly parallel — fast at scale |
| **Long-range links** | Degrades over distance | Direct links between any two tokens |
| **Memory mechanism** | Compressed hidden state | Attention weights over full context |
| **Industry default today** | Legacy / niche | GPT, Llama, Claude, BERT family |

The 2017 paper [*Attention Is All You Need*](https://arxiv.org/abs/1706.03762) showed that **self-attention** alone could match or beat LSTMs on translation — without recurrence. That unlocked training on much larger datasets and model sizes, which led directly to modern LLMs.

---

## Where you still hear about recurrence

- **Historical context** — papers and courses comparing "RNN era" vs "transformer era"
- **Time series** — some forecasting still uses LSTM-style models (outside core LLM work)
- **Edge / tiny models** — small recurrent models on devices (uncommon for chat LLMs)
- **Conceptual metaphor** — "the model remembers the conversation" — in practice, decoder-only LLMs use **KV cache + attention**, not LSTM cells

---

## Checkpoint (optional self-test)

1. Why does word order matter for language modeling?
2. What is the main training bottleneck of RNNs compared to transformers?
3. What problem did LSTM gates try to solve?
4. In one sentence: why did transformers largely replace LSTMs for NLP?

---

## Go deeper — external resources

| Resource | Link | Why |
|----------|------|-----|
| StatQuest — RNNs | https://www.youtube.com/watch?v=WCUNPb-5EYI | Visual intro to recurrence |
| StatQuest — LSTMs | https://www.youtube.com/watch?v=YCzL96nL7j0 | Gate intuition without heavy math |
| Colah — Understanding LSTM | https://colah.github.io/posts/2015-08-Understanding-LSTMs/ | Classic blog post with diagrams |
| Illustrated Transformer | https://jalammar.github.io/illustrated-transformer/ | See what replaced LSTMs (Week 1 required reading) |

---

## Back to Week 1

Continue the required path: [transformers.md](../week-01/theory/transformers.md) · [tokenization.md](../week-01/theory/tokenization.md)
