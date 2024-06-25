 #! /bin/sh

# Install pacman packages
sudo pacman -Syu \
    git \
    zip \
    unzip \
    flatpak \
    zsh \
    rofi \
    picom \
    github-cli \
    alacritty \
    tmux \
    jq \
    feh \
    noto-fonts-emoji \
    noto-fonts-cjk \
    thunar \
    chromium \
    starship \
    godot \
    steam \
    spotify-launcher \
    polybar \
    bluez \
    bluez-utils \
    blueberry \
    xorg-xrandr \
    neovim \
    tk \
    fzf \
    ripgrep \
    conky \
    figlet \
    obs-studio \
    pyenv \
    python-poetry \
    rustup \
    go

# Install rust
rustup toolchain install stable
rustup default stable

# Install aur helper
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# Install SDKman
curl -s "https://get.sdkman.io" | bash

# Install NVM - Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Install tmux plugins
mkdir ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install dotfiles
git clone https://github.com/danielelisenberg/dotfiles
cd dotfiles
git submodule update --init
cd ..
cp -r dotfiles/.config/* ~/.config/
cp dotfiles/.zshrc ~/.zshrc
cp dotfiles/.tmux.conf ~/.tmux.conf

# Install fonts
mkdir -p .local/share/fonts
mv dotfiles/fonts/* .local/share/fonts/

# Delete dotfiles repos
rm -rf dotfiles

# Change to zsh
chsh -s `which zsh` daniel
source ~/.zshrc

# Install languages
nvm install node
sdk install java 21.0.2-open
pyenv install 3.12.4

# Tmux
tmux source ~/.tmux.conf

# Install 1password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
cd 1password
makepkg -si

# paru packages
paru -Syu cava

# Install flatpaks
flatpak install flathub com.slack.Slack
flatpak install flathub com.discordapp.Discord
flatpak install flathub net.lutris.Lutris  
