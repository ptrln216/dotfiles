# Dotfiles & Environment Setup

A simple way to set up a consistent macOS development environment with one command.  
Includes shell configuration, CLI tools, apps, and Node.js setup.

## Quick Start

### 1. Set Up Git SSH

macOS includes Git by default. First, configure SSH to securely clone repositories.

If you already have SSH keys set up and added to your Git provider, skip this step.

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

### 2. Clone & Run Setup Script

```bash
git clone git@github.com:ptrln216/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x setup.sh
./setup.sh
```

**What setup.sh does:**

- Installs Homebrew (if missing)
- Installs CLI tools & apps from Brewfile
- Installs Oh My Zsh (if missing) with plugins & themes
- Applies Zsh config via GNU Stow
- Prompts for Git username & email (if unset)

### 3. Install Node.js (if missing)

If node is not installed yet, run below command

```bash
nvm install --lts   # Latest Node.js LTS
node -v             # Verify installation
```

### 4. (Optional) NeoVim Config

Use NvChad, check the [installation guide](https://nvchad.com/docs/quickstart/install).

### 🎉 Congratulations

You're ready to go! You now have a consistent, reproducible setup for future machines, including:

#### A fully configured Zsh shell

- powerlevel10k (theme)
- zsh-syntax-highlighting
- z - remember your frequent visit paths
- git - convenient aliases for git operations
- zsh-nvm - auto use node version as listed in .nvmrc

#### Essential CLI tools and productivity apps

- git
- neovim
- pnpm
- ripgrep
- stow
- amazon-q
- font-sauce-code-pro-nerd-font
- visual-studio-code

#### Node.js (latest LTS) via nvm

#### Git configured with your name & email
