#!/bin/bash

DOTFILES_DIR=~/dotfiles
CONFIG_DIR=~/.config

# Loop through all files and directories in dotfiles
for item in "$DOTFILES_DIR"/*; do
  filename=$(basename "$item") # Get the name of the file/folder

  # If an existing file/folder/symlink is in ~/.config, remove it
  if [ -e "$CONFIG_DIR/$filename" ] || [ -L "$CONFIG_DIR/$filename" ]; then
    rm -rf "$CONFIG_DIR/$filename"
    echo "Removed existing $CONFIG_DIR/$filename"
  fi

  # Create symlink
  ln -s "$item" "$CONFIG_DIR/$filename"
  echo "Linked $item to $CONFIG_DIR/$filename"
done
