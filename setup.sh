#!/bin/bash
set -e

VIM_PLUGIN_DIR="$HOME/.vim/pack/plugins/start"

cd "$HOME"
mkdir -p "$VIM_PLUGIN_DIR"

plugins=(
    "nerdtree https://github.com/preservim/nerdtree.git"
    "ctrlp https://github.com/ctrlpvim/ctrlp.vim.git"
    "fugitive https://github.com/tpope/vim-fugitive.git"
    "vim-polyglot https://github.com/sheerun/vim-polyglot.git"
    "vim-airline https://github.com/vim-airline/vim-airline.git"
    "vim-airline-themes https://github.com/vim-airline/vim-airline-themes.git"
    "vim-smoothie https://github.com/psliwka/vim-smoothie.git"
    "vim-tmux-navigator https://github.com/christoomey/vim-tmux-navigator.git"
)

for entry in "${plugins[@]}"; do
    name="${entry%% *}"
    url="${entry#* }"

    dir="$VIM_PLUGIN_DIR/$name"
    if [ -d "$dir/.git" ]; then
        echo "Updating $name..."
        git -C "$dir" pull --ff-only
    else
        echo "Installing $name..."
        git clone --depth 1 "$url" "$dir"
    fi

    if [ -d "$dir/doc" ]; then
        vim -u NONE -c "helptags $dir/doc" -c q
    fi
done

TPM_DIR="$HOME/.tmux/plugins/tpm"
mkdir -p "$TPM_DIR"
if [ ! -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
