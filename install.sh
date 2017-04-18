#!/bin/bash

command_exists() {
	type "$1" > /dev/null 2>&1

}

echo "Symlinking dotfiles"
source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
	echo -e "\n\nRunning on OSX"

	echo "Setting up osx settings"
	source install/osx.sh

	echo "Brewing all the things"
	source install/brew.sh
fi

echo "Adding base16-shell project into .config"
git clone https://github.com/chriskempson/base16-shell.git $HOME/.dotfiles/.config/base16-shell

echo "Installing tpm (tmux package manager)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# zsh setup
if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Done!"
