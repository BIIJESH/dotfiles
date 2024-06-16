
#!/bin/bash

# Select the language
selected=$(cat ~/tmux/.tmux-cht-languages | fzf)
if [[ -z $selected ]]; then
    exit 0
fi

# Function to perform the search
search() {
    local selected_language=$1
    while true; do
        read -p "Enter Query: " query
        if [[ -z $query ]]; then
            echo "Query cannot be empty. Try again."
            continue
        fi

        query=$(echo $query | tr ' ' '+')
        url="cht.sh/$selected_language/$query"
        curl_cmd="curl -s $url"

        clear
        echo "Fetching results for: $query in $selected_language"
        echo "URL: $url"  # Echo the URL for debugging
        eval $curl_cmd

        echo
        read -p "Press Enter to search again or close this pane to exit."
    done
}

# Open a new tmux pane and run the search function with the selected language as an argument
tmux neww bash -c "$(declare -f search); search $selected"
