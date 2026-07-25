# Week 4 Quiz

> [← README](../README.md) · [Exit Criteria](exit-criteria.md)

**Pass:** ≥ 12/15 (80%). Answer from this week's theory and labs.

---

1. In ReAct, what happens in the **observe** step?

2. Who executes a tool call — the LLM or your application?

3. Name one task better suited to a **chain** than an **agent**.

4. What does LangGraph store in **state** vs what is a **node**?

5. What is the purpose of a **conditional edge** after the research node?

6. When would you choose **OpenAI Agents SDK** over LangGraph for a prototype?

7. What does Pydantic AI `result_type` enforce?

8. What problem does **MCP** solve for tool portability?

9. Name two security controls for an MCP `fetch_url` tool.

10. Difference between **short-term** and **working** memory in the Week 4 graph?

11. What does `coverage_score` drive in the reflection node?

12. Which tools should require **HITL** approval by default?

13. What is `thread_id` used for in LangGraph checkpoints?

14. Why cache `web_search` results for idempotency?

15. Name three fields you would log in an agent trace for production debugging.

---

## Answer key

<details>
<summary>Click to reveal (after attempting)</summary>

1. Read tool result and feed it back into the next reasoning step  
2. Your application  
3. Single doc Q&A with fixed retrieve → generate (Week 3 style)  
4. State = shared data object; node = function that updates state  
5. Route to tools if tool_calls exist, else reflect or write  
6. Fast multi-agent handoffs with guardrails  
7. Structured, validated output from an agent run  
8. Standard tool interface across clients/IDEs  
9. Block private IPs; HITL on internal URLs; size limits (any two)  
10. Short-term = messages; working = structured findings/plan  
11. Whether to continue research or proceed to write  
12. fetch_url to internal resources, send_email, write/delete (high-risk)  
13. Resume the same run from checkpoint after crash or HITL wait  
14. Avoid duplicate API cost when retrying/resuming a run  
15. thread_id, tool+args, latency_ms, cost_usd, node/agent_id (any three)

</details>
