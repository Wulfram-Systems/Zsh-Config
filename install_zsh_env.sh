#!/bin/bash

set -e

echo "[*] Updating package list and installing zsh/git..."
sudo apt update && sudo apt install -y zsh git curl

echo "[*] Installing Oh My Zsh..."
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[*] Installing zsh plugins..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "[*] Writing custom .zshrc..."
cat > ~/.zshrc << 'EOF'
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="example"

# Plugins to load
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Display Banner
cat <<'BANNER'

  __      __            ___       ___
 /\ \  __/\ \          /\_ \    /'___\
 \ \ \/\ \ \ \   __  __\//\ \  /\ \__/
  \ \ \ \ \ \ \ /\ \/\ \ \ \ \ \ \ ,__\
   \ \ \_/ \_\ \\ \ \_\ \ \_\ \_\ \ \_/
    \ `\___x___/ \ \____/ /\____\\ \_\
     '\/__//__/   \/___/  \/____/ \/_/  v1.1 Wulfram Systems

BANNER
EOF

echo "[*] Changing default shell to zsh..."
chsh -s $(which zsh)

echo "[✔] Installation complete! Open a new terminal or run 'zsh' to start using it."
