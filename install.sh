#!/bin/bash

echo "SETUP DOTFILES..."

# 1. Remove dir and create Symlink
echo "Create Symlink..."
rm -f ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

rm -rf ~/.config/nvim ~/.config/kitty
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/kitty ~/.config/kitty

# 2. Download zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh isn't installed. Installing..."
    # --unattended flag create not to jump into zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 3. Auto install plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

# 4. Check and install fzf, zoxide
echo "🔍 Kiểm tra các công cụ hệ thống..."

# Kiểm tra fzf
if ! command -v fzf &> /dev/null; then
    echo "fzf isn't installed. Installing..."
    sudo zypper in -y fzf
else
    echo "fzf installed"
fi

# Kiểm tra zoxide
if ! command -v zoxide &> /dev/null; then
    echo "zoxide isnt installed. Installing"
    sudo zypper in -y zoxide
else
    echo "zoxide installed"
fi

echo "Done."
