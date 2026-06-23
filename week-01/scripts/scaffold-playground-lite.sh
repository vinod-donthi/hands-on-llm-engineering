#!/usr/bin/env bash
# Scaffold prompt-playground-lite from lab04_backend + minimal Next.js frontend.
#
# Usage:
#   ./scripts/scaffold-playground-lite.sh
#   ./scripts/scaffold-playground-lite.sh ~/ai-learning/week-01-work
set -euo pipefail

usage() {
  cat <<EOF
Usage: $(basename "$0") [WORK_DIR]

Creates prompt-playground-lite/ under your Week 1 work directory:
  - backend/  (copied from lab04_backend/ if present)
  - frontend/ (minimal Next.js compare UI template)
  - Makefile, .gitignore, README

  WORK_DIR  Optional (default: week-01-work in repo, else ~/ai-learning/week-01-work)
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

CURRICULUM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_ROOT="$(cd "$CURRICULUM_DIR/.." && pwd)"
TEMPLATE_DIR="$CURRICULUM_DIR/scripts/templates/playground-lite"

if [[ $# -eq 1 ]]; then
  WORK_DIR="$1"
elif [[ -n "${WORK_DIR:-}" ]]; then
  WORK_DIR="$WORK_DIR"
elif [[ -d "$REPO_ROOT/week-01-work" ]]; then
  WORK_DIR="$REPO_ROOT/week-01-work"
else
  WORK_DIR="$HOME/ai-learning/week-01-work"
fi

WORK_DIR="${WORK_DIR/#\~/$HOME}"
WORK_DIR="$(cd "$WORK_DIR" 2>/dev/null && pwd || true)"
if [[ -z "$WORK_DIR" ]]; then
  echo "Error: work directory does not exist. Run setup-work.sh first." >&2
  exit 1
fi

PROJECT_DIR="$WORK_DIR/prompt-playground-lite"
BACKEND_SRC="$WORK_DIR/lab04_backend"
BACKEND_DST="$PROJECT_DIR/backend"

echo "Work dir:     $WORK_DIR"
echo "Project dir:  $PROJECT_DIR"
echo ""

mkdir -p "$PROJECT_DIR"

# --- Backend: copy from lab04_backend ---
if [[ -d "$BACKEND_SRC" ]]; then
  if [[ -d "$BACKEND_DST" ]]; then
    echo "Backend already exists at $BACKEND_DST — skipping copy (delete to re-scaffold)"
  else
    echo "Copying lab04_backend/ → prompt-playground-lite/backend/"
    cp -R "$BACKEND_SRC" "$BACKEND_DST"
  fi
else
  echo "Warning: $BACKEND_SRC not found — create backend manually or complete Lab 4 first." >&2
  mkdir -p "$BACKEND_DST"
fi

# --- Frontend template ---
if [[ -f "$PROJECT_DIR/frontend/package.json" ]]; then
  echo "Frontend already exists — skipping template copy"
else
  echo "Copying frontend template..."
  mkdir -p "$PROJECT_DIR/frontend"
  cp -R "$TEMPLATE_DIR/frontend/." "$PROJECT_DIR/frontend/"
fi

# --- Root project files ---
for f in Makefile .gitignore README.md; do
  if [[ ! -f "$PROJECT_DIR/$f" ]]; then
    cp "$TEMPLATE_DIR/$f" "$PROJECT_DIR/$f"
  fi
done

# --- CORS for local Next.js UI ---
if [[ -f "$BACKEND_DST/app/main.py" ]] && ! grep -q "CORSMiddleware" "$BACKEND_DST/app/main.py" 2>/dev/null; then
  echo "Adding CORS middleware to backend/app/main.py..."
  python3 <<PY
from pathlib import Path
path = Path("$BACKEND_DST/app/main.py")
text = path.read_text()
if "CORSMiddleware" in text:
    raise SystemExit(0)
import_block = "from fastapi.middleware.cors import CORSMiddleware\n"
if import_block.strip() not in text:
    text = text.replace(
        "from fastapi import FastAPI, HTTPException\n",
        "from fastapi import FastAPI, HTTPException\nfrom fastapi.middleware.cors import CORSMiddleware\n",
    )
cors = '''
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_methods=["*"],
    allow_headers=["*"],
)
'''
marker = "app = FastAPI("
idx = text.find(marker)
if idx == -1:
    raise SystemExit("Could not find FastAPI app in main.py")
close = text.find(")\n", idx)
if close == -1:
    raise SystemExit("Could not find end of FastAPI() call")
insert_at = close + 2
text = text[:insert_at] + cors + text[insert_at:]
path.write_text(text)
PY
fi

cat <<EOF

Scaffold complete.

Next steps:

  cd $PROJECT_DIR/frontend
  npm install
  npm run dev

  # separate terminal:
  cd $PROJECT_DIR/backend
  source $WORK_DIR/.venv/bin/activate
  uvicorn app.main:app --reload --port 8000

  Open http://localhost:3000

Day 7: $CURRICULUM_DIR/project/BUILD-GUIDE.md
Capstone: $CURRICULUM_DIR/project/CAPSTONE-PROMPTS.md

EOF
