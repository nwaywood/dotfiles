#!/usr/bin/env bash
set -euo pipefail

cat >&2 <<'EOF'
install.sh has been retired as part of the GNU Stow migration.

Link configuration explicitly:
  ./bin/dotfiles bootstrap
  ./bin/dotfiles check --all
  ./bin/dotfiles link --all

Provisioning is deliberately separate and must be explicitly requested:
  ./install/brew.sh    # Homebrew packages
  ./install/osx.sh     # macOS defaults
  ./install/tmux.sh    # TPM setup
EOF
exit 1
