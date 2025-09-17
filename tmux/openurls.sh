tmux capture-pane -pS -1000 | grep -oP 'http[s]?://[^\) ]+' | xargs -n 1 xdg-open
