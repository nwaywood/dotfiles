#!bin/sh

echo "Installing homebrew packages..."

# brew stuff
brew tap caskroom/cask

# core development tools
brew install git
# brew install macvim --with-override-system-vim
brew install reattach-to-user-namespace
brew install tmux
brew install zsh

# languages and langauge tools
brew install go --with-cc-all
# https://github.com/bitemyapp/learnhaskell
brew install haskell-stack
brew cask install elm-platform

# CLI tools
brew install z
brew install fzf
brew install tree
brew install jq
brew install fd # good find
brew install exa # good ls
brew install bat # good cat
brew install the_silver_searcher # good grep
brew install ripgrep # good grep
brew install --HEAD https://raw.githubusercontent.com/junegunn/blsd/master/blsd.rb

# neovim and atom
brew install neovim/neovim/neovim
brew install python3
brew cask install atom


# for vim tagbar
brew install ctags-exuberant
brew install gotags

# gif creation app
# used by t9md - https://www.cockos.com/licecap/
# https://giphy.com/apps/giphycapture
# brew cask install licecap

# show key presses for demos/talks
# brew cask install keycastr
