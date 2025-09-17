function fshow() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --preview \
    'echo {} | grep -o "[a-f0-9]\{7\}" | xargs -I % sh -c "git show % | bat --color=always --paging=always -l rs"' \
    --header "Enter to view diff, Ctrl-O to checkout" \
    --bind "q:abort,ctrl-f:preview-page-down,ctrl-b:preview-page-up" \
      --bind "ctrl-o:become:(echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs git checkout)" \
    --bind "enter:execute:
      (echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git diff %^! | bat --paging=always --color=always -l rs') << 'FZF-EOF'
      {}
FZF-EOF" --preview-window=right:60%
}

fshow "$@"
