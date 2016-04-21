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

# for vim tagbar
brew install ctags-exuberant
brew install gotags

exit 0
