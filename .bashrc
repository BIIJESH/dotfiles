# ~/.bashrc
# Enable bash-completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi
export PATH="$HOME/.config/emacs/bin/:$PATH"
export VISUAL=nvim;
export EDITOR=nvim;
export PS1='\n\[\e[36m\]\D{%Y-%m-%d} \[\e[39m\] \h\[\e[36m\] in \[\e[32m\]\w\n\[\e[37m\]\[\e[36m\] \[\e[32m\]❯\[\033[00m\] '
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
alias fm='thunar &'
alias cls='clear'
alias ls='exa --icons'
# Your prompt configuration
alias :q='exit'
alias xam='sudo /opt/lampp/lampp start'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias pgadmin='source pgadmin4/bin/activate'
alias pmq='pacman -Q | fzf | wl-copy'
alias em='emacsclient -t'
alias record='wf-recorder --file=screen.mp4' 
eval "$(zoxide init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
