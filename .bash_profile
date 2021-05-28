# -------------------------
# MAKE TERMINAL BETTER
# -------------------------
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias ll='ls -la'
alias hg='history | grep '
alias fp='flight'

# -------------------------
# EDITOR CONFIG etc
# -------------------------
alias v='vim .'
vimf () {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0 -m)
  [ -n "$file" ] && vim -p "$file"
}

# ----------------------
# GIT
# ----------------------
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git checkout'
alias gb='git branch'
alias gp='git pull'
alias git='hub'
alias pr='git pull-request -b develop'

# ---------------------
# DOCKER
# ---------------------
alias dp='docker ps'
alias dos='docker stop $(docker ps -aq)'
alias dup='dos && docker-compose up' 
alias bup='docker stop $(docker ps -aq) && BYEBUG=1 docker-compose up' 
alias dstop='docker-machine stop default'
alias dstart='docker-machine start default && denv'
alias dstatus='docker-machine status'
dspec () {
  echo "docker exec myrewards_myrewards.app_1 bash -c 'bin/rspec $1'"
  docker exec myrewards_myrewards.app_1 bash -c 'bin/rspec $1'
}

docker_compose_exec_when_up() {
  local service="$1"; shift

  wait_for_docker_compose_service "$service"
  docker-compose exec "$service" "$@"
}

wait_for_docker_compose_service() {
  local service="$1"; shift

  until docker-compose ps "$service" 2> /dev/null | grep -i --silent "up"; do
    sleep 1
  done
}

dbash () {
  echo "Running docker containers:"
  containers=()
  id=0
  for fn in `docker ps --format="{{.Names}}" | sort`; do
    containers[$id]=$fn
    echo "  $id. $fn"
    ((id++))
  done
  echo -n "bash : "
  read container_id
  docker exec -it ${containers[$container_id]} bash
}

dsh () {
  echo "Running docker containers:"
  containers=()
  id=0
  for fn in `docker ps --format="{{.Names}}" | sort`; do
    containers[$id]=$fn
    echo "  $id. $fn"
    ((id++))
  done
  echo -n "bash : "
  read container_id
  docker exec -it ${containers[$container_id]} sh
}

trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

alias myip='curl ip.appspot.com && echo'                    # myip:         Public facing IP Address
alias cleardns='brew services restart dnsmasq && sudo killall -HUP mDNSResponder'

# Preferred Editor
export EDITOR=/usr/bin/nano

# Trigger ~/.bashrc commands
. ~/.bashrc

export PATH="/usr/local/sbin:$PATH"
export PATH="~/code/flutter/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
