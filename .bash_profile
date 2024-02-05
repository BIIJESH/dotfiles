#
# ~/.bash_profile
#
if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland
fi
[[ -f ~/.bashrc ]] && . ~/.bashrc
