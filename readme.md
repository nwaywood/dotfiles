# Dotfiles

This repo is a collection of my Neovim, tmux, zsh, etc. configurations. This dotfile project is heavily inspired by [Nick Nisi's dotfile project](https://github.com/nicknisi/dotfiles). See his talk [vim + tmux - OMG!](https://www.youtube.com/watch?v=5r6yzFEXajQ) if you want to be inspired.

## Install

This repository is being migrated to [GNU Stow](https://www.gnu.org/software/stow/). Stow manages symlinks only; Homebrew provisioning, macOS defaults, TPM setup, and login-shell changes are deliberately separate operations.

1. `git clone https://github.com/nwaywood/dotfiles.git ~/.dotfiles`
1. `cd ~/.dotfiles`
1. `brew install stow`
1. `./test/dotfiles-test.sh`
1. `./bin/dotfiles check --all`
1. `./bin/dotfiles link --all`

`bin/dotfiles link` runs a Stow simulation before it creates links. Every operation targets `$HOME`, uses `--no-folding`, and only manages the packages explicitly named. `--all` links only the packages listed in `stow/packages.default`; special targets remain opt-in.

Useful commands:

```bash
./bin/dotfiles bootstrap             # verify GNU Stow is available
./bin/dotfiles packages              # show default and opt-in packages
./bin/dotfiles check git starship    # dry-run and report conflicts
./bin/dotfiles link git starship     # link named packages
./bin/dotfiles unlink starship       # remove only Stow-created links
```

For maintainer instructions on adding a package or safely migrating a new symlink—including XDG, home-dotfile, and application-specific target examples—see [`stow/README.md`](stow/README.md).

The current default packages are `git`, `starship`, shell, tmux, Herdr, and the migrated standalone XDG editor, terminal, and tool configurations. Run `./bin/dotfiles packages` for the authoritative list. macOS-only and special-target configurations remain separate opt-in migrations. Do **not** run `install.sh`: it is now a safe deprecation message rather than a combined installer.

### Conflict handling and rollback

Never use `stow --adopt`: it can silently absorb machine-local configuration into the repository. Before linking a package, inspect any conflict and back up only user-owned paths under `~/.dotfiles-backup/<timestamp>/`. Existing links owned by this checkout may be replaced after their target is confirmed.

Rollback is package-scoped:

```bash
./bin/dotfiles unlink <package>
```

Restore that package's recorded backup only when needed. Runtime state, logs, sockets, caches, and credentials are not Stow-managed.

### Herdr runtime state

Only `~/.config/herdr/config.toml` is Stow-managed. `~/.config/herdr` itself remains a real local directory, so session data, logs, sockets, and plugin state stay out of the checkout. Herdr runtime state is backed up under `~/.dotfiles-backup/` before a migration and must never be added to a Stow package.

### Explicit provisioning

Stow manages links only. Run provisioning steps independently and only when wanted:

```bash
./install/brew.sh  # Homebrew packages and applications
./install/osx.sh   # macOS defaults
./install/tmux.sh  # idempotent TPM setup
```

## VS Code setup

VS Code is an opt-in package because its target is macOS-specific. It manages only `settings.json`, `keybindings.json`, and `prompts/` beneath `~/Library/Application Support/Code/User`:

```bash
./bin/dotfiles check vscode
./bin/dotfiles link vscode
```

Use `./bin/dotfiles unlink vscode` to remove only the Stow-created links.

## Neovim Setup

[Neovim](https://neovim.io/) config is managed by the `nvim` Stow package at `~/.config/nvim`. Inside of [`.zshrc`](stow/shell/.zshrc), the `EDITOR` shell variable is set to `nvim`, defaulting to Neovim for editor tasks, such as git commit messages. Additionally, I have aliased `vim` to `nvim` in [`aliases.zsh`](zsh/aliases.zsh). You can remove this if you would rather not alias the `vim` command to `nvim`.

### Installation

Neovim plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug). To install plugins, run:

`nvim +PlugInstall`

## ZSH Setup

ZSH is configured in [`stow/shell/.zshrc`](stow/shell/.zshrc), which the `shell` package links to `~/.zshrc`. The following occurs in this file:

- set the EDITOR to nvim
- Recursively search the $DOTFILES/zsh directory for files ending in .zsh and source them
- Setup `oh-my-zsh` and install plugins
- Add the ~/bin and $DOTFILES/bin directories to the path
- And more...

`nick-pure.zsh-theme` and the custom `my-vi-mode` plugin are in the opt-in `oh-my-zsh` package. Install Oh My Zsh first—the package targets its existing `~/.oh-my-zsh` directory but does not create or install it:

```bash
./bin/dotfiles check oh-my-zsh
./bin/dotfiles link oh-my-zsh
```

## Tmux Setup

Tmux is a terminal multiplexor which lets you create windows and splits in the terminal that you can attach and detach from. I use it to keep multiple projects open in separate windows and sessions and to create an IDE-like environment to work in where I can have my code open in Neovim and a shell open to run tests/scripts. Tmux is configured in ~/.tmux.conf, and in tmux/theme.sh, which defines the colors used, the layout of the tmux bar, and what what will be displayed, including the time and date, open windows, tmux session name, computer name. If not running on macOS, this configuration should be removed.

### Installation

Tmux plugins are managed with [tpm](https://github.com/tmux-plugins/tpm). To install plugins, run:

`<prefix> - I`

from within tmux. This installs the `tmux-resurrect` plugin which lets tmux sessions/windows/panes be persisted across OS reboots. `prefix - ^s` to save the tmux environment and `prefix - ^r` to restore the tmux environent.

## Font

My neovim and zsh setups both make use patched [nerd fonts](https://github.com/ryanoasis/nerd-fonts). 
It is recommended to use one, otherwise some characters will look funky. I personally use `Fira Mono Nerd Font`. It can be installed with:

```bash
brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font
```
