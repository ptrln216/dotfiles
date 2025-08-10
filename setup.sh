#!/bin/bash
set -e

echo "Starting environment setup..."

# Clone Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed."
fi

# Define Oh My Zsh custom directories
OH_MY_ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
PLUGINS_DIR="${OH_MY_ZSH_CUSTOM}/plugins"
THEMES_DIR="${OH_MY_ZSH_CUSTOM}/themes"

# Clone zsh-syntax-highlighting
if [ ! -d "${PLUGINS_DIR}/zsh-syntax-highlighting" ]; then
  echo "Cloning zsh-syntax-highlighting plugin..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${PLUGINS_DIR}/zsh-syntax-highlighting"
else
  echo "zsh-syntax-highlighting already installed."
fi

# Clone powerlevel10k theme
if [ ! -d "${THEMES_DIR}/powerlevel10k" ]; then
  echo "Cloning powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${THEMES_DIR}/powerlevel10k"
else
  echo "powerlevel10k theme already installed."
fi

# Clone nvm
if [ ! -d "$HOME/.nvm" ]; then
  echo "Cloning nvm..."
  git clone https://github.com/nvm-sh/nvm.git .nvm
else
  echo "nvm already installed."
fi

echo "Setup complete!"
