#!/bin/bash

# Get the word from the clipboard using wl-clipboard
word=$(wl-paste)

if [ -z "$word" ]; then
  notify-send "Clipboard is empty or doesn't contain a word."
  exit 1
fi

# Make the API request using curl to DictionaryAPI
res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")
regex=$'"definition":"\\K(.*?)(?=")'
definitions=$(echo "$res" | grep -Po "$regex")

# Check if the definition is empty
if [ -z "$definitions" ]; then
  notify-send "No definition found for '$word'."
  exit 1
fi

separatedDefinition=$(sed ':a;N;$!ba;s/\n/\n\n/g' <<< "$definitions")
notify-send "Word Definition" "$word:\n$separatedDefinition"