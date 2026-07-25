# Day 6 — Red Teaming, Agent Trajectory Eval + Project Build

> **You are here:** Day 6 of 7 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 5](day-05.md) — CI gate |
| **Today's outcome** | Red-team report + agent eval + Eval Pipeline Studio core |
| **Time** | 4–5h (hard cap 5h) |
| **Work dir** | `week-06-work/` or `~/ai-learning/week-06-work/` |
| **Stop when** | Red team + agent reports + project skeleton running |

**Catch-up:** skip red team if behind; prioritize project core + CI wiring.

---

## Steps

### Step 1 — Theory: red teaming (~35 min)

Read [red-teaming-security-eval.md](../theory/red-teaming-security-eval.md) — Promptfoo red team, injection, PII leakage.

### Step 2 — Theory: agent trajectory eval (~35 min)

Read [agent-trajectory-eval.md](../theory/agent-trajectory-eval.md) — tool correctness, task completion, span assertions.

### Step 3 — Project specs (~30 min)

Read [project/overview.md](../project/overview.md) → [architecture.md](../project/architecture.md) → [eval-pipeline-spec.md](../project/eval-pipeline-spec.md).

### Step 4 — Red team run (~60 min)

```bash
cd promptfoo
promptfoo redteam run --config promptfooconfig.yaml --output ../reports/redteam_report.json
```

Or configure `promptfoo/redteam.yaml` with ≥10 attack plugins (injection, jailbreak, PII exfil).

### Step 5 — Agent trajectory eval (~60 min)

If you have a Week 4 agent, run trajectory eval:

```bash
python scripts/eval_agent_trajectory.py --traces eval/traces/ --out reports/agent_trajectory_report.json
```

Stub acceptable: 3 golden agent traces with expected tool sequence.

### Step 6 — Build Eval Pipeline Studio core (~90 min)

Scaffold `eval-pipeline-studio/`:

- `backend/app/eval/runner.py` — orchestrates RAGAS → DeepEval → Promptfoo
- `backend/app/eval/gate.py` — regression check
- FastAPI `/api/v1/eval/run` and `/api/v1/eval/reports`

```bash
cd eval-pipeline-studio/backend
uvicorn app.main:app --reload --port 8006
curl -X POST http://localhost:8006/api/v1/eval/run -H "Content-Type: application/json" -d '{"suite":"fast"}'
```

### Step 7 — Deliverable

- [ ] `reports/redteam_report.json` — ≥10 scenarios, pass rate documented
- [ ] `reports/agent_trajectory_report.json` — tool correctness metrics
- [ ] Eval Pipeline Studio API responds on port 8006
- [ ] Optional: [Lab 6](../labs/lab-06-observability-traces.md) LangSmith swap

### Step 8 — Close out (~15 min)

- [ ] Mark Day 6 in [progress.md](../progress.md)

---

## Done when

- [ ] Red team + agent reports exist
- [ ] Eval Pipeline Studio API running
- [ ] Day 6 row checked in `progress.md`

---

## Tomorrow

**→ [Day 7 — Capstone Dashboard + Validation](day-07.md)** — start with [eval-pipeline-spec.md](../project/eval-pipeline-spec.md)
