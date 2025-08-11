# Dotfiles & Environment Setup

This repository contains development environment configuration and automated setup script.  
It makes having the same essential tools, apps, and shell configuration easy - making environment setup fast and consistent with one command.

## Quick Start

### 1. Set Up Git SSH

Apple macOS includes Git by default, so first ensure your SSH keys are set up to securely clone repositories.

If you already have SSH keys set up and added to your Git provider, you can skip this step.

1. Generate a new SSH key (if needed):

   ```bash
   ssh-keygen -t ed25519 -C "your.email@example.com"
   ```

2. Start the SSH agent:

   ```bash
   eval "$(ssh-agent -s)"
   ```

3. Add your SSH key to the agent:

   ```bash
   ssh-add ~/.ssh/id_ed25519
   ```

4. Copy your public key and add it to your Git provider (GitHub/GitLab/Bitbucket):

   ```bash
   pbcopy < ~/.ssh/id_ed25519.pub
   ```

   [GitHub SSH setup guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

### 2. Clone Dotfiles & Run Setup Script

Once SSH is set up, clone the dotfiles repository:

```bash
git clone git@github.com:ptrln216/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

chmod +x setup.sh
./setup.sh
```

The setup.sh script will:

- Install Homebrew if missing
- Install all CLI tools and apps listed in the Brewfile
- Install Oh My Zsh if missing
- Clone zsh-syntax-highlighting and powerlevel10k plugins
- Install nvm (Node Version Manager)
- Apply your Zsh configuration with GNU Stow
- Prompt you to input your Git global username and email if they are not set
