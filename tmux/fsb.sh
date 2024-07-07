#!/bin/bash
function fsb() {
    local pattern=$*
    local branches branch
    branches=$(git branch --all | awk 'tolower($0) ~ /'"$pattern"'/') &&
    branch=$(echo "$branches" |
            fzf-tmux -p --reverse -1 -0 +m --bind 'tab:down,shift-tab:up') &&
    if [ "$branch" = "" ]; then
        echo "[$0] No branch matches the provided pattern"; return;
    fi;
    git checkout "$(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")"
}
fsb "$@"
