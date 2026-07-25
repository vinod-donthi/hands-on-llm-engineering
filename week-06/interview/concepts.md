# Week 6 Interview — Concepts

> Week 6 · [← Cheat Sheet](cheat-sheet.md) · [System Design](system-design.md)

## Core questions

### 1. Why is eval the #1 production readiness signal for LLM apps?

**Strong answer:** LLM outputs are non-deterministic and regress silently on prompt/model/retrieval changes. Automated eval on a golden set with CI gates catches faithfulness and retrieval regressions before users do. Offline eval (CI) plus online sampling (Langfuse) closes the loop.

### 2. Explain your layered eval pipeline.

**Strong answer:** L1 DeepEval pytest on 5–10 samples every PR (~90s). L2 Promptfoo on prompt diffs. L3 full RAGAS on 30+ samples on merge to main. L4 red team weekly. L5 Langfuse online sample for drift. Short-circuit if L1 fails.

### 3. RAGAS faithfulness vs context recall — when does each drop?

**Strong answer:** Faithfulness drops when generation adds unsupported claims (prompt/model issue). Recall drops when retrieval misses ground-truth chunks (embedding/chunk/rerank issue). Fix the layer the metric points to — don't tune prompts for retrieval misses.

### 4. How do you calibrate LLM-as-judge?

**Strong answer:** Human-label 15–20 samples. Run pointwise judge with rubric. Target ≥80% agreement. Tune rubric for verbosity bias. Use different model for judge vs generator. Freeze rubric in Git. Re-calibrate on judge model change.

### 5. What is trace regression?

**Strong answer:** Beyond output metrics, store baseline span trees (chunk IDs, tool sequence, latency). Diff new runs — catch retrieval drift even when answer text still looks correct. Update baselines intentionally via PR.

### 6. How does your CI gate work?

**Strong answer:** Pin baseline faithfulness. Floor = baseline × (1 − 5%). Full RAGAS on main merge. Fail build if below floor. Upload artifacts. Baseline updates require explicit approval PR.

### 7. DeepEval vs RAGAS vs Promptfoo — when use each?

| Tool | Best for |
|------|----------|
| DeepEval | Fast pytest in CI, custom GEval rubrics |
| RAGAS | RAG-specific aggregate metrics, nightly baseline |
| Promptfoo | Prompt A/B, model matrix, red team |

### 8. How do you eval agents differently from RAG chat?

**Strong answer:** RAG: faithfulness + retrieval metrics. Agents: add trajectory eval — expected tool sequence, forbidden tools, max tool calls, task completion. Outcome-only eval misses wrong tool paths.

### 9. Red team vs quality eval?

**Strong answer:** Quality asks "correct answer?" Security asks "can I attack it?" Promptfoo red team for injection, jailbreak, PII exfil. Weekly/pre-release — not every PR. PII failure blocks release regardless of faithfulness.

### 10. Online vs offline eval?

**Strong answer:** Offline = golden set in CI, reproducible. Online = sample live traffic, catch queries golden set missed. Alert when online faithfulness drifts while CI still passes → expand golden set.

## Weak vs strong patterns

| Weak | Strong |
|------|--------|
| "We manually test before release" | "Golden set + CI gate; 5% regression block" |
| "We use GPT to check answers" | "Calibrated judge, 87% human agreement, rubric v2 in Git" |
| "RAGAS score was good" | "Faithfulness 0.79 vs 0.78 baseline, floor 0.741, recall 0.71 flagged for rerank tune" |

## Next

→ [System Design](system-design.md) · [Coding](coding.md)
