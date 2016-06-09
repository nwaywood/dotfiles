#!bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# brew stuff
brew tap caskroom/cask

# core development tools
brew install mercurial
brew install git
brew install macvim --with-override-system-vim
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install z

# languages and langauge tools
brew install go --with-cc-all

# CLI tools
brew install tree
brew install jq
brew install ag

# neovim
brew install neovim/neovim/neovim
brew install python3

# tool for spacemacs flycheck
brew install ispell --with-lang-en

# for vim tagbar
brew install ctags-exuberant
brew install gotags

