# Lab 6: Multi-Agent Supervisor (Optional)

> Week 4 Labs · [← README](README.md) · [Multi-Agent](../theory/multi-agent-patterns.md)

> **Work dir:** `~/ai-learning/week-04-work/`

**Estimated cost:** $0.40–1.00

**Optional — not required for Week 4 exit criteria.** Skip if behind; use single-agent graph in capstone.

**Goal:** Supervisor routes to Web Researcher and Document Analyst subgraphs; shared `findings` in parent state; trace shows `agent_id` per step.

---

## Agents

| Subgraph | Tools |
|----------|-------|
| **Supervisor** | routing only |
| **Web Researcher** | `web_search`, `fetch_url` |
| **Document Analyst** | `doc_search` |

---

## Parent state

```python
class MultiAgentState(TypedDict):
    question: str
    plan: list[str]
    findings: list[Finding]
    active_agent: str | None
    handoff_count: int
```

Cap `handoff_count` at 6.

---

## Sample run

```bash
python lab06_multi_agent.py \
  --question "Compare public news on our product launch with claims in sample_press_release.md"
```

---

## Deliverable: `multi_agent_trace.json`

```json
{
  "events": [
    {"agent_id": "Supervisor", "action": "route", "to": "Web Researcher"},
    {"agent_id": "Web Researcher", "tool": "web_search"},
    {"agent_id": "Supervisor", "action": "route", "to": "Document Analyst"},
    {"agent_id": "Document Analyst", "tool": "doc_search"},
    {"agent_id": "Supervisor", "action": "finalize"}
  ],
  "handoff_count": 3
}
```

---

## Acceptance

- [ ] Both specialists invoked for cross-source question
- [ ] Shared findings visible to supervisor
- [ ] handoff_count capped
- [ ] Trace saved

---

## Next

→ [Day 7 capstone](../daily/day-07.md)
