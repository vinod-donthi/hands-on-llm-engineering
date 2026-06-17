# Lab 1: Tokenization and Cost Estimation

> Week 1 Labs · [← README](../README.md) · [Project](../project/overview.md)

**Learning path:** This file (curriculum repo)
**Work dir:** `~/ai-learning/week-01-work/`

### Setup

```bash
cd ~/ai-learning/week-01-work
source .venv/bin/activate
```

**Goal:** Compare token counts across tokenizers and estimate API cost.

**File:** `lab01_tokenization.py`

```python
import tiktoken

PROMPTS = [
    "Explain transformer attention in 3 sentences.",
    "def fibonacci(n): ...",  # include a 20-line function in your version
    "Translate to Japanese: The meeting is at 3pm.",
    '{"user": "alice", "action": "purchase", "items": [1,2,3]}',
    "Summarize: " + "Lorem ipsum. " * 200,
]

def count_openai_tokens(text: str, model: str = "gpt-4o") -> int:
    enc = tiktoken.encoding_for_model(model)
    return len(enc.encode(text))

def estimate_cost(input_tokens: int, output_tokens: int,
                  input_price_per_m: float = 2.50,
                  output_price_per_m: float = 10.00) -> float:
    return (input_tokens * input_price_per_m / 1_000_000) + \
           (output_tokens * output_price_per_m / 1_000_000)

if __name__ == "__main__":
    for i, prompt in enumerate(PROMPTS, 1):
        tokens = count_openai_tokens(prompt)
        cost_500_out = estimate_cost(tokens, 500)
        print(f"Prompt {i}: {tokens} tokens | Est. cost (500 out): ${cost_500_out:.4f}")
```

**Tasks:**

1. Run the script on all 5 prompts:

```bash
cd ~/ai-learning/week-01-work
source .venv/bin/activate
python lab01_tokenization.py
```

2. Add a Hugging Face tokenizer for a Llama or Mistral model; compare counts vs. `tiktoken`.
3. Build a CSV with columns: `prompt_id`, `char_count`, `openai_tokens`, `llama_tokens`, `delta_pct`.

**Expected Output:** Table showing token count variance ≥15% between tokenizers on at least one code or JSON prompt.

**Deliverable:** `token_cost_report.csv` + 3-sentence observation on which prompt types are most expensive per character.

---

## Cost notes

- This lab uses **local token counting only** — no API calls, no spend.
- Default prices in the script (`$2.50` input / `$10.00` output per million tokens) are illustrative. Check [OpenAI pricing](https://openai.com/api/pricing/) for current GPT-4o rates before quoting costs in your report.
- Output tokens are typically priced higher than input tokens — a 500-token response often dominates cost for short prompts.

---
