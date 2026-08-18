# VS Code

VS Code is a GNU Stow opt-in package because it uses the macOS-specific target:

```text
~/Library/Application Support/Code/User
```

Link the managed files with:

```bash
cd ~/.dotfiles
./bin/dotfiles check vscode
./bin/dotfiles link vscode
```

The package manages `settings.json`, `keybindings.json`, and `prompts/`. It deliberately does not manage VS Code extensions, caches, or machine-local application state.

## Adding Vim/Neovim plugins in VS Code

1. Add the plugin to `vscode/vscode.vim`.
2. Run `nvim -u vscode/vscode.vim`.
3. Execute `:PlugInstall`.
