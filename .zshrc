# Set default editor
export VISUAL=nvim
export PATH="$HOME/.nix-profile/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export BAT_THEME=tokyonight_night
export BROWSER="/usr/bin/brave"
export EDITOR=nvie
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="$PATH:/home/papa/.local/share/bob/nvim-bin"
source ~/.zsh-autopair/autopair.zsh
export PS1='%F{cyan}%D{%Y-%m-%d}%f  %m in %F{green}%~%f 
 %F{cyan}❯%f '
precmd() { print "" }
setopt autocd	

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

alias cat="bat --theme tokyonight_night"
alias un='sudo pacman -Rns'
alias nb='newsboat'
alias dbl='bluetoothctl disconnect'
alias prun='pacman -Qtdq | sudo pacman -Rns -'
alias up='sudo pacman -Syu'
alias v='nvim'
alias mv='mv -i'
alias cp='cp -i'
alias gh='history | grep'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias t='tmux'
alias ts='tmuxsession'
alias tks='tmux kill-session'
alias ncmpcpp='ncmpcpp -b .config/ncmpcpp/bindings'
alias fm='thunar &'
alias cls='clear'
alias ls='exa --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias ll='exa -l --icons --color=always --group-directories-first'
alias :q='exit'
alias xam='sudo /opt/lampp/lampp start'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
# alias pgadmin='source pgadmin4/bin/activate'
alias pmq='pacman -Q | fzf | wl-copy'
alias em='emacsclient -t'
alias record='wf-recorder --file=screen.mp4'

eval "$(zoxide init zsh)"
unsetopt BEEP 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

fzf_preview() {
  local current_dir=$(pwd)
  local selected_file
  selected_file=$(find "$current_dir" -type f -not -path '*/.git/*'| fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
  if [[ -n "$selected_file" ]]; then
    local selected_dir=$(dirname "$selected_file")
    cd "$selected_dir"
    nvim "$(basename "$selected_file")"
  fi
}
zle -N fzf_preview
bindkey '^F' fzf_preview

if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland
fi

if [ -e /home/papa/.nix-profile/etc/profile.d/nix.sh ]; then . /home/papa/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'
declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

# Function for work session
work_session() {
  echo "Starting work session"
  timer "${pomo_options["work"]}m"
  notify-send "'work' session done"
}

# Function for break session
break_session() {
  echo "Starting break session"
  timer "${pomo_options["break"]}m"
  notify-send "'break' session done"
}

# Pomodoro function
pomodoro() {
  if [ -n "$1" ] && [ -n "${pomo_options["$1"]}" ]; then
    local val="$1"
    case "$val" in
      "work")
        work_session
        break_session  # Start break session after work session
        ;;
      "break")
        break_session
        ;;
      *)
        echo "Invalid session type"
        ;;
    esac
  fi
}
