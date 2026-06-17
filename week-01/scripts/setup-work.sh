#!/usr/bin/env bash
# Bootstrap Week 1 work directory (code, venv, deps) separate from curriculum.
#
# Usage:
#   ./scripts/setup-work.sh                    # default: ~/ai-learning/week-01-work
#   ./scripts/setup-work.sh ~/projects/week-01
#   WORK_DIR=~/projects/week-01 ./scripts/setup-work.sh
set -euo pipefail

usage() {
  cat <<EOF
Usage: $(basename "$0") [WORK_DIR]

Bootstrap Week 1 work directory (venv, requirements.txt, .env).

  WORK_DIR    Optional path for lab code and project (default: ~/ai-learning/week-01-work)
              Can also be set via WORK_DIR environment variable.
              CLI argument takes precedence over WORK_DIR env.

Examples:
  $(basename "$0")
  $(basename "$0") ~/projects/my-week-01
  WORK_DIR=~/projects/my-week-01 $(basename "$0")
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ $# -gt 1 ]]; then
  echo "Error: too many arguments" >&2
  usage >&2
  exit 1
fi

CURRICULUM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEFAULT_WORK_DIR="$HOME/ai-learning/week-01-work"

if [[ $# -eq 1 ]]; then
  WORK_DIR="$1"
elif [[ -n "${WORK_DIR:-}" ]]; then
  WORK_DIR="$WORK_DIR"
else
  WORK_DIR="$DEFAULT_WORK_DIR"
fi

WORK_DIR="${WORK_DIR/#\~/$HOME}"
mkdir -p "$WORK_DIR"
WORK_DIR="$(cd "$WORK_DIR" && pwd)"

echo "Curriculum (read):  $CURRICULUM_DIR"
echo "Work (build):       $WORK_DIR"
echo ""

mkdir -p "$WORK_DIR"
cp "$CURRICULUM_DIR/requirements.txt" "$WORK_DIR/"
cp "$CURRICULUM_DIR/.env.example" "$WORK_DIR/"

if [[ ! -d "$WORK_DIR/.venv" ]]; then
  echo "Creating virtualenv..."
  python3 -m venv "$WORK_DIR/.venv"
fi

# shellcheck disable=SC1091
source "$WORK_DIR/.venv/bin/activate"
pip install --upgrade pip
pip install -r "$WORK_DIR/requirements.txt"

if [[ ! -f "$WORK_DIR/.env" ]]; then
  cp "$WORK_DIR/.env.example" "$WORK_DIR/.env"
  echo ""
  echo "Created $WORK_DIR/.env — add your API keys before running cloud labs."
fi

cat <<EOF

Done.

  cd $WORK_DIR
  source .venv/bin/activate

Lab deliverables and prompt-playground-lite/ go here — not in the curriculum repo.

Ollama (if not installed): https://ollama.com
  ollama pull llama3.1:8b

EOF
