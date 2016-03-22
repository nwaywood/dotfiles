This dotfile project was inspired by the following talk by [Nick Nisi](https://github.com/nicknisi/):

https://www.youtube.com/watch?v=5r6yzFEXajQ

# Install

1. `git clone https://github.com/niwaywood/dotfiles.git ~/.dotfiles`
2. `cd ~/.dotfiles`
3. `bash install.sh`

## vim plugins

Vim plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug). To install plugins, run:

`nvim +PlugInstall`

For the `YouCompleteMe` plugin, the following steps are also required for setup:

`cd ~/.config/nvim/plugged/YouCompleteMe`

`./install.py --clang-completer --gocode-completer --tern-completer`

## tmux plugins

Tmux plugins are managed with [tpm](https://github.com/tmux-plugins/tpm). To install plugins, run:

`<prefix> - I`

from within tmux

## TODO:
Add to dotfiles
- atom
- node (nvm)
