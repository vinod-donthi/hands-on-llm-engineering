# Glossary

> [← README](../README.md) · [References](references.md) · [Appendix (optional deep dives)](../../appendix/README.md)

Short definitions for terms used in Week 1. For classical ML and sequence-model topics (RNNs, LSTMs), see the [appendix](../../appendix/README.md) — **not required** for week completion.

---

## LLM & Week 1 terms

| Term | Definition |
|------|------------|
| **ALiBi** | Attention with Linear Biases — positional encoding that extends context without explicit position embeddings. See [transformers.md](../theory/transformers.md). |
| **Attention** | Mechanism letting tokens weight relevance of other tokens (Q/K/V). See [attention.md](../theory/attention.md). |
| **Autoregressive** | Generating one token at a time conditioned on prior tokens |
| **BERT** | Bidirectional Encoder Representations from Transformers — encoder-only model for understanding/embeddings, not text generation. See [transformers.md](../theory/transformers.md). |
| **BPE** | Byte-Pair Encoding — subword tokenization |
| **Causal mask** | Attention mask preventing decoder tokens from seeing future positions — required for left-to-right generation. See [attention.md](../theory/attention.md). |
| **CNN** | Convolutional Neural Network — deep learning architecture for grids (especially images); dominated vision before transformers. See [ai-vs-ml.md](../theory/ai-vs-ml.md). |
| **Context window** | Max tokens per request (input + output) |
| **Cross-entropy** | Loss function comparing predicted token probabilities to the true next token — standard training objective for LLMs. See [transformers.md](../theory/transformers.md). |
| **Decode** | Autoregressive generation phase — one output token per step using the KV cache. See [inference.md](../theory/inference.md). |
| **Decoder-only** | Transformer variant for generation (GPT, Llama). See [transformers.md](../theory/transformers.md). |
| **Embedding** | Dense vector representation of text for similarity search |
| **Encoder-decoder** | Two-stack transformer (read input, write output) — common for translation/summarization; less common for general chat. See [transformers.md](../theory/transformers.md). |
| **Hallucination** | Fluent but incorrect or unsupported output |
| **JSON mode** | API flag forcing valid JSON syntax only — does not guarantee schema compliance. See [structured-output.md](../theory/structured-output.md). |
| **KV cache** | Cached key/value tensors during decode |
| **LLM** | Large Language Model |
| **LoRA** | Low-Rank Adaptation — efficient fine-tuning by training small adapter matrices instead of full weights. See [training-vs-finetuning.md](../theory/training-vs-finetuning.md). |
| **Observability envelope** | Standard telemetry fields per LLM request. See [observability.md](../theory/observability.md). |
| **parse_status** | `success` \| `repaired` \| `parse_failure` |
| **PPO** | Proximal Policy Optimization — RL algorithm commonly used in the RLHF alignment step. See [training-vs-finetuning.md](../theory/training-vs-finetuning.md). |
| **Prefill** | Processing input prompt in parallel before decode |
| **RLAIF** | Reinforcement Learning from AI Feedback — preferences judged by another LLM instead of humans. See [training-vs-finetuning.md](../theory/training-vs-finetuning.md). |
| **RLHF** | Reinforcement Learning from Human Feedback — alignment stage after instruction tuning. See [training-vs-finetuning.md](../theory/training-vs-finetuning.md). |
| **RoPE** | Rotary Position Embedding — encodes token position by rotating attention vectors; supports long context. See [transformers.md](../theory/transformers.md). |
| **RSS** | XML feed format for content syndication. See [rss-ingestion-primer.md](../theory/rss-ingestion-primer.md). |
| **SFT** | Supervised Fine-Tuning — training on labeled (input, output) pairs after pre-training. See [training-vs-finetuning.md](../theory/training-vs-finetuning.md). |
| **Softmax** | Function turning logits into a probability distribution over choices (sums to 1). Used in attention weights and next-token sampling. See [attention.md](../theory/attention.md). |
| **Structured output** | Schema-constrained model response (JSON Schema / Pydantic) — stronger than JSON mode. See [structured-output.md](../theory/structured-output.md). |
| **Temperature** | Sampling randomness control |
| **Token** | Subword unit processed by the model |
| **Top-p** | Nucleus sampling — cumulative probability cutoff |
| **TTFT** | Time To First Token — latency until the first generated token appears; dominated by prefill. See [inference.md](../theory/inference.md). |

---

## Classical ML (optional)

| Term | Definition |
|------|------------|
| **Classical ML** | Supervised learning on tabular data (numbers, categories) — pre-deep-learning algorithms still dominant in industry. [Explore →](../../appendix/classical-ml.md) |
| **Logistic regression** | Linear model outputting a probability for binary classification (spam, fraud, churn). Fast and interpretable. [Explore →](../../appendix/classical-ml.md#logistic-regression) |
| **Random forest** | Ensemble of decision trees; votes or averages for robust tabular predictions. [Explore →](../../appendix/classical-ml.md#random-forests) |
| **Gradient boosting** | Sequential ensemble where each tree fixes prior errors; strong on tabular data. [Explore →](../../appendix/classical-ml.md#gradient-boosting-xgboost-lightgbm) |
| **XGBoost** | Popular gradient boosting library; common in fraud, ads, and ranking systems. [Explore →](../../appendix/classical-ml.md#gradient-boosting-xgboost-lightgbm) |
| **LightGBM** | Fast gradient boosting implementation; often used on large tabular datasets. [Explore →](../../appendix/classical-ml.md#gradient-boosting-xgboost-lightgbm) |
| **SHAP** | Method explaining which features drove a single prediction — common with tree models in regulated domains. [Explore →](../../appendix/classical-ml.md#explainability-shap-one-paragraph) |
| **Tabular data** | Structured rows and columns (spreadsheet/SQL shape) — classical ML's home turf vs unstructured text. |

---

## Sequence models (optional)

| Term | Definition |
|------|------------|
| **RNN** | Recurrent Neural Network — reads a sequence one step at a time, passing a hidden "memory" forward. Pre-transformer default for NLP. [Explore →](../../appendix/rnn-lstm.md#rnn--recurrent-neural-network) |
| **LSTM** | Long Short-Term Memory — RNN variant with gates to remember/forget across longer sequences. [Explore →](../../appendix/rnn-lstm.md#lstm--long-short-term-memory) |
| **Recurrence** | Processing tokens sequentially with carried state (RNN/LSTM style) vs all-at-once (transformer attention). [Explore →](../../appendix/rnn-lstm.md) |
| **Self-attention** | Mechanism where each token directly weighs all other tokens — the core idea transformers use instead of recurrence. See [attention.md](../theory/attention.md). |
| **Sequence modeling** | Predicting or generating ordered data (text, speech, time series). [Explore →](../../appendix/rnn-lstm.md#the-problem-language-is-a-sequence) |
