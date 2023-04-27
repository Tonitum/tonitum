parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# General Purpose
alias ll='ls -al --color=auto'
alias ls="ls -F --color=auto"
alias fclear="clear && printf '\e[3J'"
alias up='cd `git rev-parse --show-toplevel`'
alias psg='ps -ef | grep'
# -> Prevent accidentally clobbering files
alias mkdir='mkdir -p'

# Alias Management
alias codealiases="code ~/.bash_aliases"
alias coderc="code ~/.bashrc"
alias openrc="vim ~/.bashrc"
alias openaliases="vim ~/.bash_aliases"
alias re-source="source ~/.bashrc"

# Git Management
alias prune-branches='git branch | grep -v "master" | xargs git branch -D '
alias gclean-list='git clean -nxdf -e .vscode'
alias gclean-full='git clean -xdf -e .vscode'
alias rebase-branch='git rebase master $(git rev-parse --abbrev-ref HEAD)'
alias rebase-master='git checkout master && git pull --rebase && git submodule update --recursive'
alias gc='git commit -m '
alias gs='git status'
alias gbl='git branch'
alias gbn='git checkout -b '
alias gp='git pull --rebase'
alias gmaster='git checkout master'

# vim < neovim
alias vim=nvim

# Kubernetes
alias k=kubectl
