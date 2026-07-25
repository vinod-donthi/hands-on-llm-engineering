# Research Agent Studio — Backend

> Week 4 Project · [← Architecture](architecture.md) · [API](api.md)

> **Work dir:** `~/ai-learning/week-04-work/research-agent-studio/backend/`

## Core modules

### `app/graph/state.py`

TypedDict / Pydantic state: `question`, `messages`, `plan`, `findings`, `reflections`, `tool_rounds`, `final_report`, `pending_interrupt`.

### `app/graph/research_graph.py`

```python
from langgraph.checkpoint.sqlite import SqliteSaver

def build_graph():
    builder = StateGraph(ResearchState)
    builder.add_node("plan", plan_node)
    builder.add_node("research", research_node)
    builder.add_node("tools", tools_node_with_hitl)
    builder.add_node("summarize", summarize_node)
    builder.add_node("reflect", reflect_node)
    builder.add_node("write", write_node)
    # edges + conditional routing ...
    checkpointer = SqliteSaver.from_conn_string(settings.checkpoint_db_path)
    return builder.compile(checkpointer=checkpointer)
```

### `app/graph/nodes.py`

| Node | Implementation notes |
|------|---------------------|
| `plan_node` | GPT-4o Mini; output JSON list of sub_questions |
| `research_node` | Bind tools (MCP + doc_search); return tool_calls or proceed |
| `tools_node_with_hitl` | `interrupt()` for risky tools; idempotent search cache |
| `summarize_node` | Append to `findings`; trim messages |
| `reflect_node` | Pydantic AI `Reflection` model |
| `write_node` | Citation extractor + markdown report |

### `app/tools/mcp_client.py`

- Spawn stdio MCP server subprocess
- `list_tools()` at startup (cache 5 min)
- `call_tool(name, args)` with 30s timeout

### `app/tools/doc_search.py`

Reuse Week 3 retrieval:

```python
async def doc_search(query: str, top_k: int = 5) -> list[dict]:
    return await hybrid_search(query, top_k=top_k)
```

Return `chunk_id` for citations: `doc:sample_policy#chunk-12`.

### `app/hitl/approval.py`

- In-memory or SQLite pending interrupts for API resume
- Default reject on timeout

### `app/observability/trace.py`

- `TraceWriter` → `research_trace.jsonl`
- structlog JSON to stdout

---

## Config (`app/settings.py`)

Load from `.env`:

- `OPENAI_API_KEY`, `TAVILY_API_KEY`
- `CHECKPOINT_DB_PATH`
- `HITL_REQUIRE_APPROVAL_FOR`
- `MAX_TOOL_ROUNDS`, `MAX_COST_USD_PER_RUN`

---

## Tests (`tests/`)

| Test | Asserts |
|------|---------|
| `test_graph_plan_node` | Fixture state → plan has ≥ 1 sub_question |
| `test_hitl_reject` | Risky URL skipped |
| `test_idempotent_search` | Same query → cache hit, one API call |
| `test_checkpoint_resume` | Interrupt mid-run → resume completes |
| `test_report_schema` | Final JSON matches `ResearchReport` model |

---

## Research report schema

```python
class SourceCitation(BaseModel):
    kind: Literal["web", "doc"]
    title: str
    locator: str  # URL or doc:chunk_id
    excerpt: str

class ResearchReport(BaseModel):
    question: str
    thread_id: str
    summary: str
    citations: list[SourceCitation]
    plan: list[str]
    coverage_score: float
    tool_rounds: int
    cost_usd: float
```

---

## Run

```bash
cd backend
pytest -q
uvicorn app.main:app --reload --port 8001
```
