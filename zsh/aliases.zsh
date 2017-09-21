# misc aliases

# docker shiz
alias dm='docker-machine'
alias dc='docker-compose'
alias d='docker'

# neovim
alias vim='nvim'

# git
alias gs='git status'
alias g='git'

# finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# iterm theme
# http://superuser.com/questions/414560/is-there-a-keyboard-shortcut-to-alternate-between-color-schemes-in-iterm2
alias light='it2prof Light && export BACKGROUND=light'
alias dark='it2prof Default && export BACKGROUND=dark'

# misc
alias c='clear'
alias vimf='vim "+Denite file_rec"'
alias vimn='vim +NERDTreeToggle'
alias tree='tree -I "node_modules"'

mkcd () {
    test -d "$1" || mkdir "$1" && cd "$1"
}
