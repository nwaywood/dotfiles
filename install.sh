#!/bin/bash

echo "Initializing submodules"
git submodule update --init --recursive

echo "Setting up osx settings"
source installosx.sh
echo "Brewing all the things"
source install/brew.sh

echo "Adding base16-shell project into .config"
git clone https://github.com/chriskempson/base16-shell.git $HOME/.dotfiles/.config/base16-shell

echo "Installing vundle (vim package manager)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Symlinking dotfiles"
source install/link.sh


echo "go getting all the things"
source install/go.sh

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done!"
