#!/usr/bin/env bash
set -euo pipefail

cat >&2 <<'EOF'
install/link.sh has been retired as part of the GNU Stow migration.

Use the Stow interface instead:
  ./bin/dotfiles check --all
  ./bin/dotfiles link --all

This legacy script intentionally performs no filesystem changes.
EOF
exit 1
