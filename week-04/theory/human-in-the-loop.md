# Human-in-the-Loop (HITL)

> Week 4 Theory · Day 5 · [← README](../README.md) · [Reflection](reflection-self-correction.md) · [Multi-Agent](multi-agent-patterns.md)

**Human-in-the-loop** means the agent **pauses** before certain actions until a person approves, edits, or rejects. For Research Agent Studio, web search might run automatically, but **fetching internal URLs** or **sending email** waits for explicit approval.

---

## Concepts

### What problem are we solving?

Autonomous agents with tools can leak data, hit internal admin URLs, or email the wrong recipient — all while sounding confident.

HITL is the production pattern: **automation for low-risk steps, human gate for irreversible or sensitive steps.**

### Worked example: interrupt before fetch

**Config:** `HITL_REQUIRE_APPROVAL_FOR=fetch_url,send_email`

1. Agent calls `fetch_url("http://internal-wiki/acquisition-plan")`
2. LangGraph **interrupts** before the tools node executes
3. UI shows: tool name, args, risk reason
4. Human clicks **Approve** → graph resumes → tool runs
5. Human clicks **Reject** → tool skipped → agent gets rejection message in state

Lab 5 saves `hitl_approval_trace.json` with `pending → approved/rejected` events.

### LangGraph interrupt pattern

```python
from langgraph.types import interrupt

def tools_node(state):
    for call in pending_tool_calls(state):
        if call.name in HITL_TOOLS:
            decision = interrupt({
                "tool": call.name,
                "args": call.args,
                "risk": "May access internal network",
            })
            if decision["action"] == "reject":
                append_rejection(state, call)
                continue
        execute_tool(call)
    return state
```

Compile with `interrupt_before=["tools"]` or explicit `interrupt()` inside node.

### Risk tiers

| Tier | Examples | Policy |
|------|----------|--------|
| **Low** | `web_search`, `doc_search`, read-only MCP | Auto-approve |
| **Medium** | `fetch_url` public URLs | Log + optional approve |
| **High** | internal URLs, `send_email`, write/delete | Require approval |
| **Critical** | payments, prod deploy | Block in dev; dual approval in prod |

Research Agent Studio capstone: at least **one high-risk tool** gated.

### Approval UX options

| Approach | Week 4 fit |
|----------|------------|
| CLI prompt (`y/n`) | Lab 5 fastest path |
| FastAPI endpoint + polling | Project stretch |
| Slack button | Optional — not required |

Timeout: if no response in `HITL_APPROVAL_TIMEOUT_SEC`, default **reject** (safe).

### Sample interrupt payload

```json
{
  "interrupt_id": "int-9f2a",
  "tool": "fetch_url",
  "args": {"url": "http://10.0.0.5/admin"},
  "risk": "Internal IP — possible SSRF",
  "expires_at": "2026-07-25T18:30:00Z"
}
```

**AI engineer takeaway:** HITL is not anti-automation — it scopes autonomy. Design tool tiers early; don't bolt approval on after an incident.

---

## Tradeoffs

| Pros | Cons |
|------|------|
| Prevents costly mistakes | Blocks unattended runs |
| Audit trail of decisions | UX complexity |
| Builds user trust | Latency when human away |

---

## Best Practices

- Default deny on timeout
- Show **full args** — not just tool name
- Persist interrupt state in checkpoint (resume after approval)
- Same HITL rules for MCP and native tools

---

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| HITL on everything | Tier by risk |
| Approve without reading args | Highlight URL/email fields |
| No checkpoint during wait | Use LangGraph interrupt + thread_id |
| Silent auto-approve in prod | Env-driven policy |

---

## Checkpoint

1. What triggers an interrupt in the example?
2. What should happen on approval timeout?
3. Name two low-risk vs high-risk tools.
4. Why checkpoint during HITL wait?
5. What deliverable does Lab 5 produce?

---

## Go Deeper

| Resource | Why |
|----------|-----|
| [LangGraph interrupts](https://langchain-ai.github.io/langgraph/how-tos/human_in_the_loop/) | Implementation |
| [mcp-protocol.md](mcp-protocol.md) | Secure tool boundaries |
| [checkpointing-idempotency.md](checkpointing-idempotency.md) | Resume after pause |

---

## Next

→ [Lab 5](../labs/lab-05-hitl-interrupts.md) · Day 6 → [multi-agent-patterns.md](multi-agent-patterns.md)
