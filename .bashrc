export VISUAL=nvim
# source ~/powerlevel10k/powerlevel10k.zsh-theme
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.nix-profile/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export BAT_THEME=tokyonight_night
export BROWSER="/usr/bin/zen-browser"
export EDITOR=nvim

RED="\[\033[0;31m\]"
WHITE="\[\033[1;37m\]"
MAGENTA="\[\033[0;35m\]"
ORANGE="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BOLD="\[\033[1m\]"
RESET="\[\033[0m\]"


# Corrected PS1 export
export PS1="${BOLD}${MAGENTA}\u@${RED}\h${WHITE}: [${GREEN}\w${WHITE}] \$ ${RESET}"

# Aliases
alias in='paru -S'
alias gcl='git clone'
alias addup='git add -u'
alias pull='git pull'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias commit='git commit -a -m'
alias fetch='git fetch'
alias push='git push'
alias stats='git status'
alias fsb='~/tmux/fsb.sh'
alias fshow='~/tmux/fshow.sh'
alias cd='z'

alias cat="bat --style=plain --theme tokyonight_night"
alias un='sudo pacman -Rns'
alias news='newsboat'
alias dbl='bluetoothctl disconnect'
alias prun='pacman -Qtdq | sudo pacman -Rns -'
alias up='sudo pacman -Syu'
alias v='nvim'
alias mv='mv -i'
alias cp='cp -i'
alias gh='tac ~/.bash_history | fzf | wl-copy'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias t='tmux'
alias ts='tmuxsession'
alias tks='tmux kill-session'
alias fm='thunar &'
alias cls='clear'
alias ls='ls --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias :q='exit'
alias xam='sudo /opt/lampp/lampp start'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
alias tree="tree -a -C --prune -I 'node_modules|venv|.git|.cache|dist|build'"
# alias pgadmin='source pgadmin4/bin/activate'
alias pmq='pacman -Q | fzf | wl-copy'
alias cd='z'
alias em='emacsclient -t'

alias record='wf-recorder --file=screen.mp4'


shopt -s histappend

PROMPT_COMMAND='history -a; history -n'

HISTSIZE=100000
HISTFILESIZE=200000
shopt -s cmdhist
HISTCONTROL=ignoredups:erasedups
if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland
fi

eval "$(zoxide init bash)"
