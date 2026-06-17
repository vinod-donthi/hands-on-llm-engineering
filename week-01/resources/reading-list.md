# Reading List

> Week 1 · [← README](../README.md) · [Theory index](../theory/README.md)

Each theory file has a **Go Deeper** section with topic-specific links. Use this page for cross-week references and official docs.

### Official Documentation (Priority Order)

| Resource | URL | Why Read It |
|----------|-----|-------------|
| OpenAI API Docs | https://platform.openai.com/docs | Token usage, models, structured outputs |
| OpenAI Structured Outputs | https://platform.openai.com/docs/guides/structured-outputs | JSON schema mode vs JSON mode |
| Anthropic Docs | https://docs.anthropic.com | Messages API, prompt design, context management |
| Google AI Studio | https://ai.google.dev/docs | Gemini API, multimodal basics |
| OpenRouter Docs | https://openrouter.ai/docs | Unified API for cheap multi-model experimentation |
| Ollama Docs | https://github.com/ollama/ollama/blob/main/docs/api.md | Local model serving |
| Hugging Face Transformers | https://huggingface.co/docs/transformers | Tokenizers, model architecture reference |
| tiktoken | https://github.com/openai/tiktoken | Token counting for OpenAI models |

### Research Papers

| Paper | Link | Focus |
|-------|------|-------|
| Attention Is All You Need | https://arxiv.org/abs/1706.03762 | Original transformer architecture |
| Training language models to follow instructions (InstructGPT) | https://arxiv.org/abs/2203.02155 | Instruction tuning + RLHF pipeline |
| Language Models are Few-Shot Learners (GPT-3) | https://arxiv.org/abs/2005.14165 | In-context learning |
| Chinchilla (optional) | https://arxiv.org/abs/2203.15556 | Compute-optimal training — informs why model sizes exist |

### Blogs and Visual Guides

| Resource | Link | Focus |
|----------|------|-------|
| The Illustrated Transformer (Jay Alammar) | https://jalammar.github.io/illustrated-transformer/ | Visual intuition for attention |
| The Illustrated GPT-2 | https://jalammar.github.io/illustrated-gpt2/ | Decoder-only autoregressive generation |
| Lilian Weng: Prompt Engineering | https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/ | Comprehensive prompt techniques |
| Lilian Weng: LLM Powered Autonomous Agents | https://lilianweng.github.io/posts/2023-06-23-agent/ | Preview of Week 4 |

### GitHub Repositories

| Repo | Link | Focus |
|------|------|-------|
| openai/tiktoken | https://github.com/openai/tiktoken | Token counting |
| ollama/ollama | https://github.com/ollama/ollama | Local model runtime |
| encode/httpx | https://github.com/encode/httpx | Async HTTP for provider implementations |
| fastapi/fastapi | https://github.com/fastapi/fastapi | Backend framework patterns |
| feedparser | https://github.com/kurtmckee/feedparser | RSS/Atom parsing (Lab 6, AI Radar preview) |

### RSS and Ingestion (AI Radar Preview)

| Resource | URL | Why Read It |
|----------|-----|-------------|
| RSS 2.0 Specification | https://www.rssboard.org/rss-specification | Feed structure: `item`, `title`, `link`, `pubDate` |
| arXiv cs.AI RSS | https://rss.arxiv.org/rss/cs.AI | Real feed for Lab 6 ingestion exercise |
| robots.txt (overview) | https://developers.google.com/search/docs/crawling-indexing/robots/intro | Crawling etiquette before Week 8 |

### Recommended Reading Order (Week 1)

1. [Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/) — Day 1 ([theory/transformers.md](../theory/transformers.md))
2. OpenAI API Docs — Models + Token usage — Day 1
3. [InstructGPT paper](https://arxiv.org/abs/2203.02155) abstract — Day 4
4. [Lilian Weng — Prompt Engineering](https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/) — Day 5
5. [OpenAI Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs) — Day 4–5
6. arXiv RSS + feedparser — Day 6 ([rss-ingestion-primer.md](../theory/rss-ingestion-primer.md))

---
