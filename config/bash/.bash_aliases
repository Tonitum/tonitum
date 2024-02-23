###############################################################################
# Functions
###############################################################################
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

get_cwd() {
  in_repo=$(git rev-parse >/dev/null 2>/dev/null; echo $?)

  if [[ $in_repo -ne 0 ]]; then
      pwd
      exit 0
  fi

  repo_path=$(git rev-parse --show-toplevel)
  repo_root=$(git rev-parse --show-toplevel | rev | cut -d "/" -f 1 | rev | awk '{print tolower($0)}')
  pwd | sed 's@'"$repo_path"'@'"$repo_root"'@'
  exit 0
}

commit_by_branch() {
    if [[ $# == 0 ]]; then
        echo "Please provide a commit message"
        echo "No commit made"
        return
    fi
    BRANCH=$(git rev-parse --abbrev-ref HEAD); (git commit -m "refs $BRANCH: $1")
}

get_exercise() {
    EXERCISE=""
    EXERCISE_COUNT=5
    REP_MIN=1
    REP_MAX=5
    INDEX=$(shuf -i 1-$EXERCISE_COUNT -n 1)
    case $INDEX in
        1)
        EXERCISE="PUSHUPS"
        REP_MIN=3
        REP_MAX=8
        ;;

        2)
        EXERCISE="SITUPS"
        REP_MIN=3
        REP_MAX=8
        ;;

        3)
        EXERCISE="SQUATS"
        ;;

        4)
        EXERCISE="PLANK"
        REP_MIN=5
        REP_MAX=15
        ;;

        5)
        EXERCISE="LUNGES"
        REP_MIN=3
        REP_MAX=8
        ;;
    esac

    COUNT=$(shuf -i $REP_MIN-$REP_MAX -n 1)

    echo "======================================================="
    echo -e "----------------------\n"
    echo "TIME TO EXERCISE"
    echo "Exercise: $EXERCISE"
    echo "Reps: $COUNT"
    echo -e "\n----------------------"
    echo "======================================================="
}

run_shell_in_container() {
    docker exec -it "$1" /bin/bash
}

get_image_name() {
  CID=$(basename "$(cat /proc/1/cpuset)")
  if [[ $CID == '/' ]]; then
    echo "$HOSTNAME"
  else
    D_IMAGE_NAME=$(docker inspect --format='{{.Config.Image}}' "$CID")
    echo "${D_IMAGE_NAME}"
  fi
}

###############################################################################
# Aliases
###############################################################################

########################################
# General Purpose
########################################
alias ll='ls -al --color=auto'
alias ls="ls -F --color=auto"
alias fclear="clear && printf '\e[3J'"
alias up='cd `git rev-parse --show-toplevel`'
alias psg='ps -ef | grep'
alias mkdir='mkdir -p' # -> Prevent accidentally clobbering files
alias up='cd `git rev-parse --show-toplevel`'

########################################
# Bash Config Aliases
########################################
alias openaliases="vim ~/.bash_aliases"
alias edita="vim ~/.bash_aliases"
alias openrc="vim ~/.bashrc"
alias editb="vim ~/.bashrc"
alias re-source="source ~/.bashrc"
alias rsb="source ~/.bashrc"

########################################
# Git Management
########################################
# swap back to last branch
alias gback='git checkout $LAST_BRANCH'
# swap to provided git branch
alias gbc='git checkout '
# list git branches
alias gbl='git branch'
# create a new git branch
alias gbn='git checkout -b '
# get an exercise to do and commit using the provided message
alias gc="get_exercise; commit_by_branch"
# fuzzy find git branches
alias gcb='git branch | fzf | xargs git checkout'
# delete untracked files
alias gclean-full='git clean -xdf -e .clangd -e Makefile'
# list untracked files
alias gclean-list='git clean -nxdf -e .clangd -e Makefile'
# change to main branch
alias gmain='export LAST_BRANCH=$(git rev-parse --abbrev-ref HEAD); git checkout main'
# change to master branch
alias gmaster='export LAST_BRANCH=$(git rev-parse --abbrev-ref HEAD); git checkout master'
# pull and rebase into current branch
alias gp='git pull --rebase'
# get root git directory
alias grd="git rev-parse --show-toplevel"
# self explanitory
alias gs='git status'
alias prune-branches='git branch | grep -v "master" | xargs git branch -D '
# rebase the main branch into the current branch
alias rebase-branch-main='git rebase main $(git rev-parse --abbrev-ref HEAD)'
# rebase the master branch into the current branch
alias rebase-branch='git rebase master $(git rev-parse --abbrev-ref HEAD)'
# rebase the main branch and update submodules
alias rebase-main='git checkout main && git pull --rebase && git submodule update --recursive'
# rebase the master branch and update submodules
alias rebase-master='git checkout master && git pull --rebase && git submodule update --recursive'
# rebase the develop branch into the current branch
alias rebase-branch-develop='git rebase develop $(git rev-parse --abbrev-ref HEAD)'

########################################
# Program aliases
########################################
# vim < neovim
alias vim=nvim
# Kubernetes control
alias k=kubectl
# Maven settings
# alias mvnd='mvn --settings "/home/vagrant/work/maven-settings/.m2/settings.xml"'
alias mvnl='mvn "-Dmaven.repo.local=.m2/repository" -s ".m2/settings.xml"  "-settings.security=.m2/settings-security.xml"'
alias mvng='mvn -s "$(git rev-parse --show-toplevel)/.m2/settings.xml"  "-settings.security=$(git rev-parse --show-toplevel)/.m2/settings-security.xml"'
alias mvngr='mvn "-Dmaven.repo.local=$(git rev-parse --show-toplevel)/.m2/repository" -s "$(git rev-parse --show-toplevel)/.m2/settings.xml"  "-settings.security=$(git rev-parse --show-toplevel)/.m2/settings-security.xml"'

########################################
# Bash Vim
########################################
alias bvim-s='set -o vi'
alias bvim-x='set +o vi'

########################################
# Docker
########################################
# remove any unused images
alias prune-containers='docker rmi $(docker images -f dangling=true -q)'
# get the amount of space docker is taking up
alias docker-size='docker system df'
# clean the docker fs
alias docker-prune='docker system prune'
# deep clean the docker fs
alias docker-full-prune='docker system prune --all'
# get a list of running containers, filtered nicely
alias docker-ps='docker ps -a --format "table {{.Image}}\t{{.RunningFor}}\t{{.Names}}"'
# get a list of running containers, filtered nicely with ports
alias docker-ports='docker ps -a --format "table {{.Image}}\t{{.Ports}}\t{{.Names}}"'
alias docker-top="watch -n .5 'docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.Ports}}\"'"

########################################
# Package management
########################################
alias nexus-install='sudo -E nexus pip3 install '
alias pipi='pip --proxy https://proxy-lmi.global.lmco.com:80 --trusted-host pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org install '

bind -x '"\C-f":"tmux-sessionizer"'
