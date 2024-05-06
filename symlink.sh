
#!/bin/bash

# Define the source directory for folders (from ~/.config/)
source_folder="$HOME/.config"

# Define the destination directory for symlinks (in ~/dotfiles/.config/)
destination_folder="$HOME/dotfiles/.config"

# Check if the destination folder exists, if not, prompt the user to create it
if [ ! -d "$destination_folder" ]; then
    echo "Error: Destination folder '$destination_folder' does not exist."
    echo "Please create the folder '$destination_folder' and run the script again."
    exit 1
fi

echo "Enter file or directory names to symlink (type 'done' when finished):"
while true; do
    read -p "Enter file or directory name: " input

    # Check if the user wants to exit
    if [ "$input" == "done" ]; then
        echo "Exiting..."
        break
    fi

    # Get the absolute path of the input
    abs_path=$(readlink -f "$input")

    # Check if the input is a valid file or directory
    if [ -f "$abs_path" ]; then
        # Create the symlink in ~/dotfiles/ for files
        ln -sT -- "$abs_path" "$HOME/dotfiles/$(basename "$abs_path")"
        echo "Symlink created successfully for file: $input"
    elif [ -d "$abs_path" ]; then
        # Create the symlink in ~/dotfiles/.config/ for directories
        ln -sT -- "$abs_path" "$destination_folder/$(basename "$abs_path")"
        echo "Symlink created successfully for directory: $input"
    else
        echo "Error: $input is not a valid file or directory."
    fi
done
