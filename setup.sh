#!/bin/bash
set -e

echo "🚀 Starting environment setup..."

# --- 1. Install Homebrew if missing ---
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "🍺 Homebrew is already installed."
fi

# Ensure brew is in PATH (for non-login shells)
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null || echo '')"

# --- 2. Install packages/apps from Brewfile ---
if [[ -f Brewfile ]]; then
  echo "📦 Installing packages and apps from Brewfile..."
  brew bundle --file=./Brewfile
else
  echo "⚠️ Brewfile not found. Skipping package installation."
fi

# --- 3. Install Oh My Zsh if missing ---
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "💡 Installing Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "💡 Oh My Zsh already installed."
fi

# --- 4. Install zsh plugins ---
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
  echo "🔌 Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "🔌 zsh-syntax-highlighting already installed."
fi

if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]]; then
  echo "🎨 Installing powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "🎨 powerlevel10k theme already installed."
fi

# --- 5. Install nvm if missing ---
if [ ! -d "$HOME/.nvm" ]; then
  echo "Cloning nvm..."
  git clone https://github.com/nvm-sh/nvm.git .nvm
else
  echo "🛠 nvm already installed."
fi

# --- 6. Apply dotfiles with GNU Stow ---
if command -v stow >/dev/null 2>&1; then
  echo "📂 Applying dotfiles using GNU Stow..."

  ZSHRC_PATH="$HOME/.zshrc"
  if [[ -f "$ZSHRC_PATH" ]]; then
    echo "Removing existing .zshrc..."
    rm "$ZSHRC_PATH"
  fi

  stow zsh
else
  echo "⚠️ GNU Stow not found. Please install it manually or add it to Brewfile."
fi

# --- 7. Interactive Git global config if not set ---
current_name=$(git config --global user.name || true)
current_email=$(git config --global user.email || true)

if [[ -z "$current_name" || -z "$current_email" ]]; then
  echo "🔧 Git global user.name and/or user.email not set."
  read -rp "Enter your full name for Git config: " git_name
  git config --global user.name "$git_name"

  read -rp "Enter your email address for Git config: " git_email
  git config --global user.email "$git_email"
fi

# Always set push.autoSetupRemote=true
git config --global push.autoSetupRemote true

echo "✅ Git configuration:"
echo "   user.name: $(git config --global user.name)"
echo "   user.email: $(git config --global user.email)"
echo "   push.autoSetupRemote: $(git config --global push.autoSetupRemote)"

echo "🎉 Setup complete! Please restart your terminal."
