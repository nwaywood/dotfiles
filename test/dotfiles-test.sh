#!/usr/bin/env bash
set -euo pipefail

ROOT="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
FIXTURE_ROOT="$ROOT/test/fixtures/stow-repository"
TEMP_ROOT="$(mktemp -d)"
FAKE_HOME="$TEMP_ROOT/home"
trap 'rm -rf "$TEMP_ROOT"' EXIT

fail() {
  printf 'FAIL: %s\n' "$*" >&2
  exit 1
}

run_dotfiles() {
  DOTFILES_ROOT="$FIXTURE_ROOT" HOME="$FAKE_HOME" "$ROOT/bin/dotfiles" "$@"
}

mkdir -p "$FAKE_HOME/.config"

run_dotfiles bootstrap >/dev/null 2>&1
packages_output="$(run_dotfiles packages)"
grep -Eq '^example[[:space:]]+default[[:space:]]+~$' <<<"$packages_output" || fail 'default fixture package is not listed'
grep -Eq '^special[[:space:]]+opt-in[[:space:]]+~/.special-target$' <<<"$packages_output" || fail 'special-target fixture package is not listed'
run_dotfiles check example >/dev/null 2>&1
run_dotfiles link example >/dev/null 2>&1

[[ -d "$FAKE_HOME/.config" ]] || fail '.config was removed'
[[ ! -L "$FAKE_HOME/.config" ]] || fail '.config was folded into a directory symlink'
[[ -d "$FAKE_HOME/.config/example" ]] || fail 'package directory was not created'
[[ ! -L "$FAKE_HOME/.config/example" ]] || fail 'package directory was folded into a directory symlink'
[[ -L "$FAKE_HOME/.config/example/config.toml" ]] || fail 'config file is not a symlink'
link_target="$(readlink "$FAKE_HOME/.config/example/config.toml")"
resolved_link="$(cd "$(dirname "$FAKE_HOME/.config/example/config.toml")" && cd "$(dirname "$link_target")" && pwd -P)/$(basename "$link_target")"
[[ "$resolved_link" == "$FIXTURE_ROOT/stow/example/.config/example/config.toml" ]] || fail 'config symlink has an unexpected source'

run_dotfiles unlink example >/dev/null 2>&1
[[ ! -e "$FAKE_HOME/.config/example/config.toml" ]] || fail 'unlink left the Stow-created link in place'
[[ -d "$FAKE_HOME/.config" ]] || fail 'unlink removed the pre-existing .config directory'

mkdir -p "$FAKE_HOME/.special-target"
run_dotfiles check special >/dev/null 2>&1
run_dotfiles link special >/dev/null 2>&1
[[ -d "$FAKE_HOME/.special-target" ]] || fail 'special target was not preserved as a directory'
[[ ! -L "$FAKE_HOME/.special-target" ]] || fail 'special target was folded into a directory symlink'
[[ -L "$FAKE_HOME/.special-target/setting.json" ]] || fail 'special-target package did not create its link'
run_dotfiles unlink special >/dev/null 2>&1
[[ ! -e "$FAKE_HOME/.special-target/setting.json" ]] || fail 'special-target unlink left its link in place'

printf 'PASS: dotfiles Stow wrapper\n'
