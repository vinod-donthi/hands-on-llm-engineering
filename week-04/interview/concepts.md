# Week 4 Interview — Concepts

> [← README](../README.md)

## Agent fundamentals

**Q: Agent vs chain?**  
A: Chain = fixed steps coded by developer. Agent = LLM chooses next action (tool or answer) at runtime via ReAct loop.

**Q: Who runs tools?**  
A: Always application code. Model emits tool_call; app validates and executes.

**Q: How do you stop runaway agents?**  
A: `max_tool_rounds`, cost caps, reflection max iterations, timeouts, HITL on risky tools.

## LangGraph

**Q: Why LangGraph over a while loop?**  
A: Explicit graph, conditional routing, checkpoints, HITL interrupts, testable nodes.

**Q: What is thread_id?**  
A: Checkpoint key to resume a specific run after crash or approval wait.

## Frameworks

**Q: LangGraph vs OpenAI Agents SDK?**  
A: LangGraph = fine control, checkpoints, model-agnostic nodes. SDK = faster handoffs/guardrails, OpenAI-centric.

**Q: Where does Pydantic AI fit?**  
A: Typed tool I/O and structured sub-steps (reflection, citations) inside graph nodes.

## MCP

**Q: What is MCP?**  
A: Open protocol: client discovers and calls tools on a server (stdio/SSE).

**Q: MCP security?**  
A: Least-privilege tools, SSRF blocks, HITL on fetch, no arbitrary shell, redact secrets in logs.

## Memory & reflection

**Q: Why structured findings?**  
A: Keeps research auditable without stuffing raw HTML into messages.

**Q: Reflection purpose?**  
A: Critic step — coverage score decides continue research vs write final report.

## HITL

**Q: When require human approval?**  
A: Irreversible or sensitive: email, internal URLs, payments, prod writes.

## Multi-agent

**Q: Supervisor pattern?**  
A: Router agent delegates to specialists with narrow tool sets; shared findings bus.

## Optional — Skills, harness, A2A *(not exit criteria)*

**Q: What is an agent skill?**  
A: A reusable playbook (trigger, rules, steps) that packages a workflow; MCP tools still execute the actions.

**Q: What is an agent harness?**  
A: The runtime shell around the LLM — context injection, control/orchestration, tool actions, and persistence/checkpoints. Distinct from an *eval* harness.

**Q: Multi-agent vs A2A?**  
A: Multi-agent = specialists in one app/graph. A2A = protocol so independent agent *services* discover each other (Agent Cards) and exchange tasks/artifacts.

**Q: MCP vs A2A?**  
A: MCP plugs tools/data into an agent; A2A lets agents talk to other agents across services.

## Observability

**Q: Minimum production trace fields?**  
A: thread_id, node, tool+args, latency, tokens, cost, errors.

## Week 3 connection

**Q: How does RAG fit Week 4?**  
A: `doc_search` is one tool in the agent graph — not the whole system.
