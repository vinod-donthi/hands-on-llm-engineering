# Week 4 — Visual Assets

> Image inventory for theory, labs, and project docs. **Learning path only** — no secrets or generated lab output with API keys.

## Conventions

| Rule | Value |
|------|--------|
| **Location** | `week-04/assets/images/day-NN/` (theory) · `labs/` · `project/` |
| **Naming** | `{topic}-{concept}.svg` |
| **Embed** | `![Alt text](../assets/images/day-NN/file.svg)` from theory/labs/project files |
| **Caption** | Italic line below: *Figure: …* |
| **Formats** | **SVG** for diagrams and UI mockups |

From `week-04/theory/*.md`, use relative path: `../assets/images/day-NN/…`

From `week-04/START-HERE.md` (week root), use: `assets/images/project/…` (**no** `../`)

Style and validation: [.cursor/rules/learning-svg-assets.mdc](../../.cursor/rules/learning-svg-assets.mdc)

---

## Inventory

| File | Image | Status |
|------|-------|--------|
| [theory/react-loop-agent-vs-chain.md](../theory/react-loop-agent-vs-chain.md) | [day-01/react-loop-agent-vs-chain.svg](day-01/react-loop-agent-vs-chain.svg) | done |
| [theory/langgraph.md](../theory/langgraph.md) | [day-01/langgraph.svg](day-01/langgraph.svg) | done |
| [theory/openai-agents-sdk.md](../theory/openai-agents-sdk.md) | [day-02/openai-agents-sdk.svg](day-02/openai-agents-sdk.svg) | done |
| [theory/pydantic-ai.md](../theory/pydantic-ai.md) | [day-02/pydantic-ai.svg](day-02/pydantic-ai.svg) | done |
| [theory/mcp-protocol.md](../theory/mcp-protocol.md) | [day-03/mcp-protocol.svg](day-03/mcp-protocol.svg) | done |
| [theory/agent-memory-planning.md](../theory/agent-memory-planning.md) | [day-04/agent-memory-planning.svg](day-04/agent-memory-planning.svg) | done |
| [theory/reflection-self-correction.md](../theory/reflection-self-correction.md) | [day-04/reflection-self-correction.svg](day-04/reflection-self-correction.svg) | done |
| [theory/human-in-the-loop.md](../theory/human-in-the-loop.md) | [day-05/human-in-the-loop.svg](day-05/human-in-the-loop.svg) | done |
| [theory/multi-agent-patterns.md](../theory/multi-agent-patterns.md) | [day-06/multi-agent-patterns.svg](day-06/multi-agent-patterns.svg) | done |
| [theory/checkpointing-idempotency.md](../theory/checkpointing-idempotency.md) | [day-06/checkpointing-idempotency.svg](day-06/checkpointing-idempotency.svg) | done |
| [theory/agent-observability.md](../theory/agent-observability.md) | [day-07/agent-observability.svg](day-07/agent-observability.svg) | done |
| [labs/lab-01-react-langgraph.md](../labs/lab-01-react-langgraph.md) | [labs/lab-01-react-langgraph-trace.svg](labs/lab-01-react-langgraph-trace.svg) | done |
| [labs/lab-02-openai-agents-sdk.md](../labs/lab-02-openai-agents-sdk.md) | [labs/lab-02-handoff-trace.svg](labs/lab-02-handoff-trace.svg) | done |
| [labs/lab-03-mcp-server.md](../labs/lab-03-mcp-server.md) | [labs/lab-03-mcp-tool-trace.svg](labs/lab-03-mcp-tool-trace.svg) | done |
| [labs/lab-04-memory-reflection.md](../labs/lab-04-memory-reflection.md) | [labs/lab-04-reflection-coverage.svg](labs/lab-04-reflection-coverage.svg) | done |
| [labs/lab-05-hitl-interrupts.md](../labs/lab-05-hitl-interrupts.md) | [labs/lab-05-hitl-approval.svg](labs/lab-05-hitl-approval.svg) | done |
| [labs/lab-06-multi-agent.md](../labs/lab-06-multi-agent.md) | [labs/lab-06-multi-agent-trace.svg](labs/lab-06-multi-agent-trace.svg) | done |
| [project/architecture.md](../project/architecture.md) | [project/research-agent-studio-architecture.svg](project/research-agent-studio-architecture.svg) | done |
| [START-HERE.md](../START-HERE.md) | [project/start-here-two-paths.svg](project/start-here-two-paths.svg) | done |
| [interview/cheat-sheet.md](../interview/cheat-sheet.md) | [project/cheat-sheet-card.svg](project/cheat-sheet-card.svg) | done |

**Total:** 20 figures across Week 4.

---

## Phases

| Phase | Scope | Status |
|-------|--------|--------|
| **1** | Day 1–2: ReAct, LangGraph, OpenAI SDK, Pydantic AI | done |
| **2** | Day 3–4: MCP, memory, reflection + Labs 1–4 | done |
| **3** | Day 5–6: HITL, multi-agent, checkpointing + Labs 5–6 | done |
| **4** | Day 7: observability, project, START-HERE, cheat-sheet | done |

---

## Style guide

- Light background (`#fafafa`), dark text (`#1a1a1a`)
- Accent blue `#2563eb` (agents / graph), accent orange `#ea580c` (HITL / reflection)
- Max width ~720px in SVG `viewBox`; figures should read on mobile GitHub preview
- Alt text: one sentence describing what to notice
- Run `xmllint --noout` on every SVG before committing

---

## Adding figures

1. Pick embed point in the target `.md` (after the concept paragraph, before the next heading).
2. Create SVG under the correct `day-NN/`, `labs/`, or `project/` folder.
3. Embed with `![alt](../assets/images/…)` + *Figure:* caption.
4. Update this inventory table.
5. Validate with `xmllint --noout path/to/file.svg`.
