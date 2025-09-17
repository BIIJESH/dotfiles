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
alias ls='ls --color=always --group-directories-first'
alias la='ls -a --color=always --group-directories-first'
alias ll='ls -l --color=always --group-directories-first'
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

eval "$(zoxide init zsh)"
unsetopt BEEP 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

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
function dir_icon {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "%B%F{cyan}%f%b"
  else
    echo "%B%F{cyan}%f%b"
  fi
}

function git_branch {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n "$branch" ]]; then
    echo "%B%F{yellow} $branch%f%b"
  fi
}

PS1='%B%F{blue}%f%b  %B%F{magenta}%n%f%b $(dir_icon)  %B%F{red}%~%f%b %(?.%B%F{green}.%F{red})%f%b '
RPROMPT='$(git_branch)'


source /home/papa/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$HOME/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
