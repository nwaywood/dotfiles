This dotfile project was inspired by the following talk by [Nick Nisi](https://github.com/nicknisi/):

https://www.youtube.com/watch?v=5r6yzFEXajQ

# Install

1. `git clone https://github.com/niwaywood/dotfiles.git ~/.dotfiles`
2. `cd ~/.dotfiles`
3. `bash install.sh`

## vim plugins

Vim plugins are managed with [Vundle](https://github.com/VundleVim/Vundle.vim). To install, run:

`vim +PluginInstall +qall`

For the `YouCompleteMe` plugin, the following steps are also required for setup:

`cd ~/.vim/bundle/YouCompleteMe`
`bash install --clang-completer --gocode-completer`


## TODO:
Add to dotfiles
- atom
- node?
