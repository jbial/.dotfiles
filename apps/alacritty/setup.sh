
echo "[SETTING UP ALACRITTY]"
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

mkdir ~/.config/alacritty
ln -s ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty


