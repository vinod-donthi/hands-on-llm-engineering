# CI Spec — GitHub Actions Eval Gate

> Week 6 Project · [Eval Pipeline Spec](eval-pipeline-spec.md) · [Architecture](architecture.md)

## Workflows

| Workflow | File | Trigger |
|----------|------|---------|
| Eval gate | `.github/workflows/eval-gate.yml` | PR + push main |
| Red team | `.github/workflows/redteam-weekly.yml` | Cron Sunday 02:00 UTC |
| Baseline update | Manual `workflow_dispatch` | Tech lead only |

## eval-gate.yml (full)

```yaml
name: Eval Gate

on:
  pull_request:
    branches: [main]
  push:
    branches: [main]

concurrency:
  group: eval-${{ github.ref }}
  cancel-in-progress: true

jobs:
  fast-eval:
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    timeout-minutes: 10
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"
          cache: pip
      - run: pip install -r requirements.txt
      - name: DeepEval fast suite
        run: pytest tests/test_llm_eval.py -v -m "not nightly" --tb=short
        env:
          OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}

  promptfoo:
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    needs: fast-eval
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
      - run: npm install -g promptfoo@latest
      - name: Promptfoo (prompt changes only)
        if: contains(github.event.pull_request.changed_files, 'prompts/')
        run: |
          cd promptfoo
          promptfoo eval -c promptfooconfig.yaml -o ../reports/promptfoo_ci.json
        env:
          OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}

  full-eval:
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    timeout-minutes: 30
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"
          cache: pip
      - run: pip install -r requirements.txt
      - name: Full eval + regression gate
        run: python scripts/run_full_eval.py --suite full --fail-on-regression
        env:
          OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
          LANGFUSE_PUBLIC_KEY: ${{ secrets.LANGFUSE_PUBLIC_KEY }}
          LANGFUSE_SECRET_KEY: ${{ secrets.LANGFUSE_SECRET_KEY }}
      - uses: actions/upload-artifact@v4
        if: always()
        with:
          name: eval-reports-${{ github.sha }}
          path: reports/
          retention-days: 30
```

## Secrets required

| Secret | Required for |
|--------|--------------|
| `OPENAI_API_KEY` | All eval layers |
| `LANGFUSE_PUBLIC_KEY` | Trace export (full job) |
| `LANGFUSE_SECRET_KEY` | Trace export (full job) |

## Failure notifications

PR comment on fast-eval failure (optional stretch):

```yaml
- uses: actions/github-script@v7
  if: failure()
  with:
    script: |
      github.rest.issues.createComment({
        issue_number: context.issue.number,
        body: 'Eval gate FAILED. Download artifacts for details.'
      })
```

## Baseline update process

1. Run full eval 3 times — take **median** faithfulness
2. Update `eval/baseline.json` in dedicated PR
3. Label `# eval-baseline-approved`
4. Merge — new floor calculated automatically

Never lower floor to unblock a failing PR without fixing root cause.

## Local CI dry-run

```bash
pytest tests/test_llm_eval.py -v -m "not nightly"
python scripts/run_eval_gate.py --report reports/ragas_baseline_report.json
```

Optional: [nektos/act](https://github.com/nektos/act) for workflow dry-run (requires secrets file).

## redteam-weekly.yml (sketch)

```yaml
on:
  schedule:
    - cron: '0 2 * * 0'
jobs:
  redteam:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm install -g promptfoo@latest
      - run: promptfoo redteam run --config promptfoo/redteam.yaml -o reports/redteam_report.json
        env:
          OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY }}
      - uses: actions/upload-artifact@v4
        with:
          name: redteam-${{ github.run_id }}
          path: reports/redteam_report.json
```

## Next

→ [acceptance-criteria.md](acceptance-criteria.md) · [Lab 5](../labs/lab-05-ci-eval-gate.md)
