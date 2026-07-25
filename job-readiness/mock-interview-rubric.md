# Mock Interview Rubric

> [← Job Readiness](README.md) · Score yourself or ask a peer to score after a 45–60 min mock

---

## Session format

| Block | Time | Format |
|-------|------|--------|
| Concepts | 15 min | 5 questions from [interview-questions-30.md](interview-questions-30.md) |
| System design | 25 min | One whiteboard (RAG, agent, or AI Radar) |
| Coding | 15 min | Provider wrapper, chunking function, or eval metric stub |
| Your questions | 5 min | Questions you'd ask the hiring team |

---

## Scoring (1–5 per dimension)

### 1. Clarity (communication)

| Score | Description |
|-------|-------------|
| 1 | Rambling; jargon without definitions |
| 3 | Structured answer; defines terms on first use |
| 5 | Crisp problem → approach → tradeoffs → example from your project |

### 2. Depth (technical accuracy)

| Score | Description |
|-------|-------------|
| 1 | Wrong mechanism (e.g. "embeddings are keyword search") |
| 3 | Correct core idea; misses edge cases |
| 5 | Correct + names failure modes + cites what you built |

### 3. Tradeoffs (senior signal)

| Score | Description |
|-------|-------------|
| 1 | Single solution; no alternatives |
| 3 | Mentions one alternative |
| 5 | Compares 2+ options with when-to-use table; states what you'd pick and why |

### 4. Production awareness

| Score | Description |
|-------|-------------|
| 1 | Demo-only thinking |
| 3 | Mentions cost, latency, or eval |
| 5 | Observability + eval CI + failure recovery + cost estimate |

### 5. System design (whiteboard block only)

| Score | Description |
|-------|-------------|
| 1 | Missing major components |
| 3 | Reasonable boxes and arrows; vague on data flow |
| 5 | Clear ingestion/query/eval paths; scaling and failure modes addressed |

---

## Hire-ready thresholds

| Overall | Recommendation |
|---------|----------------|
| **≥ 4.0 average** | Hire-ready for AI Engineer (mid-level) |
| **3.0–3.9** | Solid; drill weak dimensions for 1–2 weeks |
| **< 3.0** | Revisit theory + rebuild deliverable for weak week |

**Rule of thumb:** Any dimension below **3** is a blocking gap — fix before applying.

---

## Self-assessment template

Copy after each mock:

```
Date:
Mock type: [ ] self [ ] peer [ ] professional

Concepts (avg): __ / 5
System design: __ / 5
Coding: __ / 5
Production awareness (avg across sections): __ / 5

Overall average: __ / 5

Weakest dimension:
Plan (1 week):
```

---

## Per-week checkpoint alignment

Each week includes [checkpoints/progress-tracker.md](../week-01/checkpoints/progress-tracker.md) with a 5-part self-assessment. Use this rubric for **cross-week** mocks before job applications; use weekly trackers during the program.
