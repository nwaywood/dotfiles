# misc aliases

# docker shiz
alias dm='docker-machine'
alias dc='docker-compose'
alias d='docker'

# neovim
alias vim='nvim'

# git
# https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one#comment84748132_42071865
alias gs='nvim -c "G | %bd | e# | bd#"'
# alias gs='git status'
alias g='git'
alias lg='lazygit'

# finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# misc
alias c='clear'
alias ccat='pygmentize -g'
alias wiki='nvim +VimwikiIndex'
alias vimf='nvim "+Denite file_rec"'
alias vimn='nvim +NERDTreeToggle'
alias tree='tree -I "node_modules"'
alias find='find . -name'
alias ls="exa"
alias la="exa -a"
alias ll="exa -la"
# alias vimg='open -a emacs'

mkcd () {
    test -d "$1" || mkdir "$1" && cd "$1"
}
