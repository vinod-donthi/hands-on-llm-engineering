# Week 4 Glossary

> [← README](../README.md) · Optional depth: [appendix](../../appendix/README.md)

| Term | Definition |
|------|------------|
| **Agent** | System where an LLM chooses actions (tools or final answer) at runtime. |
| **Chain** | Fixed pipeline of steps (e.g. retrieve → generate) without LLM routing. |
| **ReAct** | Pattern: Reason → Act (tool) → Observe (result) → repeat. |
| **LangGraph** | Library for building stateful agent graphs with checkpoints and interrupts. |
| **State** | Shared object passed between graph nodes (messages, findings, plan). |
| **Node** | One step in a LangGraph graph (function that updates state). |
| **Conditional edge** | Routing rule based on state (e.g. tool_calls → tools node). |
| **Checkpoint** | Saved graph state after a step; enables resume. |
| **thread_id** | Identifier for a checkpointed run. |
| **HITL** | Human-in-the-loop — pause for approval before risky actions. |
| **Interrupt** | LangGraph pause point (often before tool execution). |
| **MCP** | Model Context Protocol — standard for tool servers and clients. |
| **Tool** | Callable function the LLM can request (app or MCP server executes). |
| **Handoff** | One agent delegating control to another (OpenAI Agents SDK). |
| **Supervisor** | Router agent that assigns work to specialist agents. |
| **Working memory** | Structured findings/plan during a run (not full chat history). |
| **Reflection** | Self-evaluation step (coverage score, gaps) before final answer. |
| **Idempotency** | Repeating an operation has same effect as doing it once. |
| **Coverage score** | 0–1 estimate of how fully sub-questions are answered. |
| **Pydantic AI** | Agent library with Pydantic-validated tools and outputs. |
| **OpenAI Agents SDK** | OpenAI library for agents, handoffs, guardrails, sessions. |
| **doc_search** | Retrieval tool over Week 3 vector index. |
| **Trace** | Log of LLM calls, tools, costs for one agent run. |
| **SSRF** | Server-side request forgery — risk when agents fetch URLs. |
| **Specialist agent** | Agent with narrow tools and instructions. |

## Week links

- Week 2 [function calling](../week-02/theory/function-calling.md) — tool loop foundation  
- Week 3 RAG — `doc_search` prerequisite  
- Week 5 — production deployment of agent services  
