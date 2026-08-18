#!/usr/bin/env bash
# Install the tmux plugin manager without changing any Stow-managed links.
set -euo pipefail

TPM_DIR="${HOME}/.tmux/plugins/tpm"

command -v git >/dev/null 2>&1 || {
  printf 'error: git is required to install TPM\n' >&2
  exit 1
}

if [[ -d "$TPM_DIR/.git" ]]; then
  printf 'TPM already installed at %s\n' "$TPM_DIR"
  exit 0
fi

if [[ -e "$TPM_DIR" ]]; then
  printf 'error: refusing to replace existing non-git TPM path: %s\n' "$TPM_DIR" >&2
  exit 1
fi

mkdir -p "$(dirname "$TPM_DIR")"
git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
printf 'Installed TPM at %s\n' "$TPM_DIR"
