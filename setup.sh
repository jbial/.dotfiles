#!/bin/bash

# install vundle for vim
echo "[INSTALLING VIM-VUNDLE]"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "PluginInstall" -c "q" -c "q"

# install miniconda
echo "[INSTALLING MINICONDA]"
mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

# install zsh
echo "[INSTALLING OHMYZSH]"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Define the source directory containing the dotfiles
DOTFILES_DIR="$HOME/.dotfiles"

# Verify if the DOTFILES_DIR exists
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Directory $DOTFILES_DIR does not exist."
  exit 1
fi

for file in "$DOTFILES_DIR"/.*; do

  if [ "$file" = "$DOTFILES_DIR/." ] || \
     [ "$file" = "$DOTFILES_DIR/.." ] || \
     [ "$file" = "$DOTFILES_DIR/.git" ]; then
    continue
  fi

  # Create the symlink in the home directory
  ln -s "$file" "$HOME/$(basename $file)"
done

echo "[INITIALIZING CONDA]"
~/miniconda3/bin/conda init zsh
