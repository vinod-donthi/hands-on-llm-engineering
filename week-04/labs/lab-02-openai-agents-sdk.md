# Lab 2: OpenAI Agents SDK Handoffs

> Week 4 Labs · [← README](README.md) · [OpenAI Agents SDK](../theory/openai-agents-sdk.md)

> **Work dir:** `~/ai-learning/week-04-work/`

**Estimated cost:** $0.20–0.50

**Goal:** Triage agent routes a research question to a Research specialist and a formatting task to a Writer — trace saved as JSON.

---

## Agents

| Agent | Tools | Instructions summary |
|-------|-------|----------------------|
| **Triage** | handoffs only | Route research vs formatting |
| **Research** | `web_search` (or mock) | Find facts with URLs |
| **Writer** | none | Format as bullet memo |

---

## Sample script skeleton

```python
from agents import Agent, Runner, handoff

research = Agent(
    name="Research",
    instructions="Search and return facts with source URLs.",
    tools=[web_search_tool],
)
writer = Agent(
    name="Writer",
    instructions="Format prior findings as a concise memo.",
)
triage = Agent(
    name="Triage",
    instructions="Research questions → Research. Formatting → Writer.",
    handoffs=[handoff(research), handoff(writer)],
)

result = Runner.run_sync(
    triage,
    "Summarize recent EU AI Act enforcement news for legal.",
)
```

---

## Input guardrail (required)

Block SSN-like patterns in user input — return friendly error before tools run.

---

## Pydantic AI side task

Create `app/agents/citation_extractor.py`:

```python
class Citation(BaseModel):
    title: str
    url: HttpUrl
    quote: str

class CitationList(BaseModel):
    citations: list[Citation]
```

Test with static research notes (no API needed for unit test).

---

## Deliverable: `agents_sdk_handoff.json`

Include:

- `handoff` events (from → to)
- `tool_call` events
- `final_output` preview
- `total_cost_usd` if available from trace

---

## Expected output (excerpt)

```json
{
  "events": [
    {"type": "handoff", "from": "Triage", "to": "Research"},
    {"type": "tool_call", "tool": "web_search", "query": "EU AI Act enforcement 2026"},
    {"type": "handoff", "from": "Research", "to": "Triage"},
    {"type": "handoff", "from": "Triage", "to": "Writer"}
  ],
  "final_output": "## EU AI Act Enforcement\n- ..."
}
```

---

## Acceptance

- [ ] Handoff path visible in trace
- [ ] At least one tool call on research path
- [ ] Guardrail blocks test SSN input
- [ ] Citation extractor unit test passes

---

## Next

→ [Day 3](../daily/day-03.md) · [Lab 3](lab-03-mcp-server.md)
