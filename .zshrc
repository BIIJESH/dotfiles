
# Set default editor
export VISUAL=nvim
export EDITOR=nvim
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Set prompt
export PS1='%F{cyan}%D{%Y-%m-%d}%f  %m in %F{green}%~%f
 %F{cyan}❯%f '

# Aliases
alias in='paru -S'
alias gcl='git clone'
alias un='sudo pacman -Rns'
alias dbl='bluetoothctl disconnect'
alias prun='pacman -Qtdq | sudo pacman -Rns -'
alias up='sudo pacman -Syu'
alias vi='nvim'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias ll='ls -lah'
alias lf='ls -1A | fzf'
alias gh='history | grep'
alias t='tmux'
alias ts='tmuxsession'
alias tks='tmux kill-session'
alias ncmpcpp='ncmpcpp -b .config/ncmpcpp/bindings'

alias fm='thunar &'
alias cls='clear'
alias ls='exa --icons'
alias :q='exit'
alias xam='sudo /opt/lampp/lampp start'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias pgadmin='source pgadmin4/bin/activate'
alias pmq='pacman -Q | fzf | wl-copy'
alias em='emacsclient -t'
alias record='wf-recorder --file=screen.mp4'

# Initialize zoxide
eval "$(zoxide init zsh)"
unsetopt BEEP 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland
fi
