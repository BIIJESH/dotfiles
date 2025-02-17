export VISUAL=nvim
# source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'
export PATH=$PATH:$HOME/go/bin
export FZF_DEFAULT_OPTS="--bind=tab:up,shift-tab:down"
export PATH="$HOME/.nix-profile/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export BAT_THEME=tokyonight_night
export BROWSER="/usr/bin/firefox"
export EDITOR=nvim
export PATH="$PATH:/home/papa/.local/share/bob/nvim-bin"
source ~/.zsh-autopair/autopair.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
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
alias fsb='~/tmux/fsb.sh'
alias fshow='~/tmux/fshow.sh'
alias cd='z'

alias cat="bat --style=plain --theme tokyonight_night"
alias un='sudo pacman -Rns'
alias nb='newsboat'
alias dbl='bluetoothctl disconnect'
alias prun='pacman -Qtdq | sudo pacman -Rns -'
alias up='sudo pacman -Syu'
alias v='nvim'
alias mv='mv -i'
alias cp='cp -i'
alias gh="cliphist list | fzf | cliphist decode | wl-copy"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias t='tmux'
alias ts='tmuxsession'
alias tks='tmux kill-session'
alias fm='thunar &'
alias cls='clear'
alias ls='exa --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias :q='exit'
alias xam='sudo /opt/lampp/lampp start'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
# alias pgadmin='source pgadmin4/bin/activate'
alias pmq='pacman -Q | fzf | wl-copy'
alias cd='z'
alias em='emacsclient -t'

alias record='wf-recorder --file=screen.mp4'

eval "$(zoxide init zsh)"
unsetopt BEEP 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


if [ -e /home/papa/.nix-profile/etc/profile.d/nix.sh ]; then . /home/papa/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

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

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland
fi
export MOZ_ENABLE_WAYLAND=1
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '-['$branch'] '
  fi
}
# Enable substitution in the prompt.
setopt prompt_subst
# Config for prompt. PS1 synonym.
PS1='%~ $: $(git_branch_name)'


source /home/$USER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
