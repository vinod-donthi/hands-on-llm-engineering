# Day 6 — Phase 3: Scheduler + Email Digest

> **You are here:** Day 6 of 7 · Phase 3 of 4 · [← Daily index](README.md) · [Progress](../progress.md)

| | |
|---|---|
| **Previous** | [Day 5](day-05.md) |
| **Today's outcome** | Daily digest job + email or HTML preview |
| **Time** | 4h (hard cap 5h) |
| **Work dir** | `week-08-work/` or `~/ai-learning/week-08-work/` |
| **Stop when** | Phase 3 milestone complete |

**Catch-up:** Lab 6 + digest preview HTML; skip live email.

---

## Steps

### Step 1 — Theory: Digest scheduling (~20 min)

Read [ingestion-scheduling.md](../theory/ingestion-scheduling.md) — cron + digest sections.

### Step 2 — Digest pipeline (~90 min)

Implement `app/jobs/run_digest.py` per [phase-3](../project/phases/phase-3-product.md).

### Step 3 — Email (~45 min)

Wire Resend or SMTP in `app/notifications/email.py`. Add keys to `.env`.

### Step 4 — Celery Beat (~45 min)

Schedule `INGESTION_CRON` and `DIGEST_CRON` from `.env`.

### Step 5 — Trends API (~30 min)

Implement `GET /api/v1/trends` — simple tag counts for dashboard chart.

### Step 6 — Lab 6 (~45 min)

Follow [Lab 6](../labs/lab-06-email-digest-scheduler.md).

### Step 7 — Deliverable

- [ ] `digest_preview.html` in artifacts/
- [ ] Digest preview page on dashboard `/digest`
- [ ] Phase 3 acceptance checked

### Step 8 — Close out

- [ ] Mark Day 6 + Phase 3 in [progress.md](../progress.md)

---

## Done when

- [ ] Digest summarizes last 24h of corpus
- [ ] Email sent OR preview HTML committed (no secrets)

---

## Tomorrow

**→ [Day 7 — Ship: Eval, Docker, Portfolio](day-07.md)** — start with [eval-ci-gates.md](../theory/eval-ci-gates.md)
