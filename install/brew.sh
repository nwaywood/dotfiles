#!bin/sh

echo "Installing homebrew packages..."

# brew stuff
# brew tap caskroom/cask

# core development tools
brew install git
brew install tmux
brew install gh
brew install zsh

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

# neovim
brew install neovim
brew install python3
brew install node # for coc.nvim
brew install go # for hexokinase

# gif creation app
# used by t9md - https://www.cockos.com/licecap/
# https://giphy.com/apps/giphycapture
# brew cask install licecap

# show key presses for demos/talks
# brew cask install keycastr
