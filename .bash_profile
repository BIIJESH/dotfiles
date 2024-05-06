#
# ~/.bash_profile

  if [ "$(tty)" = "/dev/tty1" ];then
    exec Hyprland
  fi
  [[ -f ~/.bashrc ]] && . ~/.bashrc

# export PATH=$PATH:$HOME/.emacs.d/bin

 export PATH=$PATH:/home/fly/.spicetify
