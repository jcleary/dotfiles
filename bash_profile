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

# ----------------------
# GIT
# ----------------------
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git checkout'
alias gb='git branch'


# ---------------------
# DOCKER
# ---------------------
alias denv='eval $(docker-machine env default)'
alias dp='docker ps'
alias dr='docker-machine restart default'
alias dup='docker-compose up' 
alias dstop='docker-machine stop default'
alias dstart='docker-machine start default && denv'
alias dstatus='docker-machine status'

# ---------------------
# MYREWARDS/GPS
# ---------------------
alias app2='ssh jcleary@52.17.60.41'
alias app3='ssh jcleary@52.31.178.218'
alias app4='ssh jcleary@52.50.50.194'
alias staging='ssh jcleary@54.76.255.30'
alias gps='ssh jcleary@52.49.250.93'

trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

alias myip='curl ip.appspot.com && echo'                    # myip:         Public facing IP Address
alias cleardns='brew services restart dnsmasq && sudo killall -HUP mDNSResponder'

# Preferred Editor
export EDITOR=/usr/bin/nano

# Trigger ~/.bashrc commands
. ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ "`docker-machine status`" = "Running" ]; then denv; fi
export PATH="/usr/local/sbin:$PATH"
