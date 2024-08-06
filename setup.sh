#!/bin/bash

# Define the source directory containing the dotfiles
DOTFILES_DIR="$HOME/.dotfiles"

# Verify if the DOTFILES_DIR exists
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Directory $DOTFILES_DIR does not exist."
  exit 1
fi

# Loop through each file in the DOTFILES_DIR
for file in "$DOTFILES_DIR"/.*; do
  # Skip the special directories . and ..
  if [ "$file" == "$DOTFILES_DIR/." ] || [ "$file" == "$DOTFILES_DIR/.." ]; then
    continue
  fi

  # Create the symlink in the home directory
  ln -s "$file" "$HOME/$(basename $file)"
done
