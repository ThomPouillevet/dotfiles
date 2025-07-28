# Dotfiles Setup Guide

A comprehensive dotfiles repository for macOS development environment setup optimized for Ruby on Rails development.

## Stack Overview

### Development Tools
- **Ruby**: mise, Ruby 3.3.0, essential gems
- **Rails**: Latest stable version with Rails-native tooling
- **Frontend**: Tailwind CSS, Stimulus, Hotwire (Turbo & Stimulus)
- **Databases**: PostgreSQL, Redis (not always needed if using the default SQLite trifecta)
- **Containers**: Docker, Docker Compose

### Applications
- **Editors**: Cursor (primary), VS Code (secondary)
- **Terminal**: iTerm2
- **Browsers**: Brave
- **Communication**: Slack
- **Productivity**: Raycast, AeroSpace, Ice (menu bar manager)

## Prerequisites

### Xcode Command Line Tools

```bash
xcode-select --install
```

### SSH Key Setup

```bash
mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "TYPE_YOUR_EMAIL@HERE.com"
```

Collect public key and add it to [github.com/settings/ssh](https://github.com/settings/ssh)

```bash
cat ~/.ssh/id_ed25519.pub
```

## Installation

### Clone and Setup

```bash
cd ~
git clone git@github.com:YOUR_USERNAME/dotfiles.git
cd dotfiles
find ~/dotfiles -name '*.sh' | xargs -I file chmod u+x file
```

### Homebrew (Package Manager)

Installs essential development tools, applications, and fonts.

```bash
sh brew/brew.sh
```

### Git Configuration

Sets up Git with modern settings, useful aliases, and pre-commit hooks.

```bash
sh git/git.sh
```

### ZSH Shell

Installs Oh-My-Zsh with plugins and custom configuration.

```bash
sh zsh/zsh.sh
```

### Ruby Environment

Installs mise (modern Ruby version manager) and modern Ruby versions with essential gems.

```bash
sh ruby/mise.sh
```

### SSH Configuration

```bash
cp ssh/config ~/.ssh/config
```

### Cursor Editor

Configures Cursor with your personal Ruby on Rails optimized settings and Hyper Dracula theme.

```bash
sh cursor/cursor.sh
```

**Note:**
- These settings were migrated from VS Code to Cursor
- The Hyper Dracula theme was not in the cursor extension store by default. I had to install it manually. If needed, the Extension ID is `hilalh.hyper-dracula-vscode-theme` [Marketplace Link](https://marketplace.visualstudio.com/items?itemName=hilalh.hyper-dracula-vscode-theme)

### AeroSpace Window Manager

Installs and configures AeroSpace for tiling window management.

```bash
sh aerospace/aerospace.sh
```
